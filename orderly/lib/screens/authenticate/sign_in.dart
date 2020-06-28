import 'package:flutter/material.dart';
import 'package:orderly/services/auth.dart';

 class SignIn extends StatefulWidget {
   @override
   _SignInState createState() => _SignInState();
 }
 
 class _SignInState extends State<SignIn> {

   final AuthService _auth = AuthService();
  
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.green[200],
       appBar: AppBar(
         backgroundColor: Colors.green[500],
         elevation: 0.0,
         title: Text('Sign In bruh'),
       ),
       body: Container(
         padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
         child: RaisedButton(
           child: Text('Sign in Anon'),
           onPressed: () async{
             dynamic result = await _auth.signInAnon();
             if( result == null ){
               print('Error signing in.');
             }
             else{
               print('signed in $result');
             }
           }
           ),
       ),
    
     );
   }
 }