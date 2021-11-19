// ignore: file_names
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'home_widget.dart';

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
            // child: new Text("Hk"),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(children: [
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white30)),
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
                        onPressed: () {},
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





/*
class Home extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State {
  final List _children = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        //selectedIconTheme: IconThemeData(color: Color(0xff123456)),
        unselectedItemColor: (Color(0xff123456)),
        selectedItemColor: (Color(0xff123456)),
        selectedLabelStyle:
            TextStyle(fontFamily: 'cairo', fontSize: 10, height: 1.2),
        unselectedLabelStyle: TextStyle(fontFamily: 'cairo', fontSize: 10),

        backgroundColor: Colors.yellow[400],
        iconSize: 20,

        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.donut_small_outlined),
            title: new Text('Rides'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone), title: Text('Contact Us'))
        ],
      ),
    );
  }
}

*/