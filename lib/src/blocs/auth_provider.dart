import 'package:flutter/material.dart';
import 'auth_bloc.dart';

class AuthProvider extends InheritedWidget {
  final bloc = AuthBloc();

  AuthProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static AuthBloc of(context) {
    return (context.inheritFromWidgetOfExactType(AuthProvider) as AuthProvider)
        .bloc;
  }
}
