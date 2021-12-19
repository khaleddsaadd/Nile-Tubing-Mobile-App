import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nile_tubing_app/screens/error_screen.dart';
import 'package:nile_tubing_app/screens/signin.dart';
import 'package:provider/provider.dart';
import 'services/authentication_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/loading_screen.dart';
import 'screens/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorScreen();
            } else if (snapshot.hasData) {
              return Authenticationwrapper();
            } else {
              return LoadingScreen();
            }
          },
        ),
      ),
    );
  }
}

class Authenticationwrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return Home();
    }
    return SignIn();
  }
}
