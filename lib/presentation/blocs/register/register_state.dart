part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final Username username;
  final Email email;
  final bool isValid;
  final Password password;
  final FormStatus formStatus;

  const RegisterFormState(
      {this.username = const Username.pure(),
      this.email = const Email.pure(),
      this.isValid = false,
      this.password = const Password.pure(),
      this.formStatus = FormStatus.invalid});

  RegisterFormState copyWith({
    FormStatus? formStatus,
    Username? username,
    Email? email,
    Password? password,
    bool? isValid,
  }) =>
      RegisterFormState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
      );

  @override
  List<Object> get props => [formStatus, isValid, username, email, password];
}
