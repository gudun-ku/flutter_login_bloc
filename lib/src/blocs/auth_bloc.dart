import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends Object with ValidationMixin {
  final _emailcntr = StreamController<String>.broadcast();
  final _passwordcntr = StreamController<String>.broadcast();

  // add data to stream
  Stream<String> get email => _emailcntr.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordcntr.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  // Change data
  Function(String) get changeEmail => _emailcntr.sink.add;
  Function(String) get changePassword => _passwordcntr.sink.add;

  dispose() {
    _emailcntr.close();
    _passwordcntr.close();
  }
}
