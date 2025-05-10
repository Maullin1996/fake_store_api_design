import 'package:flutter/material.dart';

/// Defines the color palette used throughout the app.
///
/// This includes brand colors, background surfaces, and semantic colors
/// (e.g., for text, errors, disabled states, etc.).
abstract class AppColors {
  // Primary brand colors
  static const Color primary = Color(0xFF032F37);
  static const Color primaryVariant = Color(0xFF021D22);

  // Secondary brand colors
  static const Color secondary = Color(0xFFBA5824);
  static const Color secondaryVariant = Color(0xFF8A3E19);

  // Backgrounds and surfaces
  static const Color background = Color(0xFFF2EFEE);
  static const Color surface = Color(0xFFFFFFFF);

  // Error colors
  static const Color error = Color(0xFFD32F2F);
  static const Color onError = Color(0xFFFFFFFF);

  // Text colors on various backgrounds
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF032F37);
  static const Color onSurface = Color(0xFF212121);

  // UI utility colors
  static const Color disabledButton = Color.fromARGB(255, 150, 150, 150);
  static const Color backgroundText = Color.fromRGBO(3, 47, 55, 0.75);
  static const Color backgroundTextFormField = Color.fromARGB(
    169,
    238,
    238,
    238,
  );

  // Toast colors (success)
  static final Color backgroundFlutterToast = Colors.green[50]!;
  static const Color textFlutterToast = Colors.green;

  // Toast colors (error)
  static final Color backgroundFlutterToastError = Colors.red[50]!;
  static const Color textFlutterToastError = Colors.red;
}
