import 'package:flutter/material.dart';
import 'package:nile_tubing_app/Rides.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {'/': (context) => Rides()},
  ));
}
