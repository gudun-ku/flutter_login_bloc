import 'package:flutter/material.dart';
import '../blocs/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text('Login screen'),
          emailField(),
          passwordField(),
          SizedBox(
            height: 8.0,
          ),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'email@example.com',
        labelText: 'Email address:',
        errorText: 'Email is not valid',
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      decoration: InputDecoration(
          hintText: '*****',
          labelText: 'Password:',
          errorText: 'Password must be at least 5 symbols'),
      obscureText: true,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Login'),
      color: Colors.orange,
      onPressed: () {},
    );
  }
}
