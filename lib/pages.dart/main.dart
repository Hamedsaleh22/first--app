import 'package:flutter/material.dart';



import 'package:provider/provider.dart';

import '../provider/categories_provider.dart';
import '../provider/home_provider.dart';
import '../provider/login_provider.dart';
import '../provider/register_provider.dart';
import 'login.dart';
import 'dart:ffi';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          ChangeNotifierProvider(create: (context) => CategoryProvider()),
          ChangeNotifierProvider(create: (context) => RegisterProvider()),
          ChangeNotifierProvider(create: (context) => LoginProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: login(),
        ));
  }
}
