import 'package:coding_champ/models/menu_options.dart';
import 'package:coding_champ/ui/login.dart';
import 'package:coding_champ/ui/singn_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingIn extends StatefulWidget {

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent[200],
        title: Text("CodingChamp"),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return MenuOptions.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            onSelected: _optionMenuSelected,
          )
        ],
      ) ,

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Engaging Young Minds",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent[200]
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: 130,
                height: 46,
                child: RaisedButton(
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      side: BorderSide(color: Colors.deepOrangeAccent[200])
                  ),
                  color: Colors.white,
                  child: Text(
                      "Login",
                    style: TextStyle(
                      color: Colors.deepOrangeAccent[200]
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                ),
              ),
              SizedBox(
                height: 16
              ),
              Container(
                width: 130,
                height: 46,
                child: RaisedButton(
                  padding: EdgeInsets.only(left: 12.0, top: 0.0, right: 12.0, bottom: 0.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                  ),
                  color: Colors.deepOrangeAccent[200],
                  child: Text(
                    "Sing Up",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                  },
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }

  void navigateToHome() {

  }

  void _optionMenuSelected(String value) {

  }

  Widget _createSignUpButton(String text, ButtonType buttonType) {
    return Container(
      width: 100,
      height: 40,
      child: RaisedButton(
        padding: EdgeInsets.only(left: 12.0, top: 0.0, right: 12.0, bottom: 0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        color: Colors.deepOrangeAccent[200],
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
        },
      ),
    );
  }

  _setButtonType(ButtonType buttonType) {

  }
}

enum ButtonType {
  PRIMARY,
  SECONDARY
}