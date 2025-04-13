import 'package:flutter/material.dart';

/// Defines the color palette for the e-commerce application.
abstract class AppColors {
  // Primary color scheme
  static const Color primary = Color(0xFF032F37); // Deep teal
  static const Color primaryVariant = Color(0xFF021D22); // Darker teal

  // Secondary color scheme
  static const Color secondary = Color(0xFFBA5824); // Warm earthy orange
  static const Color secondaryVariant = Color(0xFF8A3E19); // Darker orange

  // Neutral and background colors
  static const Color background = Color(0xFFF2EFEE); // Soft off-white
  static const Color surface = Color(0xFFFFFFFF); // Pure white

  // Error color
  static const Color error = Color(0xFFD32F2F); // Standard red for errors

  // Text and icon colors
  static const Color onPrimary = Color(
    0xFFFFFFFF,
  ); // White for contrast on primary
  static const Color onSecondary = Color(
    0xFFFFFFFF,
  ); // White for contrast on secondary
  static const Color onBackground = Color(
    0xFF032F37,
  ); // Deep teal for readability
  static const Color onSurface = Color(
    0xFF212121,
  ); // Dark gray for surface readability
  static const Color onError = Color(0xFFFFFFFF); // White for contrast on error

  // Semi-transparent text color for background elements
  static const Color backGroundText = Color.fromRGBO(
    3,
    47,
    55,
    0.75,
  ); // Transparent teal

  static const Color disabledButton = Color.fromARGB(
    255,
    150,
    150,
    150,
  ); // Pure white

  static const Color backGoundTextFormField = Color.fromARGB(
    169,
    238,
    238,
    238,
  ); // light gray for surface readability

  static Color backGoundFutterToast =
      Colors.green[50]!; // light green for background FutterToast

  static const Color textFutterToast =
      Colors.green; // light green for text dialogs

  static Color backGoundFutterToastError =
      Colors.red[50]!; // light green for background FutterToast

  static const Color textFutterToastError =
      Colors.red; // light green for text dialogs
}
