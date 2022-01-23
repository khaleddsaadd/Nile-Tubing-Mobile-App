// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: use_key_in_widget_constructors, unused_import, unused_import, duplicate_ignore, prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/SelectedRide.dart';
import 'package:nile_tubing_app/screens/profile.dart';
import 'package:nile_tubing_app/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nile_tubing_app/model/user_model.dart';
import 'package:nile_tubing_app/model/rides.dart';
import 'Home.dart';
import 'checkOut.dart';
import 'drawer.dart';

class Rides extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<Rides> createState() => _RidesState();
}

class _RidesState extends State<Rides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(),
        body: ListView(
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
                                    builder: (context) => Profile()),
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
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Rides').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Column(
                  children: snapshot.data!.docs.map((document) {
                    ridesmodel ridesM = ridesmodel(
                        rideName: document['Name'],
                        ridePrice: int.parse(document['Price']),
                        rideImage: document['Image']);

                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 25), //apply padding to some sides only
                          child: Text("${ridesM.rideName} ",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                              textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Image.asset('assets/${document['Image']}'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 25), //apply padding to some sides only
                          child: Text("${ridesM.ridePrice} EGP",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
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
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => SelectedRide()),
                                    // );
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SelectedRide(ID: document.id)));
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
                    );
                  }).toList(),
                );
              },
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
