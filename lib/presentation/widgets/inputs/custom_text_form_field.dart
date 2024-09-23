import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.obscureText = false,
      this.validator});
  // const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(color: Colors.black, width: 2));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: border,
          isDense: true,
          focusedErrorBorder: border.copyWith(
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          errorText: errorMessage,
          errorBorder: border.copyWith(
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          hintText: hint,
          label: label != null ? Text(label!) : null,
          focusColor: colors.primary,
          focusedBorder: border.copyWith(
              borderSide: BorderSide(color: colors.primary, width: 2))),
    );
  }
}
