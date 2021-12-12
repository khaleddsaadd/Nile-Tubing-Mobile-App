import 'package:flutter/material.dart';
import '../model/paymentForm.dart';
import '../modules/home_widget.dart';

class Payment extends StatefulWidget {
//right click refactor stateful
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(25),
      children: [
        Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/NTLogo.png'),
                Icon(Icons.person_outline_rounded,
                    size: 45, color: Colors.yellow),
              ],
            )),
        SizedBox(
          height: 40,
        ),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50),
            height: 750,
            decoration: new BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 30.0,
                offset: Offset(
                  0,
                  5,
                ),
              )
            ]),
            child: Column(
              children: [
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 35,
                    ),
                  ),
                  Text('GET YOUR TICKET',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff123456),
                          //color: Colors.yellow[600],
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  Text(
                    ' !',
                    style: TextStyle(
                        fontSize: 30,
                        //color: Color(0xff123456),
                        color: Colors.yellow[700],
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                Padding(padding: const EdgeInsets.only(top: 20)),
                PaymentForm(),
              ],
            )),
      ],
    ));
  }
}
