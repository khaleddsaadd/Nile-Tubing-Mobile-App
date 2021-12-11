import 'package:flutter/material.dart';
import 'paymentForm.dart';

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
            height: 450,
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
                      left: 20,
                    ),
                  ),
                  Text('Fill Your Info To Checkout',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Cairo',
                      ),
                      textAlign: TextAlign.center),
                ]),
                Padding(padding: const EdgeInsets.only(top: 20)),
                PaymentForm(),
              ],
            )),
      ],
    ));
  }
}
