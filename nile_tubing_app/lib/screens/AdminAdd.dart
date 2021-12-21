import 'package:flutter/material.dart';

// import 'package:nile_tubing_app/screens/signup.dart';
// import 'Home.dart';
// import 'package:nile_tubing_app/services/authentication_services.dart';
// import 'package:provider/provider.dart';

class AddRide extends StatefulWidget {
  @override
  State<AddRide> createState() => _AddRideState();
}



class _AddRideState extends State<AddRide> {
  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();
  final RideTController = TextEditingController();
  final PriceController = TextEditingController();
  final DateController = TextEditingController();
  final CapacityController = TextEditingController();
//     Future<i.File> file;
//     String status = '';
//     late String base64Image;
//     i.File tmpFile;
//     String errMessage = 'Error Uploading Image';

//   get uploadEndPoint => null;

// chooseImage() {
//     setState(() {
//       file = ImagePicker.pickImage(source: ImageSource.gallery);
//     });
// }
// setStatus(String message) {
//     setState(() {
//       status = message;
//     });
//   }
 
//   startUpload() {
//     setStatus('Uploading Image...');
//     if (null == tmpFile) {
//       setStatus(errMessage);
//       return;
//     }
//     String fileName = tmpFile.path.split('/').last;
//     upload(fileName);
//   }
 
//   upload(String fileName) {
//     http.post(uploadEndPoint, body: {
//       "image": base64Image,
//       "name": fileName,
//     }).then((result) {
//       setStatus(result.statusCode == 200 ? result.body : errMessage);
//     }).catchError((error) {
//       setStatus(error);
//     });
//   }
 
//   Widget showImage() {
//     return FutureBuilder<File>(
//       future: file,
//       builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done &&
//             null != snapshot.data) {
//           tmpFile = snapshot.data!;
//           base64Image = base64Encode(snapshot.data!.readAsBytesSync());
//           return Flexible(
//             child: Image.file(
//               snapshot.data.toString(),
//               fit: BoxFit.fill,
//             ),
//           );
//         } else if (null != snapshot.error) {
//           return const Text(
//             'Error Picking Image',
//             textAlign: TextAlign.center,
//           );
//         } else {
//           return const Text(
//             'No Image Selected',
//             textAlign: TextAlign.center,
//           );
//         }
//       },
//     );
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: Column(children: [
              
                // IconButton(
                //     alignment: Alignment(-35, 5),
                //     icon: new Icon(
                //       Icons.arrow_back,
                //       color: Color(0xFF002E5C),
                //     ),
                //      onPressed: ()
                //     => Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (context) => ),
                //         )
                //     ),
               
                SizedBox(
                  height: 30,
                ),
              
                Text(
                  "Add Ride",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002E5C)),
                ),
                SizedBox(height: 20),
          Image.asset('assets/Add.png'),
          SizedBox(height: 20),

                TextFormField(
                  controller: RideTController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  // keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Ride Type',
                    hintText: "Ride Type",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
                const SizedBox(height: 10),
                
                TextFormField(
                  controller: PriceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Price',
                    hintText: "Price",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  obscureText: true,

                  //  suffixIcon: IconButton(
                  //   icon: Icon(
                  //     _isObscure ? Icons.visibility : Icons.visibility_off,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       _isObscure = !_isObscure;
                  //     });
                  //   },
                  // ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: DateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Date',
                    hintText: "Date",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
                 const SizedBox(height: 10),
                TextFormField(
                  controller: CapacityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    labelText: 'Capacity',
                    hintText: "Capacity",
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
                SizedBox(height: 10),
               
                Column(
                  children: [
                    SizedBox(width: 140),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   context.read<AuthenticationService>().AddRide(
                        //       email: emailController.text.trim(),
                        //       password: passwordController.text.trim());
                        // }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[700]),
                      ),
                      child: Text(
                        'Add Ride',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(height: 50),
                        SizedBox(width: 40),
                        
                        // TextButton(
                          // onPressed: () 
                          // {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => SignUp()),
                          //   );
                          //   // Respond to button press
                          // }
                          // ,
                          // child: Text(
                          //   "Sign Up",
                          //   style: TextStyle(
                          //     color: Colors.green[700],
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 20,
                      // ),
                      //     ),
                      //   )
                      ],
                    )
                  ],
                ),
              ]),
            )
          ])),
    );
  }
}