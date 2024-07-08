import 'package:flutter/material.dart';
import 'package:simple_ecommerce/page/login_page.dart';
import 'package:simple_ecommerce/utils/colors.dart';
import 'package:blur/blur.dart'; // Add this import

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

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
          Center(
            child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "images/apple_logo.png",
                  height: 200,
                  width: 200,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "IPOX",
                    style: TextStyle(
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.white,
                      fontFamily: 'Poppins',

                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "'Think Different'",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.italic
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 55,
                  margin: const EdgeInsets.all(20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  LoginPage()));
                      },
                      child: const Text(
                        "Let's Find Out",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: primaryColors,
                        ),
                      )),
                )
              ],
             ),
            ),
          ),
        ],
      ),
    );
  }
}