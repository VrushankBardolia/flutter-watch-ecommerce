import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home.dart';
import '../util/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Get.offAll(()=>const Home());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts:[
            TyperAnimatedText('LuxeTime',
              textStyle: MyTexts.largeTitle,
              speed: const Duration(milliseconds: 300),
              curve: Curves.easeInOut
            )
          ],
        ),
      ),
    );
  }
}
