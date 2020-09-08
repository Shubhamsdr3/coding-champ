import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {

  final String hintText;
  final int maxLength;
  final Function onTextChanged;
  final FocusNode focusNode;

  TextInputField({this.hintText, @required this.maxLength, @required this.onTextChanged, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.center,
      autofocus: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: hintText,
          counterText: "",
          hintStyle: TextStyle(
              color: Colors.white54
          )
      ),
      onChanged: (value) {
        onTextChanged(value);
      }
    );
  }
}
