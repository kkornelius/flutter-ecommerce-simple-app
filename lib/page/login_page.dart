import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'profile.dart';
import 'session_model.dart';
import 'register.dart';
import 'package:simple_ecommerce/screen/home_page.dart';
import 'package:blur/blur.dart'; // Add this import

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SessionModel(),
      child: MaterialApp(
        home: LoginPage(),
      ),
    ),
  );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _secureText = true;

  Future<void> _login(BuildContext context) async {
    if (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      final response = await http.post(
        Uri.parse("https://api.solusidigitalunity.com/api/login"),
        body: {"email": _usernameController.text, "password": _passwordController.text},
      );
      print(response.body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Response data: $responseData');

        if (responseData.containsKey('token')) {
          final String token = responseData['token'];

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Success"),
                content: const Text("Login berhasil!"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ), // Navigate to the profile page
                      );
                    },
                  ),
                ],
              );
            },
          );
        } else {
          showErrorDialog(responseData['message'] ?? "Email atau password tidak sesuai");
        }
      } else {
        showErrorDialog("Email atau password tidak sesuai");
      }
    } else {
      showErrorDialog("Username dan Password tidak boleh kosong");
    }
  }
  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Provider.of<SessionModel>(context, listen: false).clearSession();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: Blur(
              blur: 3.0,
              blurColor: Colors.blueAccent,
              child: Container(),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 80),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Image.asset("images/apple_logo.png", width: 80,),
                    ),
                    const Text(
                      'IPOX',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Poppins"
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: _secureText,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _login(context),
                  child: const Text('Masuk'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const <Widget>[
                    Expanded(child: Divider()),
                    SizedBox(width: 10),
                    Text('ATAU', style: TextStyle(color: Colors.white70)),
                    SizedBox(width: 10),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.facebook, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      'Masuk dengan Facebook',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Register()),
                        );
                      },
                      child: const Text(
                        'Daftar.',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.lock_open),
            onPressed: () async {
              SharedPreferences preferences = await SharedPreferences.getInstance();
              await preferences.clear();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
