import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/signin.dart';
import 'Home.dart';
import 'package:flutter/services.dart';
import 'Rides.dart';

class Ticket extends StatelessWidget {
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
                leading: const Icon((Icons.phone)),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text('Contact us'),
                ),
                onTap: () {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
              ),
            ],
          ),
        ),
        body: ListView(children: [
          // ignore: sized_box_for_whitespace
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/NTLogo.png'),
                  const Icon(Icons.shopping_cart,
                      size: 35, color: Color.fromRGBO(0, 46, 92, 1))
                ]),
            height: 100,
          ),
          const Text(
            "Reserved Successfully!",
            style: TextStyle(fontSize: 25, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Image.asset('assets/3.png'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green[700]),
            ),
            child: Text(
              'Print Ticket',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
            ),
          ),
        ]));
  }
}
