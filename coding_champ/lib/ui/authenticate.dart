import 'package:coding_champ/ui/singin.dart';
import 'package:flutter/cupertino.dart';

class Authenticate extends StatefulWidget {

  @override
  _AuthenticateState createState() => _AuthenticateState();

}

class _AuthenticateState extends State<Authenticate> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingIn(),
    );
  }
}
