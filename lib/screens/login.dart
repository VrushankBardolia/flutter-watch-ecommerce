import 'package:flutter/material.dart';

import '../components/fullButton.dart';
import '../components/normalField.dart';
import '../components/passwordField.dart';
import '../util/theme.dart';

class Login extends StatefulWidget {
  final void Function() onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const SizedBox(height: 20),

                Text('Login',style: MyTexts.heading),
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('E-mail',style: MyTexts.label),
                    NormalField(
                      controller: emailController,
                      hint: 'example@domain.com',
                      textType: TextInputType.name,
                    ),
                    const SizedBox(height: 12),

                    Text('Password',style: MyTexts.label),
                    PasswordField(controller: passwordController)
                  ],
                ),
                const SizedBox(height: 50),

                FullButton(text: 'Login', onTap: () {}),

                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Don\'t Have An Account?',style: MyTexts.hint),
                    const SizedBox(width: 8),

                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Sign Up',
                        style: TextStyle(fontSize: 16,color: MyColors.primary)
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
