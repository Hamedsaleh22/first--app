import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';

class person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Profile"),
        leading: Icon(Icons.search),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 250,
              child: Stack(children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://aboutflutter.com/wp-content/uploads/2021/12/aboutflutter.jpg"))),
                ),
                Positioned(
                  top: 130,
                  left: 150,
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.person,
                      size: 80,
                    ),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    "name",
                  ),
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    "phone",
                  ),
                  prefixIcon: Icon(Icons.phone),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    'pssword',
                  ),
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
