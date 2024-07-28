import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: const Color(0XFF429698),
    onPrimary: const Color(0xFFFDF8FE),
    secondary: const Color(0XFF191A1C).withOpacity(0.9),
    onSecondary: const Color.fromARGB(255, 176, 176, 176),
    error: const Color(0XFFFF4850),
    onError: const Color(0xFFFDF8FE),
    surface: const Color(0xFF101010),
    onSurface: const Color(0xFFFDF8FE),
  ),
  cardTheme: const CardTheme(color: Color(0XFF191A1C)),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF101010),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.dark().textTheme,
  ),
);

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: const Color(0XFF6589F7),
    onPrimary: const Color(0xFFFDF8FE),
    secondary: const Color(0XFFEDEDED).withOpacity(0.9),
    onSecondary: const Color(0XFF6F6F6F),
    error: const Color(0XFFFF4850),
    onError: const Color(0xFFFDF8FE),
    surface: const Color(0xFFFDF8FE),
    onSurface: const Color(0xFF101010),
  ),
  cardTheme: const CardTheme(color: Color(0XFFEDEDED)),
  appBarTheme: const AppBarTheme(
    color: Color(0xFFFDF8FE),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.light().textTheme,
  ),
);
