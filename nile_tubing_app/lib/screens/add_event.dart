// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nile_tubing_app/model/Events.dart';
import '../model/rides.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nile_tubing_app/model/add_ride_admin.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/services.dart';

class AddEvent extends StatefulWidget {
  @override
  State<AddEvent> createState() => _AddEventState();
}



class _AddEventState extends State<AddEvent> {
  bool _isObscure = true;
  late Events event;
  final _formKey = GlobalKey<FormState>();
  final EventNController = TextEditingController();
  final PriceController = TextEditingController();
  final StartDateController = TextEditingController();
  final EndDateController = TextEditingController();
  final EventDController = TextEditingController();
  final CapacityController = TextEditingController();

 

static const snackBar = SnackBar(
  content: Text('Data Added Succesfully', style: TextStyle(color: Color(0xff11b719)),),
  
);
  List<String> _accountType = <String>[];

  var selectedType;

  final format = DateFormat("yyyy-MM-dd HH:mm");
  late DateTime St;
  late DateTime Et;
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
                  "Add Event",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002E5C)),
                ),
                SizedBox(height: 0),
          Image.asset('assets/AddE.png'),
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
                    
                    hintText: "Start Date",
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

                        St = DateTimeField.combine(date, time);
                        // var a = dt.runtimeType;

                        // debugPrint("$a");
                        return St;
                      } else {
                        return currentValue;
                      }
                    },
                  ),
                ]),


                SizedBox(height: 10),

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
                    
                    hintText: "End Date",
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

                        Et = DateTimeField.combine(date, time);
                       
                        // var a = dt.runtimeType;

                        // debugPrint("$a");
                        return Et;
                      } else {
                        return currentValue;
                      }
                    },
                  ),
                ]),

                SizedBox(height: 10),
                 TextFormField(
                  controller: EventNController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  
                  inputFormatters: [new LengthLimitingTextInputFormatter(500),
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
  ],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Event Name',
                    hintText: "Event Name",
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
                  
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Price',
                    hintText: "Price in numbers format only",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                 

                ),
                const SizedBox(height: 10),
               TextFormField(
                  controller: EventDController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  inputFormatters: [new LengthLimitingTextInputFormatter(500)],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Event Description',
                    hintText: "Event Description",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
                
                 const SizedBox(height: 10),
                // TextFormField(
                //   controller: CapacityController,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter some text';
                //     }
                //     return null;
                //   },
                  
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Colors.white,
                //     border: OutlineInputBorder(
                //         borderSide: BorderSide.none,
                //         borderRadius: BorderRadius.circular(50)),
                //     labelText: 'Capacity',
                //     hintText: "Capacity",
                //     contentPadding: EdgeInsets.all(20.0),
                //   ),
                // ),
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
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                       onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        event = Events(
                       
                        EventName: EventNController.text.trim(),
                        EventPrice: PriceController.text.trim(),
                        EventDescription: EventDController.text.trim(),
                        // EventStart: St.toDate(),
                        // EventEnd: Et,
                        EventType : selectedType,
                        // Capacity :CapacityController.text.trim(),

                        
                      );

                    FirebaseFirestore.instance.collection('Events').add({
                      'Name': '${event.EventName}',
                      'Price': '${event.EventPrice}',
                      'Description': '${event.EventDescription}',
                      'Start Date' :St,
                      'End Date' :Et,
                      'Type' :'${event.EventType}',
                      // 'Capacity' :'${event.Capacity}',


                     
                    }).then((_) {  ScaffoldMessenger.of(context).showSnackBar(snackBar);});
                   
                        } }),
                    SizedBox(height: 10),
                   
                  ],
                ),
              ]),
            )
          ])),
    );
  }
}
