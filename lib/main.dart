import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/theme.dart';
import '../helper/authHelper.dart';
import '../helper/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home:const AuthPage()
    );
  }
}
