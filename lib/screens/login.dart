// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/alerts.dart';
import '../components/fullButton.dart';
import '../components/loader.dart';
import '../components/normalField.dart';
import '../components/passwordField.dart';
import '../components/snackbar.dart';
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
  Alerts alerts = Alerts();
  MySnackbar snackbar = MySnackbar();

  login()async{
    try{
      showDialog(context: context, builder: (context)=>const Loader());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar.Success('Logged in!'));
      Get.back();
    }on FirebaseAuthException catch(e){
      Get.back();
      // print('ERROR>>>>>>>>${e.code}');
      if(e.code=="invalid-credential"){
        alerts.SimpleAlert(context,"Invalid E-mail or Password");
      }
      if(e.code=="invalid-email"){
        alerts.SimpleAlert(context,"Enter properly formatted \nE-mail!");
      }
      // alerts.SimpleAlert(context, e.code);
    }
  }

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

                FullButton(text: 'Login', onTap: login),
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
