// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nile_tubing_app/screens/add_event.dart';
import 'package:nile_tubing_app/screens/edit_ride.dart';
import '../model/rides.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nile_tubing_app/model/add_ride_admin.dart';
import 'package:nile_tubing_app/services/authentication_services.dart';
import 'package:provider/provider.dart';

// import 'package:nile_tubing_app/screens/signup.dart';
// import 'Home.dart';
// import 'package:nile_tubing_app/services/authentication_services.dart';
// import 'package:provider/provider.dart';

class AdminHome extends StatefulWidget {
  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: ListView(children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          child: Column(children: [
            SizedBox(
              height: 30,
            ),

             Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
               
                    onPressed: () {
                      context.read<AuthenticationService>().signOut();
                    },
                    icon: Icon(Icons.logout)),
               
),

            Text(
              "Hello Admin",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF002E5C)),
            ),
            SizedBox(height: 20),
            Image.asset('assets/Add.png'),
            SizedBox(height: 50),
            Row(
              children: [
                SizedBox(width: 70),
                
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellowAccent[700]),
                    ),
                    child: Text(
                      'Rides',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddRide()),
                      );
                    }),
                SizedBox(height: 30),
                SizedBox(width: 30),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellowAccent[700]),
                    ),
                    child: Text(
                      'Events',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddEvent()),
                      );
                    }),
                // ElevatedButton(
                //     style: ButtonStyle(
                //       backgroundColor:
                //           MaterialStateProperty.all(Colors.green[700]),
                //     ),
                //     child: Text(
                //       'Log out',
                //       style: TextStyle(
                //         fontWeight: FontWeight.w800,
                //         fontSize: 20,
                //       ),
                //     ),
                //     onPressed: () {
                //       context.read<AuthenticationService>().signOut();
                //     }),
              ],
            ),
          ]),
        )
      ]),
    );
  }
}
