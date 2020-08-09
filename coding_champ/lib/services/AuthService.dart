
import 'package:firebase_auth/firebase_auth.dart';

/// 1. Sign-in anonymously
/// 2. Sign-in with phone number
/// 3. Register
/// 4. Sign-out
class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future singInAnonymously() async {
    try {
     AuthResult result =  await _firebaseAuth.signInAnonymously();
     FirebaseUser user = result.user;
     return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}