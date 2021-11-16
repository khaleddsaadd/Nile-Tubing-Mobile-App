import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => HomePage(),
    '/ second': (context) => Rides()
  }));
}
