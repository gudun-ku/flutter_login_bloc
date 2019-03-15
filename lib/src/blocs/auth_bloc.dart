import 'dart:async';
import 'validators.dart';

class AuthBloc extends Object with ValidationMixin {
  final _emailcntr = StreamController<String>();
  final _passwordcntr = StreamController<String>();

  // add data to stream
  Stream<String> get email => _emailcntr.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordcntr.stream.transform(validatePassword);

  // Change data
  Function(String) get changeEmail => _emailcntr.sink.add;
  Function(String) get changePassword => _passwordcntr.sink.add;

  dispose() {
    _emailcntr.close();
    _passwordcntr.close();
  }
}

// single glogal instance

final authBloc = AuthBloc();
