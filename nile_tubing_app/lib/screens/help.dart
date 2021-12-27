// ignore: unused_import
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Help(),
    );
  }
}

class Help extends StatefulWidget {
  @override
  _HelpState createState() {
    return _HelpState();
  }
}

class _HelpState extends State<Help> {
  bool _expanded = false;
  var _test = "Full Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/NTLogo.png'),
                  const Text(
                    "Help",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const Icon(Icons.shopping_cart,
                      size: 35, color: Color.fromRGBO(0, 46, 92, 1))
                ]),
            height: 100,
            //color: Color.fromRGBO(0, 46, 92, 1),
          ),
          Image.asset('assets/10162.png'),

          Column(children: [
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.green,
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 2000),
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      // ignore: prefer_const_constructors
                      return ListTile(
                        // ignore: prefer_const_constructors
                        title: Text(
                          "How to reserve?",
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                    body: const ListTile(
                      title: Text('Description text',
                          style: TextStyle(color: Colors.black)),
                    ),
                    isExpanded: _expanded,
                    canTapOnHeader: true,
                  ),
                ],
                dividerColor: Colors.grey,
                expansionCallback: (panelIndex, isExpanded) {
                  _expanded = !_expanded;
                  setState(() {});
                },
              ),
            ),
          ]),
          Column(children: [
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.green,
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 2000),
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      // ignore: prefer_const_constructors
                      return ListTile(
                        // ignore: prefer_const_constructors
                        title: Text(
                          "Terms and Conditions",
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                    body: const ListTile(
                      title: Text('Description text',
                          style: TextStyle(color: Colors.black)),
                    ),
                    isExpanded: _expanded,
                    canTapOnHeader: true,
                  ),
                ],
                dividerColor: Colors.grey,
                expansionCallback: (panelIndex, isExpanded) {
                  _expanded = !_expanded;
                  setState(() {});
                },
              ),
            ),
          ]),
          Column(children: [
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.green,
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 2000),
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      // ignore: prefer_const_constructors
                      return ListTile(
                        // ignore: prefer_const_constructors
                        title: Text(
                          "Frequent Questions",
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                    body: const ListTile(
                      title: Text('Description text',
                          style: TextStyle(color: Colors.black)),
                    ),
                    isExpanded: _expanded,
                    canTapOnHeader: true,
                  ),
                ],
                dividerColor: Colors.grey,
                expansionCallback: (panelIndex, isExpanded) {
                  _expanded = !_expanded;
                  setState(() {});
                },
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
