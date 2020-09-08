import 'package:coding_champ/ui/submit_button.dart';
import 'package:coding_champ/ui/text_input_field.dart';
import 'package:coding_champ/utils/common_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpVerification extends StatefulWidget {

  final String phoneNumber;
  final String verificationId;

  OtpVerification({@required this.phoneNumber, @required this.verificationId});

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  TextEditingController _textEditingController = TextEditingController(text: "");

  bool isValueSubmitted = false;
  final _firebaseAuth = FirebaseAuth.instance;

  String _otpCode = "";

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter OTP"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 0.0, top: 16.0, bottom: 80.0, right: 0.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Verify your phone number",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Please enter the verification code sent to",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                "+91 " + widget.phoneNumber,
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 16.0
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 30,
                        child: TextInputField(
                          maxLength: 1,
                          onTextChanged: (value) {
                            if(value.toString().length > 0) {
                              _otpCode = _otpCode + value;
                              FocusScope.of(context).nextFocus();
                            } else {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        )
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                        width: 30,
                        child:  TextInputField(
                          maxLength: 1,
                          onTextChanged: (value) {
                            if(value.toString().length > 0) {
                              _otpCode = _otpCode + value;
                              FocusScope.of(context).nextFocus();
                            } else {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        )
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                        width: 30,
                        child:  TextInputField(
                          maxLength: 1,
                          onTextChanged: (value) {
                            if(value.toString().length > 0) {
                              _otpCode = _otpCode + value;
                              FocusScope.of(context).nextFocus();
                            } else {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        )
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                        width: 30,
                        child:  TextInputField(
                          maxLength: 1,
                          onTextChanged: (value) {
                            if(value.toString().length > 0) {
                              _otpCode = _otpCode + value;
                              FocusScope.of(context).nextFocus();
                            } else {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        )
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                        width: 30,
                        child:  TextInputField(
                          maxLength: 1,
                          onTextChanged: (value) {
                            if(value.toString().length > 0) {
                              _otpCode = _otpCode + value;
                              FocusScope.of(context).nextFocus();
                            } else {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        )
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                        width: 30,
                        child:  TextInputField(
                          maxLength: 1,
                          onTextChanged: (value) {
                            if(value.toString().length > 0) {
                              _otpCode = _otpCode + value;
                              FocusScope.of(context).nextFocus();
                            } else {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        )
                    )
                  ],
                ),
              SizedBox(
                height: 30.0,
              ),
              SubmitButton(
                title: "Submit",
                onSubmitClicked: () {
                  if(_otpCode.length == 6) {
                    _signInWithOtp();
                  } else {
                    CommonUtil.showToast("Enter valid OTP");
                  }
                },
              )
            ]
          ),
        ),
      ),
    );
  }

  void _signInWithOtp() {
    AuthCredential authCredential = PhoneAuthProvider.getCredential(verificationId: widget.verificationId, smsCode: _otpCode);
    print(authCredential);
    _firebaseAuth.signInWithCredential(authCredential)
        .then((AuthResult value) => {
          if(value == null) {
            CommonUtil.showToast("Login failed")
          }
//       navigateToHome()
    }).catchError((error) {
      CommonUtil.showToast("Otp Invalid");
    });
  }
}
