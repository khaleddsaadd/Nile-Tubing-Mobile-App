import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import '../modules/home_widget.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import 'signin.dart';
import 'Rides.dart';

class SelectedRide extends StatelessWidget {
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
        body: ListView(
      padding: EdgeInsets.all(15),
      children: [
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
              padding: EdgeInsets.only(left: 83),
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
