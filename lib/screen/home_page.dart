import 'package:flutter/material.dart';
import 'package:simple_ecommerce/screen/header_parts.dart';
import 'package:simple_ecommerce/screen/items_diplay.dart';
import 'package:simple_ecommerce/utils/colors.dart';
import 'package:blur/blur.dart'; // Make sure to import this package

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set background to transparent
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'), // Your image path
                fit: BoxFit.cover,
              ),
            ),
            child: Blur(
              blur: 3.0,
              blurColor: Colors.blueAccent, // Adjust blur color as needed
              child: Container(), // You can add widgets inside the blur effect if needed
            ),
          ),
          ListView(
            children: const [
              SizedBox(height: 15),
              // Header section
              HeaderParts(),
              // Display items section
              ItemsDisplay(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                size: 30,
                color: Colors.blue,
              ),
              onPressed: () {
                // Implement action for Home menu
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.chat,
                color: Colors.blue,
              ),
              onPressed: () {
                // Implement action for Chat menu
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ),
              onPressed: () {
                // Implement action for Cart menu
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.blue,
              ),
              onPressed: () {
                // Implement action for Notification menu
              },
            ),
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite; // Toggle favorite status
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
