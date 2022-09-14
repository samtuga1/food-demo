import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  // ignore: non_constant_identifier_names
  static ThemeData get app_theme => ThemeData(
        textTheme: GoogleFonts.rubikTextTheme().copyWith(
          titleLarge: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: const TextStyle(
            fontSize: 18,
          ),
        ),
        // TextTheme(
        //   titleLarge: GoogleFonts.rubik(
        //     fontSize: 22,
        //     fontWeight: FontWeight.w600,
        //   ),
        //   bodyMedium: GoogleFonts.rubik(
        //     fontSize: 18,
        //   ),
        // ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: GoogleFonts.rubik(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
