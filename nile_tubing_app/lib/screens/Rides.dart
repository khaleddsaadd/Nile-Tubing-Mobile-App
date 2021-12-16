// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: use_key_in_widget_constructors, unused_import, unused_import, duplicate_ignore, prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/SelectedRide.dart';
import 'package:nile_tubing_app/screens/signin.dart';

import 'Home.dart';
import 'checkOut.dart';

class Rides extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<Rides> createState() => _RidesState();
}

class _RidesState extends State<Rides> {
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
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckOut())),
                        icon: Icon(Icons.local_grocery_store,
                            size: 35, color: Color(0xff123456)),
                      ),
                      IconButton(
                          icon: new Icon(Icons.person_outline_rounded,
                              size: 35, color: Colors.yellow[700]),
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              )),
                    ],
                  ),
                )
              ]),
              height: 80,
            ),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 50,
                ),
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
              padding:
                  EdgeInsets.only(top: 25), //apply padding to some sides only
              child: Text("Single Tubing Ride",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Image.asset('assets/s.jpeg'),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 25), //apply padding to some sides only
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
                          MaterialPageRoute(
                              builder: (context) => SelectedRide()),
                        );
                      },
                      child: Text('Book Now')),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: FavoriteWidget(),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 25), //apply padding to some sides only
              child: Text("Couple Tubing Ride",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Image.asset('assets/couple.jpg'),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 25), //apply padding to some sides only
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
                          MaterialPageRoute(
                              builder: (context) => SelectedRide()),
                        );
                      },
                      child: Text('Book Now')),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: FavoriteWidget(),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 25), //apply padding to some sides only
              child: Text("Group Tubing Ride",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Image.asset('assets/group.jpg'),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 25), //apply padding to some sides only
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
                          MaterialPageRoute(
                              builder: (context) => SelectedRide()),
                        );
                      },
                      child: Text('Book Now')),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: FavoriteWidget(),
            ),
          ],
        ));
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  String _favoriteCount = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: _toggleFavorite,
          icon:
              _isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          color: Colors.red[500],
        ),
        Text('$_favoriteCount'),
      ],
    );
  }

  _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount = "";
        _isFavorited = false;
      } else {
        _favoriteCount = "Added to favorites";
        _isFavorited = true;
      }
    });
  }
}
