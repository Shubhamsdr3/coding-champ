import 'package:coding_champ/ui/authenticate.dart';
import 'package:flutter/cupertino.dart';

/// Decides whether user is logged in or not
class Navigate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // either home or login
    return Authenticate();
  }
}
