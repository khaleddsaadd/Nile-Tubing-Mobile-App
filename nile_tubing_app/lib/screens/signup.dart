import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/signin.dart';
import 'Home.dart';
import 'package:flutter/services.dart';
import 'package:nile_tubing_app/services/authentication_services.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:nile_tubing_app/model/user_model.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final myControllerF = TextEditingController();
  final myControllerL = TextEditingController();
  final myControllerM = TextEditingController();
  final myControllerE = TextEditingController();
  final myControllerP = TextEditingController();
  final myControllerCP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1D158),
      body: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              child: Column(children: [
                IconButton(
                    alignment: Alignment(-35, 5),
                    icon: new Icon(
                      Icons.arrow_back,
                      color: Color(0xFF002E5C),
                    ),
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002E5C)),
                ),
                SizedBox(height: 30, width: 90),
                TextFormField(
                  controller: myControllerF,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'First Name',
                    hintText: "First Name",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: myControllerL,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Last Name',
                    hintText: "Last Name",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: myControllerM,
                  //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Mobile Number',
                    hintText: "Mobile Number",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: myControllerE,
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
                  controller: myControllerP,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
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
                SizedBox(height: 20),
                TextFormField(
                  controller: myControllerCP,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password again';
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
                    labelText: 'Confirm Password',
                    hintText: "Confirm Password",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    SizedBox(width: 140),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthenticationService>().signUp(
                              email: myControllerE.text.trim(),
                              password: myControllerP.text.trim(),
                              fname: myControllerF.text.trim(),
                              lname: myControllerL.text.trim(),
                              mobile: myControllerM.text.trim());
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[700]),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(height: 50),
                        SizedBox(width: 40),
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF002E5C)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignIn()),
                            );
                            // Respond to button press
                          },
                          child: Text(
                            "Sign In",
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
