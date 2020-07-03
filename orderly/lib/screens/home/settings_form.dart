import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orderly/models/user.dart';
import 'package:orderly/services/database.dart';
import 'package:orderly/shared/constants.dart';
import 'package:orderly/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> types = ['SLH', 'PHZ', 'AMN', 'SSH', 'ASK', 'OGK'];

  String _currentName;
  String _currentType = 'SLH';
  int _currentAmount;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<Userdata>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Userdata userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text('Update your order'),
                  SizedBox(height: 18),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration.copyWith(hintText: 'Name'),
                    validator: (value) =>
                        value.isEmpty ? 'Please enter a name' : null,
                    onChanged: (value) => setState(() => _currentName = value),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  // dropdown
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _currentType,
                    items: types.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => _currentType = value),
                  ),
                  SizedBox(height: 18),
                  Slider(
                    label: '${_currentAmount ?? userData.amount}',
                    value: (_currentAmount ?? userData.amount).toDouble(),
                    activeColor:
                        Colors.green[_currentAmount ?? userData.amount],
                    inactiveColor: Colors.green,
                    min: 100,
                    max: 900,
                    divisions: 8,
                    onChanged: (value) =>
                        setState(() => _currentAmount = value.round()),
                  ),

                  SizedBox(height: 18),
                  RaisedButton(
                    color: Colors.orange[800],
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: userData.uid).updateUserData(
                            _currentName ?? userData.name,
                            _currentType ?? userData.type,
                            _currentAmount ?? userData.amount);
                      }
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
