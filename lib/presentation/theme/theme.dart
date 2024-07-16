import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: const Color(0xFF00A8DE),
  primaryColorDark: const Color(0xFF046DB5),
  primaryColorLight: const Color(0xFF9BE7FF),
  scaffoldBackgroundColor: const Color(0xFFEFFCFF),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Color(0xFF9BE7FF),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFFEFFCFF),
    elevation: 0,
    iconTheme: const IconThemeData(
      color: Color(0xFF046DB5),
    ),
    titleTextStyle: TextStyle(
      color: const Color(0xFF046DB5),
      fontSize: 22,
      fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold).fontFamily,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    prefixStyle: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily:
            GoogleFonts.poppins(fontWeight: FontWeight.bold).fontFamily),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    ),
    filled: true,
    fillColor: Colors.white.withOpacity(.4),
    focusColor: Colors.white.withOpacity(.4),
  ),
);
