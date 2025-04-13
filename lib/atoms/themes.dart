import 'package:flutter/material.dart';

import 'tokens.dart';

/// A class that defines the themes used in the application.
abstract class AppThemes {
  /// The light theme for the application.
  static ThemeData lightTheme = ThemeData(
    // Adjusts the visual density of the UI based on the platform.
    visualDensity: VisualDensity.adaptivePlatformDensity,

    // Sets the default font family for the application.
    fontFamily: AppTypography.familyRoboto,

    // Defines the text styles used throughout the application.
    textTheme: TextTheme(
      // Style for large display text.
      displayLarge: TextStyle(
        fontSize: AppTypography.h1,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      // Style for medium display text.
      displayMedium: TextStyle(
        fontSize: AppTypography.h2,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      // Style for small display text.
      displaySmall: TextStyle(
        fontSize: AppTypography.body,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      // Style for large headlines.
      headlineLarge: TextStyle(
        fontSize: AppTypography.h3,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      // Style for large body text.
      bodyLarge: TextStyle(
        fontSize: AppTypography.body,
        fontWeight: FontWeight.normal,
        color: AppColors.primary,
        fontFamily: AppTypography.familyOpenSans,
      ),
      // Style for medium body text.
      bodyMedium: TextStyle(
        fontSize: AppTypography.h4,
        fontWeight: FontWeight.normal,
        color: const Color.fromARGB(255, 92, 92, 92),
        fontFamily: AppTypography.familyOpenSans,
      ),
      // Style for small body text.
      bodySmall: TextStyle(
        fontSize: AppTypography.h5,
        fontWeight: FontWeight.normal,
        color: AppColors.primary,
        fontFamily: AppTypography.familyOpenSans,
      ),
      // Style for prices.
      labelLarge: TextStyle(
        fontSize: AppTypography.h3,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
        fontFamily: AppTypography.familyKarla,
      ),
    ),
  );

  /// The light theme for the application.
  static ThemeData darkTheme = ThemeData(
    // Adjusts the visual density of the UI based on the platform.
    visualDensity: VisualDensity.adaptivePlatformDensity,

    // Sets the default font family for the application.
    fontFamily: AppTypography.familyRoboto,

    // Defines the text styles used throughout the application.
    textTheme: TextTheme(
      // Style for large display text.
      displayLarge: TextStyle(
        fontSize: AppTypography.h1,
        fontWeight: FontWeight.bold,
        color: AppColors.onPrimary,
      ),
      // Style for medium display text.
      displayMedium: TextStyle(
        fontSize: AppTypography.h2,
        fontWeight: FontWeight.bold,
        color: AppColors.onPrimary,
      ),
      // Style for small display text.
      displaySmall: TextStyle(
        fontSize: AppTypography.body,
        fontWeight: FontWeight.bold,
        color: AppColors.onPrimary,
      ),
      // Style for large headlines.
      headlineLarge: TextStyle(
        fontSize: AppTypography.h3,
        fontWeight: FontWeight.bold,
        color: AppColors.onPrimary,
      ),
      // Style for large body text.
      bodyLarge: TextStyle(
        fontSize: AppTypography.body,
        fontWeight: FontWeight.normal,
        color: AppColors.onPrimary,
        fontFamily: AppTypography.familyOpenSans,
      ),
      // Style for medium body text.
      bodyMedium: TextStyle(
        fontSize: AppTypography.h4,
        fontWeight: FontWeight.normal,
        color: AppColors.backGoundTextFormField,
        fontFamily: AppTypography.familyOpenSans,
      ),
      // Style for small body text.
      bodySmall: TextStyle(
        fontSize: AppTypography.h5,
        fontWeight: FontWeight.normal,
        color: AppColors.onPrimary,
        fontFamily: AppTypography.familyOpenSans,
      ),
      // Style for medium prices text.
      headlineMedium: TextStyle(
        fontSize: AppTypography.h2,
        fontWeight: FontWeight.bold,
        color: AppColors.onPrimary,
        fontFamily: AppTypography.familyKarla,
      ),
      // Style for small prices text.
      headlineSmall: TextStyle(
        fontSize: AppTypography.h3,
        fontWeight: FontWeight.bold,
        color: AppColors.onPrimary,
        fontFamily: AppTypography.familyKarla,
      ),
    ),
  );
}
