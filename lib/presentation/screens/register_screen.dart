import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miguel_forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:miguel_forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
      const FlutterLogo(
        size: 70,
      ),
      BlocProvider(
          create: (_) => RegisterCubit(), child: const _RegisterForm()),
      const SizedBox(
        height: 20,
      )
    ])));
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          onChanged: registerCubit.usernameChanged,
          label: 'Nombre de usuario',
          errorMessage: username.errorMessage,

          // validator: (value) {
          //   if (value == null || value.trim().isEmpty) {
          //     return 'El nombre de usuario es requerido';
          //   }

          //   return null;
          // },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: 'Correo electronico',
          errorMessage: email.errorMessage,
          onChanged: (value) {
            registerCubit.emailChanged(value);
          },
          // validator: (value) {
          //   if (value == null || value.trim().isEmpty) {
          //     return 'El correo electronico es requerido';
          //   }
          //   final emailRegExp = RegExp(
          //     r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
          //   );

          //   if (!emailRegExp.hasMatch(value)) {
          //     return 'Ingrese un formato de correo valido';
          //   }
          //   return null;
          // },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: 'Contraseña',
          obscureText: true,
          // validator: (value) {
          //   if (value == null || value.trim().isEmpty) {
          //     return 'La contraseña es requerida';
          //   }
          //   final emailRegExp = RegExp(
          //     r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
          //   );

          //   return null;
          // },
          onChanged: (value) {
            registerCubit.passwordChanged(value);
          },
        ),
        FilledButton.tonalIcon(
          onPressed: () {
            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.save),
          label: const Text('Crear usuario'),
        )
      ],
    ));
  }
}
