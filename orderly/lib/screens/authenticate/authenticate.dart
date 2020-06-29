import 'package:flutter/material.dart';
import 'package:orderly/screens/authenticate/register.dart';
import 'package:orderly/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleForm() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleForm);
    } else {
      return Register(toggleView: toggleForm);
    }
  }
}
