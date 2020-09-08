
import 'package:coding_champ/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 1. Sign-in anonymously
/// 2. Sign-in with phone number
/// 3. Register
/// 4. Sign-out
class AuthService {

  AuthService();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String smsCode = "";

  User _getUserFromFirebase(FirebaseUser user) {
    return user != null ? User(userId : user.uid) : null;
  }

  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged.map((FirebaseUser user) => _getUserFromFirebase(user));
  }

  Future singInAnonymously() async {
    try {
     AuthResult result =  await _firebaseAuth.signInAnonymously();
     FirebaseUser user = result.user;
     return _getUserFromFirebase(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future singOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch(exception) {
      print(exception.toString());
      return null;
    }
  }
  
  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Enter sms code"),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    _firebaseAuth.currentUser().then((user) => {
                      if (user != null) {
                        Navigator.of(context).pop(),
                        Navigator.of(context).pushReplacementNamed("/homepage")
                      } else {
                        Navigator.of(context).pop()
                      }
                    });
                  },
                  child: null
              )
            ],
          );
      }
    );
  }

  void signIn(AuthCredential authCredential) {
    _firebaseAuth.signInWithCredential(authCredential);
  }
}