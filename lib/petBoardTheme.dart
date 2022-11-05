import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetBoardTheme {
// 1
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline1: GoogleFonts.openSans(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline3: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    headline6: GoogleFonts.openSans(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black),
  );
// 2
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
    headline1: GoogleFonts.openSans(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.white),
    headline3: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    headline6: GoogleFonts.openSans(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
  );
  static ThemeData light() {
    return ThemeData(
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Color.fromARGB(255, 255, 197, 51)),
      textTheme: lightTextTheme,
      snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.green),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color.fromARGB(255, 255, 197, 51),
        secondary: Colors.black,
        brightness: Brightness.light,
      ),
    );
  }

// 4
  static ThemeData dark() {
    return ThemeData(
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 255, 197, 51),
      ),
      textSelectionTheme:
          const TextSelectionThemeData(selectionColor: Colors.green),
      textTheme: darkTextTheme,
      snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.white),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        surface: Colors.grey[900],
        secondary: Colors.green[600],
        brightness: Brightness.dark,
      ),
    );
  }
}
