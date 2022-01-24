import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/drawer.dart';
import 'package:nile_tubing_app/screens/signin.dart';
import 'paymentForm.dart';
import '../modules/home_widget.dart';
import 'package:nile_tubing_app/screens/profile.dart';
import 'Rides.dart';

class Payment extends StatefulWidget {
  String? RideName;
  int? RidePrice;
  String? selected;
  int? Total;
  Payment({this.RideName, this.RidePrice, this.selected, this.Total});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(),
        body: ListView(
          padding: EdgeInsets.all(25),
          children: [
            Container(
              child: Row(children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Image.asset(
                  'assets/NTLogo.png',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 135),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.person_outline_rounded,
                              size: 35, color: Colors.yellow[700]),
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()),
                              )),
                    ],
                  ),
                )
              ]),
              height: 100,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(50),
                height: 950,
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
                      Text(
                        'GET YOUR TICKET',
                        style: TextStyle(
                            fontSize: 23,
                            color: Color(0xff123456),
                            //color: Colors.yellow[600],
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold),
                      ),
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
                    PaymentForm(
                      RideName: widget.RideName,
                      RidePrice: widget.RidePrice,
                      selected: widget.selected,
                      Total: widget.Total,
                    ),
                  ],
                )),
          ],
        ));
  }
}
