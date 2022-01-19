// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/rides.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nile_tubing_app/model/add_ride_admin.dart';
// import 'package:nile_tubing_app/screens/signup.dart';
// import 'Home.dart';
// import 'package:nile_tubing_app/services/authentication_services.dart';
// import 'package:provider/provider.dart';

class AddRide extends StatefulWidget {
  @override
  State<AddRide> createState() => _AddRideState();
}



class _AddRideState extends State<AddRide> {
  bool _isObscure = true;
  late ridesmodel rides;
  final _formKey = GlobalKey<FormState>();
  final RideTController = TextEditingController();
  final PriceController = TextEditingController();
  final DateController = TextEditingController();
  final RideDController = TextEditingController();
  final CapacityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: Column(children: [
              
                // IconButton(
                //     alignment: Alignment(-35, 5),
                //     icon: new Icon(
                //       Icons.arrow_back,
                //       color: Color(0xFF002E5C),
                //     ),
                //      onPressed: ()
                //     => Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (context) => ),
                //         )
                //     ),
               
                SizedBox(
                  height: 30,
                ),
              
                Text(
                  "Add Ride",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002E5C)),
                ),
                SizedBox(height: 20),
          Image.asset('assets/Add.png'),
          SizedBox(height: 20),

                //  StreamBuilder<QuerySnapshot>(
                //   stream: FirebaseFirestore.instance.collection("Rides").snapshots(),
                //   builder: (context, snapshot) {
                //     if (!snapshot.hasData)
                //       const Text("Loading.....");
                //     else {
                //       List<DropdownMenuItem> currencyItems = [];
                //       for (int i = 0; i < snapshot.data.documents.length; i++) {
                //         DocumentSnapshot snap = snapshot.data.documents[i];
                //         currencyItems.add(
                //           DropdownMenuItem(
                //             child: Text(
                //               snap.documentID,
                //               style: TextStyle(color: Color(0xff11b719)),
                //             ),
                //             value: "${snap.documentID}",
                //           ),
                //         );}}}),
                 TextFormField(
                  controller: RideDController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  // keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Ride Description',
                    hintText: "Ride Description",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
                const SizedBox(height: 10),
                
                TextFormField(
                  controller: PriceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Price',
                    hintText: "Price",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  obscureText: true,

                ),
                const SizedBox(height: 10),
                //  StreamBuilder<QuerySnapshot>(
                //   stream: FirebaseFirestore.instance.collection("Rides").snapshots(),
                //   builder: (context, snapshot) {
                //     if (!snapshot.hasData)
                //       const Text("Loading.....");
                //     else {
                //       List<DropdownMenuItem> currencyItems = [];
                //       for (int i = 0; i < snapshot.data.documents.length; i++) {
                //         DocumentSnapshot snap = snapshot.data.documents[i];
                //         currencyItems.add(
                //           DropdownMenuItem(
                //             child: Text(
                //               snap.documentID,
                //               style: TextStyle(color: Color(0xff11b719)),
                //             ),
                //             value: "${snap.documentID}",
                //           ),
                //         );}}}),
                // TextFormField(
                //   controller: DateController,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter some text';
                //     }
                //     return null;
                //   },
                //   keyboardType: TextInputType.emailAddress,
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Colors.white,
                //     border: OutlineInputBorder(
                //         borderSide: BorderSide.none,
                //         borderRadius: BorderRadius.circular(50)),
                //     labelText: 'Date',
                //     hintText: "Date",
                //     contentPadding: EdgeInsets.all(20.0),
                //   ),
                // ),
                 const SizedBox(height: 10),
                TextFormField(
                  controller: CapacityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Capacity',
                    hintText: "Capacity",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
                SizedBox(height: 10),
               
                Column(
                  children: [
                    SizedBox(width: 140),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[700]),
                      ),
                      child: Text(
                        'Add Ride',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                       onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        rides = ridesmodel(
                        // rideType: RideTController.text.trim(),
                        // ridePrice: PriceController.i.trim(),
                        rideCapacity: CapacityController.text.trim(),
                        
                      );

                    FirebaseFirestore.instance.collection('Arides').add({
                      // 'Name': '${rides.rideType}',
                      // 'Price': '${rides.rideCapacity}',
                      'Capacity': '${rides.rideCapacity}',
                    });
                    FirebaseFirestore.instance.
                     collection('tags').
                     document(tag).
                     set(data, SetOptions(merge: true))
                      };
                        } ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(height: 50),
                        SizedBox(width: 40),
                        
                        // TextButton(
                          // onPressed: () 
                          // {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => SignUp()),
                          //   );
                          //   // Respond to button press
                          // }
                          // ,
                          // child: Text(
                          //   "Sign Up",
                          //   style: TextStyle(
                          //     color: Colors.green[700],
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 20,
                      // ),
                      //     ),
                      //   )
                      ],
                    )
                  ],
                ),
              ]),
            )
          ])),
    );
  }
}
