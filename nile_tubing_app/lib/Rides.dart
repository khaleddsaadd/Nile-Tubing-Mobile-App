// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: use_key_in_widget_constructors, unused_import, unused_import, duplicate_ignore, prefer_const_constructors, file_names
import 'package:flutter/material.dart';

class Rides extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          // ignore: prefer_const_literals_to_create_immutables
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset('assets/NTLogo.png'),
            Icon(Icons.shopping_cart, size: 35, color: Colors.white)
          ]),
          height: 100,
        ),
        Padding(
          padding: EdgeInsets.only(top: 25), //apply padding to some sides only
          child: Text("Single Tubing Ride",
              style: TextStyle(fontSize: 30, color: Colors.black),
              textAlign: TextAlign.center),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Image.asset('assets/s.jpeg'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25), //apply padding to some sides only
          child: Text("200 EGP",
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Book Now')),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25), //apply padding to some sides only
          child: Text("Couple Tubing Ride",
              style: TextStyle(fontSize: 30, color: Colors.black),
              textAlign: TextAlign.center),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Image.asset('assets/couple.jpg'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25), //apply padding to some sides only
          child: Text("250 EGP",
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Book Now')),
            ],
          ),
        ),
      ],
    ));
  }
}
