import 'package:coding_champ/ui/home.dart';
import 'package:coding_champ/ui/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (BuildContext context, snapShot) {
            if(snapShot.hasData) {
              return Home();
            } else {
              return Login();
            }},
      )
    );
  }
}
