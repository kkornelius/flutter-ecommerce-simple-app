import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart' as badges;
import 'package:blur/blur.dart'; // Add this import

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _ProfileState();
}

class _ProfileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market'),
        centerTitle: true,
        actions: [
          Center(
            child: badges.Badge(
              badgeContent: Text(
                '0',
                style: TextStyle(color: Colors.white),
              ),
              badgeAnimation: badges.BadgeAnimation.rotation(
                animationDuration: Duration(milliseconds: 300),
              ),
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index){
              return Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(index.toString())
                      ],
                    )
                  ],
                ),
              );
            }),
          )
        ],
      )
    );
  }
}
