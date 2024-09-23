import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:miguel_forms_app/infrastructure/inputs/inputs.dart';
import 'package:miguel_forms_app/infrastructure/inputs/password.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    state.copyWith(
        formStatus: FormStatus.validating,
        username: Username.dirty(state.username.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([state.username, state.email, state.password]));

    print(
        'Submiting mIki ${state.username.value} ${state.email.value} ${state.password.value}');
  }

  void usernameChanged(String value) {
    print('Username changed $value');
    final username = Username.dirty(value);
    emit(state.copyWith(
        username: username,
        isValid: Formz.validate([username, state.password, state.email])));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
        email: email,
        isValid: Formz.validate([state.username, email, state.password])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([state.username, state.email, password])));
  }
}
