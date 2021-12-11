import 'package:flutter/material.dart';
import 'Payment.dart';

// Create a Form widget.
class PaymentForm extends StatefulWidget {
  @override
  PaymentFormState createState() {
    return PaymentFormState();
  }
}

class PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();

  String dropdownvalue = 'Gender';
  var items = [
    'Gender',
    'Male',
    'Female',
  ];
/*
  bool _value = false;
  int val = -1;
*/
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(40.0))),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'You have to insert a name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Mobile Number',
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !value.contains(RegExp(r'[0-9]')) ||
                  value.length > 12) {
                return 'Please enter a vaild number';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.email_rounded),
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
          Center(
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
          //  Radio(value: 1, onChanged: (value){}, groupValue: null,),
          /* Radio(
            value: 1,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                //val = value;
              });
            },
            activeColor: Colors.green,
            toggleable: true,
          ),*/
          new Container(
              //padding: const EdgeInsets.only(top: 10.0),
              alignment: Alignment.centerRight,
              child: new ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Proccessing Data ')));
                  }
                },
              )),
        ],
      ),
    );
  }
}
