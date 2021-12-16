import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/signin.dart';
import '../model/paymentForm.dart';
import '../modules/home_widget.dart';
import 'Rides.dart';

class Payment extends StatefulWidget {
//right click refactor stateful
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            children: [
              Container(
                height: 80,
                child: DrawerHeader(
                  child: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Text('Nile Tubing')),
                  decoration: BoxDecoration(color: Colors.yellow[700]),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text('Home'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  (Icons.donut_small_outlined),
                ),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text('Rides'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Rides()),
                  );
                },
              ),
              ListTile(
                leading: const Icon((Icons.phone)),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text('Contact us'),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: const Icon((Icons.logout_outlined)),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text('Log Out'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
              ),
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(25),
          children: [
            Container(
              // ignore: prefer_const_literals_to_create_immutables
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
                  padding: EdgeInsets.only(left: 110),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.person_outline_rounded,
                              size: 35, color: Colors.yellow)),
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
                    PaymentForm(),
                  ],
                )),
          ],
        ));
  }
}
