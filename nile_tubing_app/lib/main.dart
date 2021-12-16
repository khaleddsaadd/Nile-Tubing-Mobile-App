import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/Rides.dart';
import 'package:nile_tubing_app/screens/SelectedRide.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import 'screens/Home.dart';
import 'screens/Payment.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Splash(),
    'First': (context) => Home(),
    'Second': (context) => Rides(),
    'Third': (context) => SelectedRide(),
    'Fourth': (context) => CheckOut(),
    'Fifth': (context) => Payment(),
  }));
}
