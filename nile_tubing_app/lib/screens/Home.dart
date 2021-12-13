// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: use_key_in_widget_constructors, unused_import, unused_import, duplicate_ignore, prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/Rides.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import 'Rides.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
   @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  width: 180,
                ),
                Icon(Icons.local_grocery_store,
                    size: 35, color: Color(0xff123456)),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.person_outline_rounded,
                    size: 35, color: Colors.yellow),
              ]),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 135), //apply padding to some sides only
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
                        icon: const Icon(Icons.arrow_back_ios, size: 35),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      

                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, size: 35),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => Rides()),
                       );
                     },
                    color: Color(0xff123456).withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                        ),
                    child: Text("Book Now",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Cairo')
                            ),
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
            Container(decoration: new BoxDecoration(color: Colors.blue[900]),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:Padding(padding: const EdgeInsets.only(top: 150), 
            child:
            Column(children: [
              Align(alignment:Alignment.center, 
              child: Container(decoration:
                   BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage("assets/homepage1.jpeg"),
                    fit: BoxFit.cover,
                    )
                    ),
                    height: 380,
                    width: MediaQuery.of(context).size.width),
                    ),
              Container(
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [GestureDetector(
            child: Text("Click here",
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.black,fontSize: 20)),
            onTap: () {}
            ),
            Icon(Icons.gesture,size: 35),],
                )
                ) 
              ])
         
            ), 
            ),
             
          
          
            //Last Page
            Container(
            decoration: new BoxDecoration(color: Colors.white),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children:[
             Padding(padding: const EdgeInsets.only(top:100),
             child: Align(alignment: Alignment.center,
             child: Text("UP COMING EVENTS",style: TextStyle(color: Colors.blue[900],fontSize: 24),),
          )
            ),
            Container(child: Image.asset('assets/homepage2.jpeg'),
            width: MediaQuery.of(context).size.width,
            height:400 ),
            Container(child: Row(
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
                        borderRadius: BorderRadius.circular(20)
                        ),
                    child: Text("Check Out!",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Cairo')
                            ),
                  ),
                ],
              ))

            ]),
            ),
            
      ],
    )
    );
  }
  }