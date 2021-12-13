// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: use_key_in_widget_constructors, unused_import, unused_import, duplicate_ignore, prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/SelectedRide.dart';

class Rides extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<Rides> createState() => _RidesState();
}

class _RidesState extends State<Rides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        // ignore: sized_box_for_whitespace

        Container(
          // ignore: prefer_const_literals_to_create_immutables
          child: Row(children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            Image.asset('assets/NTLogo.png'),
            Padding(
              padding: EdgeInsets.only(left: 110),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart,
                        size: 35, color: Color.fromRGBO(0, 46, 92, 1)),
                    onPressed: () {},
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.person_outline_rounded,
                          size: 35, color: Colors.yellow)),
                ],
              ),
            )
          ]),
          height: 80,
        ),
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(height: 50,),
             Text("Nile Tubing",
                  style: TextStyle(
                      fontSize: 50, color: Color.fromRGBO(0, 46, 92, 1)),
                  textAlign: TextAlign.center),
            
            Text("Rides",
                style: TextStyle(
                    fontSize: 50, color: Color.fromRGBO(0, 46, 92, 1)),
                textAlign: TextAlign.center),
            Image.asset('assets/Rides.png'),
          ],
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectedRide()),
                    );
                  },
                  child: Text('Book Now')),
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectedRide()),
                    );
                  },
                  child: Text('Book Now')),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25), //apply padding to some sides only
          child: Text("Group Tubing Ride",
              style: TextStyle(fontSize: 30, color: Colors.black),
              textAlign: TextAlign.center),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Image.asset('assets/group.jpg'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25), //apply padding to some sides only
          child: Text("350 EGP",
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectedRide()),
                    );
                  },
                  child: Text('Book Now')),
            ],
          ),
        ),
      ],
    ));
  }
}
