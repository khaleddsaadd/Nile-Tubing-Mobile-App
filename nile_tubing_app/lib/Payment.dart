import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
//right click refactor stateful
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  /* final _formkey = GlobalKey<FormState>();
  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _printLast() {
    print('text field: ${myController.text}');
  }

  void initState() {
    super.initState();
    myController.addListener(_printLast);
  }*/

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
      ],
    ));
  }
}
