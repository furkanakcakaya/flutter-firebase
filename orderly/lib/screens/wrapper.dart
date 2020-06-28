import 'package:flutter/material.dart';
import 'package:orderly/screens/authenticate/authenticate.dart';
import 'package:orderly/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // Return either home or auth 
    return Authenticate();
  }
}