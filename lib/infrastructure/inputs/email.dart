import 'package:formz/formz.dart';

enum EmailError { empty, format }

class Email extends FormzInput<String, EmailError> {
  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  const Email.pure() : super.pure('');
  const Email.dirty(String value) : super.dirty(value);

  @override
  EmailError? validator(String value) {
    if (value.trim().isEmpty) return EmailError.empty;

    if (!emailRegExp.hasMatch(value)) {
      return EmailError.format;
    }
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailError.empty) {
      return 'El correo electronico es requerido';
    }

    if (displayError == EmailError.format) {
      return 'Ingrese un formato de correo valido';
    }

    return null;
  }
}
