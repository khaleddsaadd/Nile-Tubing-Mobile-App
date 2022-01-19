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
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            FutureBuilder<DocumentSnapshot>(
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
                  ridesmodel r = ridesmodel(
                      rideName: data['Name'],
                      ridePrice: int.parse(data['Price']));

                  return Column(
                    children: [
                      // Text("${r.rideName} "),
                      // Text("${data['Price']} ")
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
                        height: 100,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text("${r.rideName} ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color(0xff123456),
                                fontFamily: 'Cairo'),
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          padding: EdgeInsets.all(30),
                          height: 450,
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
                              child: Column(children: [
                                Text("${r.ridePrice} ",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Color(0xff123456),
                                        fontFamily: 'Cairo'),
                                    textAlign: TextAlign.center),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Per person',
                                    style: TextStyle(
                                      fontSize: 13,
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
                                TextField(
                                  controller:
                                      dateinput, //editing controller of this TextField
                                  decoration: InputDecoration(
                                      icon: Icon(Icons
                                          .calendar_today), //icon of text field
                                      labelText:
                                          "Enter Date" //label text of field
                                      ),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement

                                      setState(() {
                                        dateinput.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text('Capacity',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Color(0xff123456),
                                        fontFamily: 'Cairo'),
                                    textAlign: TextAlign.left),
                                SizedBox(
                                  width: 60,
                                  height: 50,
                                  child: TextField(
                                    controller: capacityController,
                                    // decoration: new InputDecoration(
                                    //     labelText: "Enter your number"),

                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ], // Only numbers can be entered
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white30)),
                                      onPressed: () {},
                                      child: Text('Add to cart',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.yellow[400],
                                              fontFamily: 'Cairo'))),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color(0xff123456))),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => CheckOut(
                                                      RideName: r.rideName,
                                                      RidePrice: r.ridePrice
                                                          .toString(),
                                                    )));
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
                                fontSize: 25,
                                color: Color(0xff123456),
                                fontFamily: 'Cairo'),
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: 150,
                      ),
                    ],
                  );
                }
                return Text("loading");
              },
            ),
          ],
        ));
  }
}
