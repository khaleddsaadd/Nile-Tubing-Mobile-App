// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/rides.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nile_tubing_app/model/add_ride_admin.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:nile_tubing_app/screens/admin.dart';

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

  List<String> _accountType = <String>[];
   List<DateTime> dates = <DateTime>[];
  
 

  var selectedType;
  final _formKey = GlobalKey<FormState>();
  final RideNController = TextEditingController();
  final RideTController = TextEditingController();
  final PriceController = TextEditingController();
  final DateController = TextEditingController();
  final RideDController = TextEditingController();
  final CapacityController = TextEditingController();

  final format = DateFormat("yyyy-MM-dd HH:mm");
  late DateTime dt;
  late Timestamp myTimeStamp;
  

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
              
                IconButton(
                    alignment: Alignment(-35, 5),
                    icon: new Icon(
                      Icons.arrow_back,
                      color: Color(0xFF002E5C),
                    ),
                     onPressed: ()
                    => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdminHome() ),
                        )
                    ),

                SizedBox(
                  height: 30,
                ),

                Text(
                  "Edit Ride",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002E5C)),
                ),
                SizedBox(height: 20),
                Image.asset('assets/Add.png'),
                SizedBox(height: 20),


                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("Rides")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        const Text("Loading.....");
                      } else {
                        _accountType.clear();
                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          DocumentSnapshot snap = snapshot.data!.docs[i];
                          _accountType.add(snap.id);
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            DropdownButton(
                              items: _accountType
                                  .map((value) => DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color: Color(0xFF002E5C)),
                                        ),
                                        value: value,
                                      ))
                                  .toList(),
                              onChanged: (ridetype) {
                                final snackBar = SnackBar(
                                  content: Text(
                                    'Selected Type is $ridetype',
                                    style: TextStyle(color: Color(0xff11b719)),
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                                setState(() {
                                  selectedType = ridetype;
                                });
                              },
                              value: selectedType,
                              isExpanded: false,
                              hint: Text(
                                'Choose Ride Type',
                                style: TextStyle(color: Color(0xFF002E5C)),
                              ),
                            )
                          ],
                        );
                      }
                      return const Text("Loading.....");
                    }),
                const SizedBox(height: 30),

                Column(children: <Widget>[
                  // Text('Choose Time'),
                  DateTimeField(
                    format: format,
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    
                    hintText: "00/00/0000 00:00",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );

                        dt = DateTimeField.combine(date, time);
                         dates.add(dt);
                        // var a = dt.runtimeType;

                        // debugPrint("$a");
                        return dt;
                      } else {
                        return currentValue;
                      }
                    },
                  ),
                ]),
                  Column(children: [
                  SizedBox(width: 140),
                  SizedBox(height: 10),
                  TextButton(
                      child: Text('Save'),
                      onPressed: () {
                        FirebaseFirestore.instance.collection('Rides').doc(selectedType).collection('RideSlots').doc("Slots")
                        .update({'Date': FieldValue.arrayUnion(dates)}).then((_) { debugPrint("success!");});
                     
                          //   FirebaseFirestore.instance.collection('Rides').doc(selectedType).collection('Rides').doc()
                          // .update({"Date": '${dt}'}).then((_) { debugPrint("success!");});                      })
                      })]),
                SizedBox(height: 10),
                TextFormField(
                  controller: RideNController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Ride Name',
                    hintText: "Ride Name",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
              

                Column(children: [
                  SizedBox(width: 140),
                  
                  TextButton(
                      child: Text('Save'),
                      onPressed: () {
                            FirebaseFirestore.instance.collection('Rides').doc(selectedType)
                          .update({"Name": '${RideNController.text.trim()}'}).then((_) { debugPrint("success!");});                      })
                ]),

                TextFormField(
                  controller: RideDController,
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
                Column(children: [
                  SizedBox(width: 140),
                  
                  TextButton(
                      child: Text('Save'),
                      onPressed: () {
                            FirebaseFirestore.instance.collection('Rides').doc(selectedType)
                          .update({"Description": '${RideDController.text.trim()}'}).then((_) { debugPrint("success!");});                      })
                ]),

                TextFormField(
                  controller: PriceController,
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
                  // obscureText: true,
                ),
               
                 Column(children: [
                  SizedBox(width: 140),
                  
                  TextButton(
                      child: Text('Save'),
                      onPressed: () {
                            FirebaseFirestore.instance.collection('Rides').doc(selectedType)
                          .update({"Price": '${int.parse(PriceController.text.trim())}'}).then((_) { debugPrint("success!");});                      })
                ]),

              
                TextFormField(
                  controller: CapacityController,
              
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
                 Column(children: [
                  SizedBox(width: 140),
                  
                  TextButton(
                      child: Text('Save'),
                      onPressed: () {
                            FirebaseFirestore.instance.collection('Rides').doc(selectedType)
                          .update({"Capacity": '${CapacityController.text.trim()}'}).then((_) { debugPrint("success!");});                      })
                ]),

              ]),
            )
          ])),
    );
  }
}
