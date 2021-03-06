import 'package:flutter/material.dart';
import 'package:nile_tubing_app/model/Events.dart';
import 'package:nile_tubing_app/screens/Rides.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import 'package:nile_tubing_app/screens/drawer.dart';
import 'package:nile_tubing_app/screens/profile.dart';
import 'package:nile_tubing_app/screens/signin.dart';
import 'Rides.dart';
import 'package:nile_tubing_app/services/authentication_services.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(),
        body: ListView(children: [
//FirstPage
          Container(
              child: Column(
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
              padding: EdgeInsets.only(left: 150),
              child: Row(
                children: [
                  IconButton(
                      icon: new Icon(Icons.person_outline_rounded,
                          size: 35, color: Colors.yellow[700]),
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          )),
                ],
              ),
            )
          ]),
          height: 100,
        ),
                  SizedBox(height: 80),
                  Padding(
                    padding:
                        EdgeInsets.all(30), //apply padding to some sides only
                    child: Text("Go with the flow of the Nile River",
                        style: TextStyle(fontSize: 36, color: Colors.white),
                        textAlign: TextAlign.center),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 120),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Rides()),
                            );
                          },
                          color: Color(0xff123456).withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text("Book Now",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: 'Cairo')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Background.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.darken))),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),

//Second Page
          Container(
            decoration: new BoxDecoration(color: Colors.blue[900]),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Column(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/homepage1.jpeg"),
                          fit: BoxFit.cover,
                        )),
                        height: 380,
                        width: MediaQuery.of(context).size.width),
                  ),
                  Container(
                      child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                   
                  ))
                ])),
          ),
          Container(
            decoration: new BoxDecoration(color: Colors.white),
            height: MediaQuery.of(context).size.height*2,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "UP COMING EVENTS",
                      style: TextStyle(color: Colors.blue[900], fontSize: 24),
                    ),
                  )),
              Container(
                  child: Image.asset('assets/homepage2.jpeg'),
                  width: MediaQuery.of(context).size.width,
                  height: 400),
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('Events').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Column(
                    children: snapshot.data!.docs.map((document) {
                      Events event = Events(
                          EventName: document['Name'],
                          EventPrice: document['Price'],
                          //EventDescription: document['Description'],
                          EventType: document['Type'],
                          EventStart:
                              document['Start Date'].toDate().toString(),
                          EventEnd: document['End Date'].toDate().toString());

                      return Column(children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
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
                              height: 185,
                              width: 400,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Column(children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text("Name",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff123456)
                                                          .withOpacity(1),
                                                      fontFamily: 'Cairo')),
                                              Text("Price",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff123456)
                                                          .withOpacity(1),
                                                      fontFamily: 'Cairo')),
                                              Text("Type",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff123456)
                                                          .withOpacity(1),
                                                      fontFamily: 'Cairo')),
                                              Text("Start Date",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff123456)
                                                          .withOpacity(1),
                                                      fontFamily: 'Cairo')),
                                              Text("End Date",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff123456)
                                                          .withOpacity(1),
                                                      fontFamily: 'Cairo')),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text("${event.EventName}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xff123456)
                                                          .withOpacity(1),
                                                      fontFamily: 'Cairo')),
                                              Text("${event.EventPrice}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xff123456)
                                                          .withOpacity(1),
                                                      fontFamily: 'Cairo')),
                                              Text("${event.EventType}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xff123456)
                                                          .withOpacity(1),
                                                      fontFamily: 'Cairo')),
                                              Text("${event.EventStart}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xff123456)
                                                          .withOpacity(1),
                                                      fontFamily: 'Cairo')),
                                              Text("${event.EventEnd}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xff123456)
                                                          .withOpacity(1),
                                                      fontFamily: 'Cairo')),
                                            ],
                                          ),
                                        ]),
                                    Container(
                                        child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        RaisedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CheckOut()),
                                            );
                                          },
                                          color:
                                              Color(0xff123456).withOpacity(1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(" Book Now ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontFamily: 'Cairo')),
                                        ),
                                      ],
                                    ))
                                  ])),
                            ))

                       
                      ]);
                    }).toList(),
                  );
                },
              ),
            ]),
          ),
        ]));
  }
}
