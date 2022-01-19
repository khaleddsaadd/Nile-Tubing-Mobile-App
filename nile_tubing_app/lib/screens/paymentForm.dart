import 'package:flutter/material.dart';
import '../model/enums.dart';
import '../model/paymentmodel.dart';
import 'package:nile_tubing_app/screens/Ticket.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Create a Form widget.
class PaymentForm extends StatefulWidget {
  @override
  PaymentFormState createState() {
    return PaymentFormState();
  }
}

class PaymentFormState extends State<PaymentForm> {
  late Paymentmodel paymentmodel;
  final _formKey = GlobalKey<FormState>();
  final NameController = TextEditingController();
  final EmailController = TextEditingController();
  final MobileController = TextEditingController();
  genders _gender = genders.male;
  methods _method = methods.vodafone;

/*
  String dropdownvalue = 'Gender';
  var items = [
    'Gender',
    'Male',
    'Female',
  ];
  */

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: NameController,
            decoration: const InputDecoration(
              icon: const Icon(
                Icons.person,
                //color: Colors.yellow,
                color: Color(0xff123456),
              ),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'You have to insert a name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: MobileController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone, color: Color(0xff123456)),
              hintText: 'Enter a phone number',
              labelText: 'Mobile Number',
              //labelStyle: TextStyle(color: Color(0xff123456)),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !value.contains(RegExp(r'[0-9]')) ||
                  value.length < 11) {
                return 'Please enter a vaild number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: EmailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              icon: const Icon(Icons.email_rounded, color: Color(0xff123456)),
              hintText: 'Enter your E-mail',
              labelText: 'Email Address',
            ),
            validator: (value) {
              if (value == null || value.isEmpty || !value.contains('@')) {
                return 'Please enter valid Email';
              }
              return null;
            },
          ),
          Padding(
              padding: EdgeInsets.only(
            top: 30,
          )),
          Text(
            "Gender:",
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          ListTile(
            title: const Text(
              'Male',
              style: TextStyle(fontSize: 15),
            ),
            leading: Radio(
              value: genders.male,
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value as genders;
                });
              },
              activeColor: Colors.yellow.shade700,
            ),
          ),
          ListTile(
            title: const Text('Female', style: TextStyle(fontSize: 15)),
            leading: Radio(
              value: genders.female,
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value as genders;
                });
              },
              activeColor: Colors.yellow.shade700,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
            top: 30,
          )),
          Text(
            "Payment Method:",
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          ListTile(
            title: const Text('Cash Payment',
                style: TextStyle(
                    height: 1, fontSize: 11.1, fontWeight: FontWeight.bold)),
            trailing: Image.asset(
              'assets/cash.jpg',
              scale: 9,
            ),
            leading: Radio(
              value: methods.cach,
              groupValue: _method,
              onChanged: (value) {
                setState(() {
                  _method = value as methods;
                });
              },
              activeColor: Colors.yellow.shade700,
            ),
          ),
          ListTile(
            title: const Text('Vodafone Cash',
                style: TextStyle(
                    height: 1, fontSize: 11.1, fontWeight: FontWeight.bold)),
            trailing: Image.asset(
              'assets/Vod.jpg',
              scale: 20.5,
            ),
            leading: Radio(
              value: methods.vodafone,
              groupValue: _method,
              onChanged: (value) {
                setState(() {
                  _method = value as methods;
                });
              },
              activeColor: Colors.yellow.shade700,
            ),
          ),
          new Container(
              padding: const EdgeInsets.only(top: 40.0),
              alignment: Alignment.centerRight,
              child: new ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff123456)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    )),
                child: Text('Pay',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Cairo')),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    paymentmodel = Paymentmodel(
                        Username: NameController.text.trim(),
                        Useremail: EmailController.text.trim(),
                        Userphone: MobileController.text.trim(),
                        gender: _gender,
                        method: _method);

                    FirebaseFirestore.instance.collection('Payment').add({
                      'Name': '${paymentmodel.Username}',
                      'Mail': '${paymentmodel.Useremail}',
                      'Mobile': '${paymentmodel.Userphone}',
                      'gender': '${paymentmodel.gender}',
                      'method': '${paymentmodel.method}'
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ticket()),
                    );
                  }
                },
              )),
        ],
      ),
    );
  }
}


          /*  Center(
            child: Image.asset(
              'assets/Vod.jpg',
              scale: 15,
            ),
          ),
*/
          /*   Center(
            child: DropdownButton(
              value: dropdownvalue,
              alignment: Alignment.center,
              underline: Container(
                height: 1,
                color: Colors.grey,
              ),
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
          */