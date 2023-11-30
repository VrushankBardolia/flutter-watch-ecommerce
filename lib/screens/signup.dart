// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxetime/components/alerts.dart';
import 'package:luxetime/components/loader.dart';

import '../components/fullButton.dart';
import '../components/normalField.dart';
import '../components/passwordField.dart';
import '../components/snackbar.dart';
import '../util/theme.dart';

class SignUp extends StatefulWidget {
  final void Function() onTap;
  const SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final fnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  Alerts alerts=Alerts();
  MySnackbar snackbar = MySnackbar();

  signUp()async{
    try{
      showDialog(context: context, builder: (context)=>const Loader());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar.Success('Signed in!'));
      Get.back();
    }on FirebaseAuthException catch(e){
      Get.back();
      print('ERROR>>>>>>>>${e.code}');
      if(e.code=="weak-password"){
        alerts.SimpleAlert(context,'Your password is too weak!');
      }
      if(e.code=="email-already-in-use"){
        alerts.SimpleAlert(context,'Your e-mail is already used!');
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
                Text('Signup',style: MyTexts.heading),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Full Name',style: MyTexts.label),
                    NormalField(
                      controller: fnameController,
                      hint: 'First Last',
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
                      controller: phoneController,
                      hint: '+91 9876543210',
                      textType: TextInputType.phone,
                    ),
                    const SizedBox(height: 12),

                    Text('Password',style: MyTexts.label),
                    PasswordField(controller: passwordController)
                  ],
                ),
                const SizedBox(height: 20),

                FullButton(text: 'Create Account', onTap:signUp),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Already Have An Account?',style: MyTexts.hint),
                    const SizedBox(width: 8),

                    GestureDetector(
                      onTap: widget.onTap,
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
