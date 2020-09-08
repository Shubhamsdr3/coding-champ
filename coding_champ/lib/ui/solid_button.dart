import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SolidButton extends StatefulWidget {

  @override
  _SolidButtonState createState() => _SolidButtonState();

}

class _SolidButtonState extends State<SolidButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      child: RaisedButton(

        onPressed: _onSolidButtonClicked(),
      ),
    );
  }

  _onSolidButtonClicked() {

  }
}
