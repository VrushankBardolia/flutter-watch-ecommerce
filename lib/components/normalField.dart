import 'package:flutter/material.dart';
import 'package:luxetime/util/theme.dart';

class NormalField extends StatelessWidget {
  final TextEditingController controller ;
  final String hint;
  final TextInputType textType;

  const NormalField({super.key, required this.controller, required this.hint, required this.textType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).colorScheme.primary,
      controller: controller,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: MyTexts.hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2
          )
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
      keyboardType: textType,
    );
  }
}
