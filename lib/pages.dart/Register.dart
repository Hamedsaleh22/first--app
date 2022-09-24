import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:login_screen/pages.dart/Homescreen.dart';
import 'dart:ffi';

import 'package:provider/provider.dart';

import '../provider/register_provider.dart';



class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

var formKey = GlobalKey<FormState>();
var nameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var phoneController = TextEditingController();

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKey,
      child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Register now to se our products",
                  style: TextStyle(color: Colors.grey, fontSize: 10.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your name address';
                    }
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'name',
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
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter youre mail';
                    }
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'email',
                    prefixIcon: Icon(Icons.email),
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
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your phone number';
                    }
                  },
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: 'phone',
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
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your password';
                    }
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'password',
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
                SizedBox(
                  height: 20.0,
                ),
                Consumer<RegisterProvider>(
                  builder: (context, regprov, child) {
                    return Center(
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            regprov
                                .register(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                            )
                                .then((value) {
                              if (regprov.registerModel!.status == false) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(regprov.registerModel!.message
                                      .toString()),
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.blue,
                                ));
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              }
                            });
                          }
                        },
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0),
                        ),
                        color: Colors.blue,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    ));
  }
}
