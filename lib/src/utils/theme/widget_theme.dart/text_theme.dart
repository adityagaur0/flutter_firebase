import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        color: Colors.black87, fontSize: 28, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(
        color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold),
    displaySmall: GoogleFonts.poppins(color: Colors.black54, fontSize: 14),
    headlineSmall: GoogleFonts.montserrat(
        color: const Color.fromRGBO(0, 0, 0, 0.867),
        fontSize: 14,
        fontWeight: FontWeight.bold),
    headlineMedium: GoogleFonts.montserrat(
        color: const Color.fromRGBO(0, 0, 0, 0.867),
        fontSize: 18,
        fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.poppins(
        color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w400),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        color: Colors.white70, fontSize: 28, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(
        color: Colors.white70, fontSize: 24, fontWeight: FontWeight.bold),
    displaySmall: GoogleFonts.poppins(color: Colors.white60, fontSize: 14),
    headlineSmall: GoogleFonts.montserrat(
        color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold),
    headlineMedium: GoogleFonts.montserrat(
        color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.poppins(
        color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w400),
  );
}
