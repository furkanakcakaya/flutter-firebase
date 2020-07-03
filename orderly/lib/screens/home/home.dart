import 'package:flutter/material.dart';
import 'package:orderly/models/order.dart';
import 'package:orderly/screens/home/settings_form.dart';
import 'package:orderly/services/auth.dart';
import 'package:orderly/services/database.dart';
import 'package:provider/provider.dart';
import 'order_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Order>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          elevation: 0.0,
          title: Text('Orderly'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text('Change order')),
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Sign out'))
          ],
        ),
        body: OrderList(),
      ),
    );
  }
}
