import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page/session_model.dart';
import 'page/profile.dart';
import 'page/login_page.dart';
import 'package:simple_ecommerce/screen/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}