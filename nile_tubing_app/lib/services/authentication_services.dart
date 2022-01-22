import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nile_tubing_app/screens/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<String?> signUp(
      {required String email,
      required String password,
      required String fname,
      required String lname,
      required String mobile}) async {
    try {
      UserCredential? userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .set({'First Name': fname, 'Last Name': lname, 'Phone': mobile});
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      if (e.message == 'weak-password') {
        print(e.message);
        return e.message;
      } else if (e.message == 'email-already-in-use') {
        print(e.message);
        return e.message;
      } else {
        print(e.message);
        return e.message;
      }
    }
  }

  Future<bool?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
      // SignIn(x: true);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
