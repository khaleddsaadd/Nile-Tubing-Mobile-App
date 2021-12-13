import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/Rides.dart';
import 'package:nile_tubing_app/screens/SelectedRide.dart';
import 'package:nile_tubing_app/screens/Test.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import 'screens/Home.dart';
import 'screens/Payment.dart';

void main() => runApp(MaterialApp(home: Nav()));

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: const Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.donut_small_outlined),
            title: const Text('Rides'),
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.phone), title: Text('Contact Us'))
        ],
      ),
      body: Navigator(
        onGenerateRoute: (settings) {
          Widget page = Home();
          if (settings.name == 'Rides')
            page = Rides();
          else if (settings.name == 'SelectedRide')
            page = SelectedRide();
          else if (settings.name == 'Checkout')
            page = CheckOut();
          else if (settings.name == 'Payment') page = Payment();

          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    );
  }
}
