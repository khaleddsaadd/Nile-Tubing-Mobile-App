import 'package:flutter/material.dart';
import 'package:nile_tubing_app/model/Events.dart';
import 'package:nile_tubing_app/screens/Rides.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import 'package:nile_tubing_app/screens/drawer.dart';
import 'package:nile_tubing_app/screens/signin.dart';
import 'Rides.dart';
import 'package:nile_tubing_app/services/authentication_services.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
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
                    height: 100,
                    child: Row(children: [
                      Image.asset('assets/NTLogo.png'),
                      SizedBox(
                        width: 163,
                      ),
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
                    ]),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios, size: 35),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                            IconButton(
                              icon:
                                  const Icon(Icons.arrow_forward_ios, size: 35),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 60),
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
                    children: [
                      GestureDetector(
                          child: Text("Click here",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)),
                          onTap: () {}),
                      Icon(Icons.gesture, size: 35),
                    ],
                  ))
                ])),
          ),
          Container(
            decoration: new BoxDecoration(color: Colors.white),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(children: [
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
            stream: FirebaseFirestore.instance.collection('Events').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      // EventDescription: document['Description'],
                      EventType: document['Type'],
                      //  EventStart: document['Start Date'].toDate().toString(),
                      // EventEnd:document['End Date'].toDate().toString()
                    
                      );
                      
                  return Column(
                    children: [
                      Row(children: [
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
                                      child: Text("${event.EventName}",
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
                                      child: Text("${event.EventPrice}",
                                          style: TextStyle(fontSize: 18.0)),
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
                                      child: Text("${event.EventType}",
                                          style: TextStyle(fontSize: 18.0)),
                                    )))),                        
                      ]))
                ])
                      // Text("${event.EventName}"),
                      // Text("${event.EventPrice}")
              //         DataTable(  
              // columns: [  
               
              //   DataColumn(label: Text(  
              //       'Name',  
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
              //   )),  
              //   DataColumn(label: Text(  
              //       'Price',  
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
              //   )),
               
              //   DataColumn(label: Text(  
              //       'Type',  
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
              //   )),
              //   //   DataColumn(label: Text(  
              //   //     'Description',  
              //   //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
              //   // )),
              //   // DataColumn(label: Text(  
              //   //     'Start Date',  
              //   //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
              //   // )),
              //   //DataColumn(label: Text(  
              //   //     'End Date',  
              //   //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
              //   // )),
              //   DataColumn(label: Text(  
              //       'Test',  
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
              //   )),
                
              //   ],  
              // rows: [  
              //   DataRow(cells: [  

              //     DataCell(Text("${event.EventName}")),  
              //     DataCell(Text("${event.EventPrice}")),
              //     DataCell(Text("${event.EventType}")),
              //     // DataCell(Text("${event.EventDescription}")),
              //     // DataCell(Text("${event.EventStart}")),
             
              //     DataCell(RaisedButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context) => CheckOut()),
              //         );
              //       },
              //       color: Color(0xff123456).withOpacity(1),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20)),
              //       child: Text("Book Now",
              //           style: TextStyle(
              //               fontSize: 15,
              //               color: Colors.white,
              //               fontFamily: 'Cairo')),
              //     ),)
              //   ]),  

              //       ],)
                    ]);
                }).toList(),
              );
            },
          ),
              Container(
                  child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckOut()),
                      );
                    },
                    color: Color(0xff123456).withOpacity(1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text("Check Out!",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Cairo')),
                  ),
                ],
              ))
            ]),
          ),
          
        ]));
  }
}