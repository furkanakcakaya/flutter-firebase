import 'package:flutter/material.dart';
import 'package:orderly/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        elevation: 0.0,
        title: Text('Sign In bruh'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person, color: Colors.white),
              label: Text('Register', style: TextStyle(color: Colors.white)))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(onChanged: (value) {
                setState(() {
                  email = value;
                });
              }),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  print('Email: $email, Pass: $password');
                  _auth.signInWithMail(email, password);
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepOrange[700],
              )
            ],
          ),
        ),
      ),
    );
  }
}
