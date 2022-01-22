import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import '../modules/home_widget.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nile_tubing_app/model/rides.dart';
import 'signin.dart';
import 'Rides.dart';
import 'drawer.dart';
import 'package:intl/intl.dart';

class SelectedRide extends StatefulWidget {
  String? ID;
  SelectedRide({this.ID});

  @override
  State<SelectedRide> createState() => _SelectedRideState();
}

class _SelectedRideState extends State<SelectedRide> {
  TextEditingController dateinput = TextEditingController();
  final capacityController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('Rides');

  get color => null;

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(),
        body: ListView(children: [
          Container(
            child: FutureBuilder<DocumentSnapshot>(
              future: users.doc(widget.ID).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Column(children: [
                    Container(
                      child: Row(children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                            )),
                        Image.asset(
                          'assets/NTLogo.png',
                          width: 80,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 103),
                          child: Row(children: [
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
                      ]),
                    ),
                    //Text(" ${data['Price']}\n${data['Name']}"),

                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text("${data['Name']}",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff123456),
                              fontFamily: 'Cairo'),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Card(
                        elevation: 28,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40))),
                            width: 300,
                            height: 350,
                            child: Column(children: [
                              Padding(padding: EdgeInsets.all(16)),
                              Text(
                                "${data['Price']} ",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff123456),
                                    fontFamily: 'Cairo'),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Per person',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff123456),
                                  fontFamily: 'Cairo',
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'Date',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff123456),
                                    fontFamily: 'Cairo'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('Rides')
                                    .doc(widget.ID)
                                    .collection('RideSlots')
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  return Column(
                                    children:
                                        snapshot.data!.docs.map((document) {
                                      return Column(
                                        children: [
                                          Center(
                                              child: Text(document['Date']
                                                  .toDate()
                                                  .toString())),
                                        ],
                                      );
                                    }).toList(),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'Capacity',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff123456),
                                    fontFamily: 'Cairo'),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .all<Color>(Color.fromRGBO(
                                                        238, 191, 15, 1))),
                                        onPressed: () {},
                                        child: Text('Add to cart',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontFamily: 'Cairo'))),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Color(0xff123456))),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CheckOut()));
                                        },
                                        child: Text('Checkout',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontFamily: 'Cairo')))
                                  ]),
                            ])),
                      ),
                    ),
                  ]);
                }

                return Text("loading");
              },
            ),
          ),
          // StreamBuilder(
          //   stream: FirebaseFirestore.instance
          //       .collection('Rides')
          //       .doc(widget.ID)
          //       .collection('RideSlots')
          //       .snapshots(),
          //   builder:
          //       (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //     if (!snapshot.hasData) {
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }

          //     return Column(
          //       children: snapshot.data!.docs.map((document) {
          //         return Column(
          //           children: [
          //             Center(child: Text(document['Date'].toDate().toString())),
          //           ],
          //         );
          //       }).toList(),
          //     );
          //   },
          // ),
        ]));
  }
}
