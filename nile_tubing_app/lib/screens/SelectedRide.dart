import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import '../modules/home_widget.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';

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
            Icon(Icons.local_grocery_store, size: 35, color: Color(0xff123456)),
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
            padding: EdgeInsets.all(30),
            height: 350,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
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
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(children: const [
                  Text('200 EGP',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff123456),
                          fontFamily: 'Cairo'),
                      textAlign: TextAlign.left),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Per person',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff123456),
                        fontFamily: 'Cairo',
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(
                    height: 25,
                  ),
                  Text('Date',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff123456),
                          fontFamily: 'Cairo'),
                      textAlign: TextAlign.left),
                  SizedBox(
                    height: 25,
                  ),
                  Text('Person',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff123456),
                          fontFamily: 'Cairo'),
                      textAlign: TextAlign.left),
                ]),
              ),
              SizedBox(
                height: 50,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white30)),
                    onPressed: () {},
                    child: Text('Add to cart',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.yellow,
                            fontFamily: 'Cairo'))),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xff123456))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckOut()),
                      );
                    },
                    child: Text('Checkout',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Cairo')))
              ])
            ])),
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text("Description",
              style: TextStyle(
                  fontSize: 25, color: Color(0xff123456), fontFamily: 'Cairo'),
              textAlign: TextAlign.center),
        ),
        SizedBox(
          height: 150,
        ),
      ],
    ));
  }
}
