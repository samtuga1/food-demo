import 'package:flutter/material.dart';

class MyTheme {
  // ignore: non_constant_identifier_names
  static ThemeData get app_theme => ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Gilroy'),
          bodyMedium: TextStyle(fontSize: 18, fontFamily: 'Gilroy'),
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
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
