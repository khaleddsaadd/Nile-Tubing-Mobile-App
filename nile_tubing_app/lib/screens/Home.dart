// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: use_key_in_widget_constructors, unused_import, unused_import, duplicate_ignore, prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/Rides.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import 'package:nile_tubing_app/screens/signin.dart';
import 'Rides.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
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
        body: ListView(
          children: [
//FirstPage
            Container(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: Row(children: [
                        Image.asset('assets/NTLogo.png'),
                        SizedBox(
                          width: 163,
                        ),
                        IconButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckOut())),
                          icon: Icon(Icons.local_grocery_store,
                              size: 35, color: Color(0xff123456)),
                        ),
                        IconButton(
                            icon: new Icon(Icons.person_outline_rounded,
                                size: 35, color: Colors.yellow[700]),
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()),
                                )),
                      ]),
                    ),
                    SizedBox(height: 80),
                    Padding(
                      padding:
                          EdgeInsets.all(30), //apply padding to some sides only
                      child: Text("Go with the flow of the Nile River",
                          style: TextStyle(fontSize: 36, color: Colors.white),
                          textAlign: TextAlign.center),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.arrow_back_ios, size: 35),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward_ios,
                                    size: 35),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Rides()),
                              );
                            },
                            color: Color(0xff123456).withOpacity(0.8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("Book Now",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontFamily: 'Cairo')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Background.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken))),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width),

//Second Page
            Container(
              decoration: new BoxDecoration(color: Colors.blue[900]),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/homepage1.jpeg"),
                            fit: BoxFit.cover,
                          )),
                          height: 380,
                          width: MediaQuery.of(context).size.width),
                    ),
                    Container(
                        child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            child: Text("Click here",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 20)),
                            onTap: () {}),
                        Icon(Icons.gesture, size: 35),
                      ],
                    ))
                  ])),
            ),

            //Last Page
            Container(
              decoration: new BoxDecoration(color: Colors.white),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "UP COMING EVENTS",
                        style: TextStyle(color: Colors.blue[900], fontSize: 24),
                      ),
                    )),
                Container(
                    child: Image.asset('assets/homepage2.jpeg'),
                    width: MediaQuery.of(context).size.width,
                    height: 400),
                Container(
                    child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CheckOut()),
                        );
                      },
                      color: Color(0xff123456).withOpacity(1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("Check Out!",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: 'Cairo')),
                    ),
                  ],
                ))
              ]),
            ),
          ],
        ));
  }
}
