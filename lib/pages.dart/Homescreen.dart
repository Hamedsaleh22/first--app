import 'package:flutter/material.dart';



import 'dart:ffi';

import 'package:login_screen/pages.dart/Homepage.dart';
import 'package:login_screen/pages.dart/categories.dart';
import 'package:login_screen/pages.dart/person.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    Homepage(),
    Category(),
    person(),
  ];

  @override
  Widget build(BuildContext context) {
    print("context");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: pages[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "MyHome",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "MyAccount"),
        ],
      ),
    );
  }
}
