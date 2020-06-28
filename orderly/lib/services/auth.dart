import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print('Anon sign-in failed. Error: $e');
      return null;
    }
  }

  //sign in with e-mail


  //register with e-mail


  //sign out

  
}