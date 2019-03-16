import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends Object with ValidationMixin {
  final _emailcntr = BehaviorSubject<String>();
  final _passwordcntr = BehaviorSubject<String>();

  // add data to stream
  Stream<String> get email => _emailcntr.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordcntr.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  // Change data
  Function(String) get changeEmail => _emailcntr.sink.add;
  Function(String) get changePassword => _passwordcntr.sink.add;

  // Submit data
  submit() {
    final validEmail = _emailcntr.value;
    final validPassword = _passwordcntr.value;
    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  dispose() {
    _emailcntr.close();
    _passwordcntr.close();
  }
}
