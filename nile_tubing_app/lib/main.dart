import 'package:flutter/material.dart';
//import 'package:nile_tubing_app/Home.dart';
import 'package:nile_tubing_app/Rides.dart';
<<<<<<< Updated upstream
import 'package:nile_tubing_app/screens/SelectedRide.dart';
import 'package:nile_tubing_app/screens/Payment.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    //routes: {'/': (context) => Rides()},
    //routes: {'/': (context) => SelectedRide()},
    //routes: {'/': (context) => Home()},
    routes: {'/': (context) => Payment()},
  ));
=======
import 'package:nile_tubing_app/SelectedRide.dart';
import 'package:nile_tubing_app/checkOut.dart';
import 'Payment.dart';
import 'paymentForm.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Home(),
  }));
>>>>>>> Stashed changes
}
