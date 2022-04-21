import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Atomic {
  static Color _dark = Color(0xFF474b57);
  static Color _cab = Color(0xFFffd452);
  static Color _white = Color(0xFFffffff);
  static Color _black = Color(0xFF000000);
  static Color _formField = Color(0xFFF5F5F5);
  static Color _subtitle = Color(0xFFAEAEAE);

  static ThemeData buildTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: _dark
      ),
      scaffoldBackgroundColor: _white,
      primaryColor: _cab,
      textTheme: TextTheme(
        bodyText1: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: _black
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: _cab,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          textStyle: TextStyle(
            color: _subtitle,
          )
        ),
      ),
      iconTheme: IconThemeData(
        color: _subtitle
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: _formField,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24.0
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _cab
          ),
          borderRadius: BorderRadius.circular(5.0)
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),
        hintStyle: TextStyle(
          color: _subtitle
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _dark,
      ),
    );
  }
}