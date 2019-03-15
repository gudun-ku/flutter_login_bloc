import 'dart:async';

class ValidationMixin {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isEmpty ||
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      sink.addError('Valid Email is required.');
    } else {
      sink.add(value);
    }
  });

  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isEmpty || value.length < 5) {
      sink.addError('Password must be at least 5 characters long');
    } else {
      sink.add(value);
    }
  });
}
