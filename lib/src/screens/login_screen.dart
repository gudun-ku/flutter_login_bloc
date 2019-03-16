import 'package:flutter/material.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = AuthProvider.of(context);

    return Container(
      margin: EdgeInsets.all(32.0),
      child: Column(
        children: <Widget>[
          Text('Please, log in'),
          emailField(authBloc),
          passwordField(authBloc),
          SizedBox(
            height: 16.0,
          ),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField(AuthBloc authBloc) {
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

  Widget passwordField(AuthBloc authBloc) {
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
