import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const ColorScheme MyColors = ColorScheme(
  brightness: Brightness.light,

  primary: Color(0xFF002C6E),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFB5DAFF),
  onPrimaryContainer: Color(0xFF001E30),

  secondary: Color(0xFFA6BCFF),
  onSecondary: Color(0xFFFFFFFF),

  error: Color(0xFFAD3300),
  onError: Color(0xFFFFFFFF),

  // background: Color(0xFFFAFAFA),
  background: CupertinoColors.systemBackground,
  onBackground: Color(0xFF191C1D),

  surface: CupertinoColors.secondarySystemBackground,
  onSurface: Color(0xFF191C1D),
  surfaceVariant: Color(0xFFE7F1FD),
  surfaceTint: Color(0xFFCBEEFF),
);

class MyTexts extends TextStyle{

  static TextStyle largeTitle = GoogleFonts.inconsolata(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.5,
    color: MyColors.primary
  );

  static TextStyle title = GoogleFonts.inconsolata(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: MyColors.primary
  );

  static TextStyle heading = const TextStyle(fontSize: 32, fontWeight: FontWeight.w600,);

  static TextStyle subHeading = const TextStyle(fontSize: 24, fontWeight: FontWeight.w600,);

  static TextStyle label = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  static TextStyle hint = const TextStyle(fontSize: 16);
}