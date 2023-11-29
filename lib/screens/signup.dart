import 'package:flutter/material.dart';

import '../components/fullButton.dart';
import '../components/normalField.dart';
import '../components/passwordField.dart';
import '../util/theme.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final fnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
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
                Text('Signup',style: MyTexts.heading),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Full Name',style: MyTexts.label),
                    NormalField(
                      controller: fnameController,
                      hint: 'Vrushank Bardolia',
                      textType: TextInputType.name,
                    ),
                    const SizedBox(height: 12),

                    Text('E-mail',style: MyTexts.label),
                    NormalField(
                      controller: emailController,
                      hint: 'example@domain.com',
                      textType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 12),

                    Text('Phone No.',style: MyTexts.label),
                    NormalField(
                      controller: emailController,
                      hint: '+91 9876543210',
                      textType: TextInputType.phone,
                    ),
                    const SizedBox(height: 12),

                    Text('Password',style: MyTexts.label),
                    PasswordField(controller: passwordController)
                  ],
                ),
                const SizedBox(height: 20),

                FullButton(text: 'Create Account', onTap: () {}),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Already Have An Account?',style: MyTexts.hint),
                    const SizedBox(width: 8),

                    GestureDetector(
                      // onTap: widget.onTap,
                      child: Text('Login', style: TextStyle(fontSize: 16,color: MyColors.primary)),
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
