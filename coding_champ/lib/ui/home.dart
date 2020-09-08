import 'package:coding_champ/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await AuthService().singOut();
              },
              icon: Icon(Icons.person),
              label: Text("Sing out")
          )
        ],
        title: Text("User logged in"),
      ),
    );
  }

  _optionMenuSelected(String choice) {
    print(choice);
  }
}

