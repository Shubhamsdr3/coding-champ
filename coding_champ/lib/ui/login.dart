
import 'package:coding_champ/models/user.dart';
import 'package:coding_champ/services/auth_service.dart';
import 'package:coding_champ/ui/home.dart';
import 'package:coding_champ/ui/otp_verification.dart';
import 'package:coding_champ/ui/submit_button.dart';
import 'package:coding_champ/utils/common_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _authService = AuthService();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _phoneNumber = "";
  String _verificationId = "";
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: !codeSent,
                child: Text(
                  "Enter your Mobile number to create an account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(
                height: 14
              ),
              Visibility(
                visible: !codeSent,
                child: Text(
                  "You will receive an OTP",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16
                  ),
                ),
              ),
              Visibility(
                visible: !codeSent,
                child: Container(
                  width: 200,
                  child: Row(
                    children: <Widget>[
                      Text(
                          "+91",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      Expanded(
                        child: TextFormField(
                          maxLength: 10,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Mobile Number",
                            hintStyle: TextStyle(
                              color: Colors.white54
                            )
                          ),
                          onChanged: (value) {
                            setState(() {
                              this._phoneNumber = value.trim();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 42,
              ),
              Visibility(
                visible: !codeSent,
                child: SubmitButton(
                  title: "Send",
                  onSubmitClicked: () {
                    _verifyPhone(_phoneNumber);
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => OtpVerification(phoneNumber: this._phoneNumber)
                        )
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
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
                    "Skip",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent[200]
                    ),
                  ),
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
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // on send button clicked
  Future<void>  _verifyPhone(String phoneNumber) async {
    String fullPhoneNumber = "+91 " + phoneNumber;
    print(fullPhoneNumber);

    final PhoneVerificationCompleted _verified = (AuthCredential authCredential) {
//      _signIn(authCredential);
    };

    final PhoneVerificationFailed verificationFailed = (AuthException authException) {
      print(authException.message);
      CommonUtil.showToast("Login failed.");
    };

    final PhoneCodeSent smsCodeSent = (String verificationId, [int forceCodeSend]) {
      this._verificationId = verificationId;
      print(forceCodeSend);
      setState(() {
        this.codeSent = true;
      });
      print("Code sent: " + verificationId);
    };

    final PhoneCodeAutoRetrievalTimeout _autoRetrievalTimeout = (String verificationId) {
      this._verificationId = verificationId;
      print("Timeout");
    };

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: fullPhoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: _verified,
        verificationFailed: verificationFailed,
        codeSent: smsCodeSent,
        codeAutoRetrievalTimeout: _autoRetrievalTimeout
    );
  }

  void navigateToHome() {
    final user = Provider.of<User>(context, listen: false);
    if(user == null) {
      //user is singed out
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      // user is logged in
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

}
