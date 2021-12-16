// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'Rides.dart';
import 'Home.dart';
import 'signin.dart';

class MyDrawer extends StatelessWidget {
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
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              title: const Text('Rides'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Rides()),
                );
              },
            ),
            ListTile(
              title: const Text('Contact Us'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Log out'),
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
    );
  }
}
