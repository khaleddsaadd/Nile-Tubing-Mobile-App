// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/Home.dart';
import 'package:nile_tubing_app/screens/Payment.dart';
import 'package:nile_tubing_app/screens/Rides.dart';
import 'package:nile_tubing_app/screens/signin.dart';

class CheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          children: [
            Container(
              height: 80,
              child: DrawerHeader(
                child: Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text('Nile Tubing')),
                decoration: BoxDecoration(color: Colors.yellow[700]),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text('Home'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                (Icons.donut_small_outlined),
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text('Rides'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Rides()),
                );
              },
            ),
            ListTile(
              leading: const Icon((Icons.phone)),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text('Contact us'),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon((Icons.logout_outlined)),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text('Log Out'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(children: [
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
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckOut())),
                    icon: Icon(Icons.local_grocery_store,
                        size: 35, color: Color(0xff123456)),
                  ),
                  IconButton(
                      icon: new Icon(Icons.person_outline_rounded,
                          size: 35, color: Colors.yellow[700]),
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          )),
                ],
              ),
            )
          ]),
          height: 100,
        ),
        Padding(
          padding: EdgeInsets.only(
              top: 10, bottom: 10), //apply padding to some sides only
          child: Text("Proceed To Payment",
              style: TextStyle(fontSize: 26, color: Colors.black),
              textAlign: TextAlign.center),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ]),
                height: 150,
                width: 160,
                child: Row(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            width: 110,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/Background.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Column(children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("TripName",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22.0)),
                                    )))),
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 20.0),
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: 30,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("TripDate",
                                          style: TextStyle(fontSize: 18.0)),
                                    )))),
                        Container(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                      child: Row(children: [
//Add Icon
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: Colors.blue[300],
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.add, size: 15),
                                        color: Colors.white,
                                        onPressed: () {},
                                      ),
                                    ),
//Counter
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text("1",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold))),
//Remove Icon
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: Colors.grey[300],
                                      ),
                                      child: IconButton(
                                        icon:
                                            const Icon(Icons.remove, size: 15),
                                        color: Colors.white,
                                        onPressed: () {},
                                      ),
                                    )
                                  ]))),
                              Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                      child: Container(
                                    child: Text("Total:250"),
                                  )))
                            ]))
                      ]))
                ]))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: 50,
            height: 80,
            child: Align(
              alignment: Alignment.center,
              child: Text("Sub Total: 300 USD",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  ButtonTheme(
                    minWidth: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Rides()),
                        );
                      },
                      color: Color(0x4DFFFFFF).withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("Add More",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.yellow,
                              fontFamily: 'Cairo')),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Payment()),
                          );
                        },
                        color: Color(0xff123456).withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Check Out",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: 'Cairo'))),
                  ),
                ]))
      ]),
    );
  }
}
