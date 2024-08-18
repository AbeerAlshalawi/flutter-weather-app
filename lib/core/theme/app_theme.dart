import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2162C2),
        surface: const Color(0xFF2162C2),
        onSurface: Colors.white),
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
