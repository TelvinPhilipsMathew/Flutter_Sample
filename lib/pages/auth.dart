import 'package:flutter/material.dart';

import './products.dart';

class AuthPage extends StatelessWidget {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Builder(builder: (builderContext) {
       return Container(
            margin: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(labelText: 'Password'),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                RaisedButton(
                    child: Text('Login'),
                    onPressed: () {
                      Scaffold.of(builderContext).showSnackBar(SnackBar(
                          content: Text('Welcome ' + email.toString())));
                      Navigator.pushReplacementNamed(context, "/products");
                    }),
              ],
            ));
      }),
    );
    ;
  }
}
