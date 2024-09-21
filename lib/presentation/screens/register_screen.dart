import 'package:flutter/material.dart';
import 'package:miguel_forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
      FlutterLogo(
        size: 70,
      ),
      _RegisterForm(),
      const SizedBox(
        height: 20,
      )
    ])));
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        CustomTextFormField(),
        SizedBox(
          height: 10,
        ),
        CustomTextFormField(),
        SizedBox(
          height: 10,
        ),
        FilledButton.tonalIcon(
          onPressed: () {},
          icon: const Icon(Icons.save),
          label: const Text('Crear usuario'),
        )
      ],
    ));
  }
}
