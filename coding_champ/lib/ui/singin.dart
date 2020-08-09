import 'package:coding_champ/services/AuthService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingIn extends StatefulWidget {
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("CodingChamp"),
      ) ,

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text("Skip"),
          onPressed: () async {
            dynamic result = await _authService.singInAnonymously();
            if (result == null) {
              throw("Sing in failed");
            } else {
              navigateToHome();
            }
          },
        ),
      ),
    );
  }

  void navigateToHome() {

  }
}
