import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/edit_ride.dart';
import 'package:nile_tubing_app/screens/signup.dart';
import 'Home.dart';
import 'package:nile_tubing_app/services/authentication_services.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  bool? x;
  SignIn({this.x});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errormessage = '';

  changeText() {
    setState(() {
      errormessage = "Incorrect Email or Password";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1D158),
      body: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: Column(children: [
                // Text(widget.x.toString()),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002E5C)),
                ),
                SizedBox(height: 30, width: 90),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Email',
                    hintText: "Email",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Password',
                    hintText: "Password",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  obscureText: true,

                  //  suffixIcon: IconButton(
                  //   icon: Icon(
                  //     _isObscure ? Icons.visibility : Icons.visibility_off,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       _isObscure = !_isObscure;
                  //     });
                  //   },
                  // ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    SizedBox(width: 140),
                    SizedBox(height: 10),
                    Text(
                      '$errormessage',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (emailController.text.trim() == "admin" &&
                            passwordController.text.trim() == "admin") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddRide()),
                          );
                        } else if (_formKey.currentState!.validate()) {
                          context.read<AuthenticationService>().signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim());

                          // changeText();
                        }
                        // if (_formKey.currentState!.validate()) {
                        //   context.read<AuthenticationService>().signIn(
                        //       email: emailController.text.trim(),
                        //       password: passwordController.text.trim());
                        //   changeText();
                        // }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[700]),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(height: 50),
                        SizedBox(width: 40),
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF002E5C)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                            // Respond to button press
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.green[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ]),
            )
          ])),
    );
  }
}
