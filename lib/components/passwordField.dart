import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller ;

  const PasswordField({super.key, required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool passwordVisible= false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: '******',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              width: 2
            ),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        suffixIcon: IconButton(
          icon: Icon(passwordVisible ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        )
      ),
      cursorColor: Theme.of(context).colorScheme.primary,
      obscureText: !passwordVisible,
      obscuringCharacter: '●',
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
