// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/rides.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nile_tubing_app/model/add_ride_admin.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:nile_tubing_app/screens/admin.dart';
import 'package:flutter/services.dart';
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
  
 
static const snackBar = SnackBar(
  content: Text('Data Added Succesfully', style: TextStyle(color: Color(0xff11b719)),),
  
);

static const snackBarE = SnackBar(
  content: Text('Date Empty', style: TextStyle(color: Color(0xff11b719)),),
  
);


  var selectedType;
  final _formKey = GlobalKey<FormState>();
  final ridencontroller = TextEditingController();
  final ridetcontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final datecontroller = TextEditingController();
  final ridedcontroller = TextEditingController();
  final capacitycontroller = TextEditingController();

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
              
              Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
               
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
               
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
                          firstDate: DateTime.now(),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2035));
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
                        .update({'Date': FieldValue.arrayUnion(dates)}).then((_) { ScaffoldMessenger.of(context).showSnackBar(snackBar);});
                    
                      })]),
                SizedBox(height: 10),
                TextFormField(
                  
                  controller: ridencontroller,
                  inputFormatters: [new LengthLimitingTextInputFormatter(50),FilteringTextInputFormatter.allow(RegExp('[a-zA-Z- ]')),],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Ride Name',
                    hintText: "Ride Name Character Only",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
              

                Column(children: [
                  SizedBox(width: 140),
                  
                  TextButton(
                      child: Text('Save'),
                      onPressed: () {
                            FirebaseFirestore.instance.collection('Rides').doc(selectedType)
                          .update({"Name": '${ridencontroller.text.trim()}'}).then((_) { ScaffoldMessenger.of(context).showSnackBar(snackBar);});                      })
                ]),

                TextFormField(
                  controller: ridedcontroller,
                  inputFormatters: [new LengthLimitingTextInputFormatter(500)],
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
                          .update({"Description": '${ridedcontroller.text.trim()}'}).then((_) {  ScaffoldMessenger.of(context).showSnackBar(snackBar);});                      })
                ]),

                TextFormField(
                  controller: pricecontroller,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Price',
                    hintText: "Price in number format please",
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
                          .update({"Price": '${int.parse(pricecontroller.text.trim())}'}).then((_) {  ScaffoldMessenger.of(context).showSnackBar(snackBar);});                      })
                ]),

              
                TextFormField(
                  controller: capacitycontroller,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Capacity',
                    hintText: "Capacity in number formar please",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
                 Column(children: [
                  SizedBox(width: 140),
                  
                  TextButton(
                      child: Text('Save'),
                      onPressed: () {
                            FirebaseFirestore.instance.collection('Rides').doc(selectedType)
                          .update({"Capacity": '${capacitycontroller.text.trim()}'}).then((_) {  ScaffoldMessenger.of(context).showSnackBar(snackBar);});                      })
                ]),

              ]),
            )
          ])),
    );
  }
}
