import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import 'package:nile_tubing_app/screens/profile.dart';
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
  CollectionReference users = FirebaseFirestore.instance.collection('Rides');
  List<String> _timeSlots = <String>[];
  var selected;

  int _counter = 1;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
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
                          padding: EdgeInsets.only(left: 150),
                          child: Row(children: [
                            IconButton(
                                icon: new Icon(Icons.person_outline_rounded,
                                    size: 35, color: Colors.yellow[700]),
                                onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()),
                                    )),
                          ]),
                        ),
                      ]),
                    ),
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
                            height: 400,
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
                                height: 10,
                              ),
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('Rides')
                                      .doc(widget.ID)
                                      .collection('RideSlots')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      const Text("Loading.....");
                                    } else {
                                      _timeSlots.clear();
                                      DocumentSnapshot snap =
                                          snapshot.data!.docs[0];
                                      final dates =
                                          snap['Date']; //list of timestamp
                                      final convertedDates = dates
                                          .map((date) => date.toDate())
                                          .toList();
                                      print(convertedDates[1]);
                                      for (int i = 0;
                                          i < convertedDates.length;
                                          i++) {
                                        _timeSlots
                                            .add(convertedDates[i].toString());
                                      }

                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          DropdownButton(
                                            items: _timeSlots
                                                .map(
                                                    (value) => DropdownMenuItem(
                                                          child: Text(
                                                            value,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF002E5C)),
                                                          ),
                                                          value: value,
                                                        ))
                                                .toList(),
                                            onChanged: (ridetime) {
                                              final snackBar = SnackBar(
                                                content: Text(
                                                  'Selected Time-Date is $ridetime',
                                                  style: TextStyle(
                                                      color: Color(0xff11b719)),
                                                ),
                                              );
                                              Scaffold.of(context)
                                                  .showSnackBar(snackBar);
                                              setState(() {
                                                selected = ridetime;
                                              });
                                            },
                                            value: selected,
                                            isExpanded: false,
                                            hint: Text(
                                              'Choose Time Slot',
                                              style: TextStyle(
                                                  color: Color(0xFF002E5C)),
                                            ),
                                          )
                                        ],
                                      );
                                    }
                                    return const Text("Loading.....");
                                  }),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'Quantity',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff123456),
                                    fontFamily: 'Cairo'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100.0),
                                child: Row(
                                  children: <Widget>[
                                    _counter != 1
                                        ? new IconButton(
                                            icon: new Icon(Icons.remove),
                                            onPressed: _decrementCounter,
                                          )
                                        : new Container(),
                                    new Text(_counter.toString()),
                                    new IconButton(
                                        icon: new Icon(Icons.add),
                                        onPressed: _incrementCounter)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        Color.fromRGBO(
                                                            238, 191, 15, 1))),
                                            onPressed: () {
                                              ridesmodel r = ridesmodel(
                                                  rideName: data['Name'],
                                                  ridePrice:
                                                      int.parse(data['Price']),
                                                  rideImage: data['Image']);
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CheckOut(
                                                            RideName:
                                                                r.rideName,
                                                            RidePrice:
                                                                r.ridePrice,
                                                            RideImage:
                                                                r.rideImage,
                                                            selected: selected,
                                                            counter: _counter,
                                                          )));
                                            },
                                            child: Text('Checkout',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontFamily: 'Cairo'))))
                                  ]),
                            ])),
                      ),
                    ),
                  ]);
                }

                return Text("");
              },
            ),
          ),
        ]));
  }
}
