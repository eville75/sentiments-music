import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  // H1 – Títulos principais
  static TextStyle h1 = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  // H2 – Subtítulos
  static TextStyle h2 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Corpo de texto
  static TextStyle body = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );

  // Título de componentes (como cards)
  static TextStyle componentTitle = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static var h3;
}
