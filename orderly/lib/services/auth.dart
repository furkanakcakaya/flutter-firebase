import 'package:firebase_auth/firebase_auth.dart';
import 'package:orderly/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj base on the user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print('Anon sign-in failed. Error: $e');
      return null;
    }
  }

  //sign in with e-mail
  Future signInWithMail(String mail, String pass) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: mail, password: pass);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print('Email sign-in failed. Error: $e');
      return null;
    }
  }

  //register with e-mail

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('sign out failed. error: ${e.toString()}');
    }
  }
}
