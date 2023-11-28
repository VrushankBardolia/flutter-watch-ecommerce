import 'package:flutter/material.dart';
import 'package:luxetime/components/normalField.dart';
import 'package:luxetime/components/passwordField.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            NormalField(
                controller: nameController,
                hint: 'Full Name', textType: TextInputType.name,
            ),
            PasswordField(controller: passwordController)
          ],
        ),
      ),
    );
  }
}
