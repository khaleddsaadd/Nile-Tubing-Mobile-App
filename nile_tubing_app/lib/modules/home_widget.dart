import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/SelectedRide.dart';
import 'package:nile_tubing_app/screens/Payment.dart';

class Home extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();

    SelectedRide();
  }
}

class _HomeState extends State {
  final List _children = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        //selectedIconTheme: IconThemeData(color: Color(0xff123456)),
        unselectedItemColor: (Color(0xff123456)),
        selectedItemColor: (Color(0xff123456)),
        selectedLabelStyle:
            TextStyle(fontFamily: 'cairo', fontSize: 10, height: 1.2),
        unselectedLabelStyle: TextStyle(fontFamily: 'cairo', fontSize: 10),

        backgroundColor: Colors.yellow[400],
        iconSize: 20,

        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.donut_small_outlined),
            title: new Text('Rides'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone), title: Text('Contact Us'))
        ],
      ),
    );
  }
}
