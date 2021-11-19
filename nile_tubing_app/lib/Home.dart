// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: use_key_in_widget_constructors, unused_import, unused_import, duplicate_ignore, prefer_const_constructors, file_names
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          // ignore: prefer_const_literals_to_create_immutables
          child: Row(children: [
            Image.asset('assets/NTLogo.png'),
            SizedBox(width: 180, height: 100),
            Icon(Icons.shopping_bag, size: 50, color: Colors.blue)
          ]),
          height: 140,
        ),
        SizedBox(width: 180, height: 100), 
        Text('Go with the flow of the Nile River',
        style: TextStyle(fontStyle: FontStyle.italic,fontSize: 40,),
        ),
        SizedBox(width: 180, height: 100),
        Row(children: [Icon(Icons.arrow_back,size: 80,color: Colors.black,),SizedBox(width: 180),Icon(Icons.arrow_forward,size: 80,color: Colors.black,),],)
        
      ],
    ));
  }
}
