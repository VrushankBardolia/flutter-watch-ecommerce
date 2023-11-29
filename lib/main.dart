import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/signup.dart';
import '../util/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LuxeTime',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: MyColors,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home:const SignUp()
    );
  }
}
