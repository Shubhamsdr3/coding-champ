import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {

  final VoidCallback onSubmitClicked;

  final String title;

  SubmitButton({@required this.title, @required this.onSubmitClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 46,
      child: RaisedButton(
        padding: EdgeInsets.only(left: 12.0, top: 0.0, right: 12.0, bottom: 0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        color: Colors.deepOrangeAccent[200],
        child: Text(
          "Send",
          style: TextStyle(
              color: Colors.white
          ),
        ),
        onPressed: () {
          onSubmitClicked();
        },
      ),
    );
  }
}
