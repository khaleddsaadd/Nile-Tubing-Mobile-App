// ignore: file_names
import 'package:flutter/material.dart';

class SelectedRide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(15),
      children: [
        Container(
          height: 100,
          child: Row(children: [
            Image.asset('assets/NTLogo.png'),
            SizedBox(
              width: 180,
            ),
            Icon(Icons.shopping_cart, size: 35, color: Color(0xff123456)),
            SizedBox(
              width: 15,
            ),
            Icon(Icons.person_outline_rounded, size: 35, color: Colors.yellow),
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text("Single Tubing Rides",
              style: TextStyle(
                  fontSize: 25, color: Color(0xff123456), fontFamily: 'Cairo'),
              textAlign: TextAlign.center),
        ),
        SizedBox(
          height: 40,
        ),
        new Container(
          padding: EdgeInsets.all(25),
          height: 350,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              //background color of box
              BoxShadow(
                color: Colors.grey,
                blurRadius: 30.0, // soften the shadow
                spreadRadius: 4.0, //extend the shadow
                offset: Offset(
                  0, // Move to right 10  horizontally
                  5, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: new Text("H"),
        ),
      ],
    ));
  }
}
