import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Sign Up"),
        leading: new IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context
              );
            }),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  cursorColor: Colors.deepOrangeAccent,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    ),
                    labelText: "Enter Name",
                    labelStyle: TextStyle(
                      color: Colors.deepOrangeAccent
                    )
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Field is mandatory";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  cursorColor: Colors.deepOrangeAccent,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.deepOrangeAccent),
                      ),
                      labelText: "Enter Name",
                      labelStyle: TextStyle(
                          color: Colors.deepOrangeAccent
                      )
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Field is mandatory";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  cursorColor: Colors.deepOrangeAccent,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.deepOrangeAccent),
                      ),
                      labelText: "Enter Name",
                      labelStyle: TextStyle(
                          color: Colors.deepOrangeAccent
                      )
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Field is mandatory";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 40,),
                Container(
                  width: 130,
                  height: 46,
                  child: RaisedButton(
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      _onSubmitClicked();
                    },
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmitClicked() {

  }

}
