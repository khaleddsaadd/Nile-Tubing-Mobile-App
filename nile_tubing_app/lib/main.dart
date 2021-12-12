import 'package:flutter/material.dart';
import 'screens/Home.dart';
import 'screens/Payment.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Payment(),
  }));
}
