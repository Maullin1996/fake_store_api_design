import 'package:flutter/material.dart';
import 'tokens.dart';

/// Centralized theme configuration for light and dark modes.
///
/// Defines consistent text styles, font families, and colors using the
/// AppTypography and AppColors constants.
abstract class AppThemes {
  /// Light theme configuration.
  static final ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: AppTypography.familyRoboto,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: AppTypography.h1,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      displayMedium: TextStyle(
        fontSize: AppTypography.h2,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      displaySmall: TextStyle(
        fontSize: AppTypography.body,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      headlineLarge: TextStyle(
        fontSize: AppTypography.h3,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      bodyLarge: TextStyle(
        fontSize: AppTypography.body,
        fontWeight: FontWeight.normal,
        color: AppColors.primary,
        fontFamily: AppTypography.familyOpenSans,
      ),
      bodyMedium: TextStyle(
        fontSize: AppTypography.h4,
        fontWeight: FontWeight.normal,
        color: Color(0xFF5C5C5C),
        fontFamily: AppTypography.familyOpenSans,
      ),
      bodySmall: TextStyle(
        fontSize: AppTypography.h5,
        fontWeight: FontWeight.normal,
        color: AppColors.primary,
        fontFamily: AppTypography.familyOpenSans,
      ),
      labelLarge: TextStyle(
        fontSize: AppTypography.h3,
        color: AppColors.primary,
        fontFamily: AppTypography.familyKarla,
      ),
    ),
  );
}
