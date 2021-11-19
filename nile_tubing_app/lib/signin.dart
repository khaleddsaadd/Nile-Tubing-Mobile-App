
import 'package:flutter/material.dart';
// import 'forgetPassword.dart';
// import 'whatsapp.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(leading: Icon(Icons.menu), title: Text("Sign In"), actions: [
        IconButton(
            onPressed: () {
              print("help");
            },
            icon: Icon(Icons.help)),
        IconButton(onPressed: () => print("search"), icon: Icon(Icons.search))
      ]),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30, width: 90),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: "Email"),
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: "Password"),
            ),
            SizedBox(height: 10),
            Row(children: [
              SizedBox(width: 220),
             InkWell(
                // onTap: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
                // },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ]),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 40),
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void not() {
    print("notifications");
  }
}


