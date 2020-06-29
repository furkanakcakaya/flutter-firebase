import 'package:flutter/material.dart';
import 'package:orderly/models/user.dart';
import 'package:orderly/screens/authenticate/authenticate.dart';
import 'package:orderly/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    print('$user asfsafsd');
    // Return either home or auth
    return user != null ? Home() : Authenticate();
  }
}
