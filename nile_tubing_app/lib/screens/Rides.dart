import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/Rides.dart';
import 'package:nile_tubing_app/screens/drawer.dart';
import 'package:nile_tubing_app/screens/profile.dart';
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
  @override
  State<Rides> createState() => _RidesState();
}

class _RidesState extends State<Rides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.yellow[100],
        drawer: drawer(),
        body: ListView(
          children: [
            Container(
              child: Row(children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                Image.asset('assets/NTLogo.png'),
                Padding(
                  padding: EdgeInsets.only(left: 160),
                  child: Row(
                    children: [
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

            // ),
            SizedBox(
              height: 85,
            ),
            Container(
              child: Text("Nile Tubing",
                  style: TextStyle(
                      fontSize: 50, color: Color.fromRGBO(0, 46, 92, 1)),
                  textAlign: TextAlign.center),
            ),
            Container(
              child: Text("Rides",
                  style: TextStyle(
                      fontSize: 50, color: Color.fromRGBO(0, 46, 92, 1)),
                  textAlign: TextAlign.center),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/Rides.png'),
                )),
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
                        Container(
                          width: 330,
                          height: 450,
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                      topLeft: Radius.circular(30)),
                                  // color: Color(0xFF002E5C),
                                  // color: Colors.yellow[100],
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 30.0,
                                      offset: Offset(
                                        0,
                                        5,
                                      ),
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            25), //apply padding to some sides only
                                    child: Text("${ridesM.rideName} ",
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 30,
                                            color: Color(0xFF002E5C)),
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.asset(
                                          'assets/${document['Image']}',
                                          width: 270,
                                          height: 170,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            35), //apply padding to some sides only
                                    child: Text("${ridesM.ridePrice} EGP",
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.red),
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: FavoriteWidget(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 1, right: 15),
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              onPrimary:
                                                  Colors.white, // background
                                              primary: Color(0xFF002E5C),

                                              // foreground
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SelectedRide(
                                                              ID: document
                                                                  .id)));
                                            },
                                            child: Text('Book Now')),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40)
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
