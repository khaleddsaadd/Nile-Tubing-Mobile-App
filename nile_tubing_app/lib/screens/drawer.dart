import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/Home.dart';
import 'package:nile_tubing_app/screens/help.dart';
import 'package:nile_tubing_app/services/authentication_services.dart';
import 'package:provider/provider.dart';
import 'package:nile_tubing_app/screens/Rides.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import 'package:nile_tubing_app/screens/signin.dart';
import 'Rides.dart';

class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            leading: const Icon((Icons.help)),
            title: Transform.translate(
              offset: Offset(-16, 0),
              child: Text('Help'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Help()),
              );
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
              context.read<AuthenticationService>().signOut();
            },
          ),
        ],
      ),
    );
  }
}
