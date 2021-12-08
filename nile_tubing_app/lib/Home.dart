// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: use_key_in_widget_constructors, unused_import, unused_import, duplicate_ignore, prefer_const_constructors, file_names
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
            body:  Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Background.jpg"),
                        fit: BoxFit.cover)),
         
         
         child: ListView(children: [
            Container(
          height: 100,
          child: Row(children: [
            Image.asset('assets/NTLogo.png'),
            SizedBox(
              width: 180,
            ),
            Icon(Icons.local_grocery_store, size: 35, color: Color(0xff123456)),
            SizedBox(
              width: 15,
            ),
            Icon(Icons.person_outline_rounded, size: 35, color: Colors.yellow),
          ]),
        ),

            SizedBox(height: 110),


            Padding(
          padding: EdgeInsets.only(top: 25), //apply padding to some sides only
          child: Text("Go with the flow of the Nile River",
              style: TextStyle(fontSize: 36 , color: Colors.white),
              textAlign: TextAlign.center),
        ),
        
        SizedBox(height: 35),
        
        Row(children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 35),
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(width:315),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 35),
            color: Colors.white,
            onPressed: () {},
          ),
          ],
          ),
        SizedBox(height: 60),
        
          // ElevatedButton(
          //               style: ButtonStyle(
          //                   backgroundColor: MaterialStateProperty.all<Color>(
          //                       Color(0xff123456))),
          //               onPressed: () {},
          //               child: Text('Book Now',
          //                   style: TextStyle(
          //                       fontSize: 15,
          //                       color: Colors.white,
          //                       fontFamily: 'Cairo'))),

         /*ButtonBar( alignment: MainAxisAlignment.center,
            
              children: [
                ElevatedButton(
                  child: Text("Home"),
                  onPressed: (){},
                ),

                ElevatedButton(
                  child: Text("Rides"),
                  onPressed: (){},
                ),

                ElevatedButton(
                  child: Text("Contact Us"),
                  onPressed: (){},
                ),

                ElevatedButton(
                  child: Text("Get Started"),
                  onPressed: (){},
                ),],
            ) */       
        
        ],    
            ),
          )
        );
  }
}
 