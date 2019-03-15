import 'dart:async';
import 'validators.dart';

class AuthBloc extends Object with ValidationMixin {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  // add data to stream
  Stream<String> get email => _emailController.stream;
  Stream<String> get password => _passwordController.stream;

  // Change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
}
