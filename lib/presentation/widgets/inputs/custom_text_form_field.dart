import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: Colors.black, width: 2));
  // const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return TextFormField(
      onChanged: (value) {
        print(value);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El campo es requerido';
        }

        return 'Error en el formulario';
      },
      decoration: InputDecoration(
          enabledBorder: border,
          isDense: true,
          hintText: 'Este es el hint text',
          label: Text('Cualquier cosa'),
          focusColor: colors.primary,
          focusedBorder: border.copyWith(
              borderSide: BorderSide(color: colors.primary, width: 2))),
    );
  }
}
