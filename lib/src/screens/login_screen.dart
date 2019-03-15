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
    return StreamBuilder(
      stream: authBloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: authBloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'email@example.com',
            labelText: 'Email address:',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
        stream: authBloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: authBloc.changePassword,
            decoration: InputDecoration(
                hintText: '*****',
                labelText: 'Password:',
                errorText: snapshot.error),
            obscureText: true,
          );
        });
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Login'),
      color: Colors.orange,
      onPressed: () {},
    );
  }
}
