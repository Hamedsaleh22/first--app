import 'package:flutter/material.dart';

import 'package:login_screen/pages.dart/Homescreen.dart';
import 'package:login_screen/pages.dart/Register.dart';
import 'package:provider/provider.dart';
import 'dart:ffi';

import '../provider/login_provider.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailadress = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool ispass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150.0),
                  Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Text(
                    " login now to browse our hot offers",
                    style: TextStyle(color: Colors.grey, fontSize: 10.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 60,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailadress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Enter email adress";
                        } else if (value.length < 5) {
                          return " The text cannot be less than 5 characters";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text('Email address'),
                        prefixIcon: Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    child: TextFormField(
                      controller: password,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Enter password";
                        }

                        return null;
                      },
                      obscureText: ispass,
                      decoration: InputDecoration(
                          label: Text('password'),
                          prefixIcon: Icon(Icons.lock),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                ispass = !ispass;
                              });
                            },
                            icon: Icon(ispass
                                ? Icons.visibility_off_outlined
                                : Icons.visibility),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Consumer<LoginProvider>(
                    builder: (context, login, child) {
                      return Center(
                        child: RaisedButton(
                          onPressed: () {
                            login
                                .login(
                              email: emailadress.text,
                              password: password.text,
                            )
                                .then((value) {
                              //
                              if (formkey.currentState!.validate()) {
                                if (login.loginModel!.status == false) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        login.loginModel!.message.toString()),
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.blue,
                                  ));
                                } else {
                                  if (login.loginModel!.status == true) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          login.loginModel!.message.toString()),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: Colors.blue,
                                    ));

                                    login.loginModel! == null
                                        ? Center(
                                            child: CircularProgressIndicator(
                                                color: Colors.blue),
                                          )
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()));
                                  }
                                }
                              } // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                            });
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 80),
                          child: Text(
                            "login",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Register();
                          }));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.blue, fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
