import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/checkOut.dart';
import 'package:nile_tubing_app/screens/drawer.dart';
import 'package:nile_tubing_app/screens/signin.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    var id;
    if (firebaseUser != null) {
      print(firebaseUser.uid);
      id = firebaseUser.uid;
    } else {
      id = "";
    }
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    return Scaffold(
        drawer: drawer(),
        body: ListView(
          children: [
            Container(
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                Image.asset('assets/NTLogo.png'),
              ]),
              height: 80,
            ),
            FutureBuilder<DocumentSnapshot>(
              future: users.doc(id).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  final FNameController = TextEditingController()
                    ..text = data['First Name'];
                  final LNameController = TextEditingController()
                    ..text = data['Last Name'];
                  final PhoneController = TextEditingController()
                    ..text = data['Phone'];

                  return Column(
                    children: [
                      // Text("${data['First Name']}"),

                      Icon(
                        Icons.person,
                        color: Color(0xff123456),
                        size: 150.0,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              controller: FNameController,
                              decoration: const InputDecoration(
                                icon: const Icon(Icons.person),
                                hintText: 'Enter your name',
                                labelText: 'First Name',
                              ),
                            ),
                            TextFormField(
                              controller: LNameController,
                              decoration: const InputDecoration(
                                icon: const Icon(Icons.person),
                                hintText: 'Enter your name',
                                labelText: 'Last Name',
                              ),
                            ),
                            TextFormField(
                              controller: PhoneController,
                              decoration: const InputDecoration(
                                icon: const Icon(Icons.phone),
                                hintText: 'Enter a phone number',
                                labelText: 'Phone',
                              ),
                            ),
                            SizedBox(height: 40),
                            Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('Users')
                                        .doc(id)
                                        .update({
                                      "First Name": FNameController.text.trim(),
                                      "Last Name": LNameController.text.trim()
                                    }).then((_) {
                                      debugPrint("success!");
                                    });
                                  },
                                  child: Text('Update')),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return Text("loading");
              },
            ),
          ],
        ));
  }
}
