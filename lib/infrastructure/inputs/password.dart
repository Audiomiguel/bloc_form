import 'package:formz/formz.dart';

enum PasswordError { empty, format }

class Password extends FormzInput<String, PasswordError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordError? validator(String value) {
    if (value.trim().isEmpty) return PasswordError.empty;

    if (value.trim().length < 6) return PasswordError.format;

    return null;
  }
}
