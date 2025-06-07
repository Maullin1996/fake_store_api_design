import 'package:fake_store_design/config/atomic_design_config.dart';
import 'package:flutter/material.dart';

/// Defines the color palette used throughout the app.
///
/// This includes brand colors, background surfaces, and semantic colors
/// (e.g., for text, errors, disabled states, etc.).
///

abstract class AppColors {
  // Primary brand colors
  static Color get primary => _getColor('primary');
  static Color get primaryVariant => _getColor('primaryVariant');

  // Secondary brand colors
  static Color get secondary => _getColor('secondary');
  static Color get secondaryVariant => _getColor('secondaryVariant');

  // Backgrounds and surfaces
  static Color get background => _getColor('background');
  static Color get surface => _getColor('surface');

  // Error colors
  static Color get error => _getColor('error');
  static Color get onError => _getColor('onError');

  // Text colors on various backgrounds
  static Color get onPrimary => _getColor('onPrimary');
  static Color get onSecondary => _getColor('onSecondary');
  static Color get onBackground => _getColor('onBackground');
  static Color get onSurface => _getColor('onSurface');

  // UI utility colors
  static Color get disabledButton => _getColor('disabledButton');
  static Color get backgroundText => _getColor('backgroundText');
  static Color get backgroundTextFormField =>
      _getColor('backgroundTextFormField');

  // Toast colors (success)
  static Color get backgroundFlutterToast =>
      _getColor('backgroundFlutterToast');
  static Color get textFlutterToast => _getColor('textFlutterToast');

  // Toast colors (error)
  static Color get backgroundFlutterToastError =>
      _getColor('backgroundFlutterToastError');
  static Color get textFlutterToastError => _getColor('textFlutterToastError');

  static Color _getColor(String key) {
    String hex = AtomicDesignConfig.instance.config.colors[key]!.replaceFirst(
      '#',
      '',
    );
    if (hex.length == 6) {
      hex = 'FF$hex';
    }

    return Color(int.parse(hex, radix: 16));
  }
}

// abstract class AppColors {
//   // Primary brand colors
//   static const Color primary = Color(0xFF032F37);
//   static const Color primaryVariant = Color(0xFF021D22);

//   // Secondary brand colors
//   static const Color secondary = Color(0xFFBA5824);
//   static const Color secondaryVariant = Color(0xFF8A3E19);

//   // Backgrounds and surfaces
//   static const Color background = Color(0xFFF2EFEE);
//   static const Color surface = Color(0xFFFFFFFF);

//   // Error colors
//   static const Color error = Color(0xFFD32F2F);
//   static const Color onError = Color(0xFFFFFFFF);

//   // Text colors on various backgrounds
//   static const Color onPrimary = Color(0xFFFFFFFF);
//   static const Color onSecondary = Color(0xFFFFFFFF);
//   static const Color onBackground = Color(0xFF032F37);
//   static const Color onSurface = Color(0xFF212121);

//   // UI utility colors
//   static const Color disabledButton = Color(0xFF969696);
//   static const Color backgroundText = Color(0xBF032F37); // 0.75 alpha
//   static const Color backgroundTextFormField = Color(0xA8EEEEEE); // 0.66 alpha

//   // Toast colors (success)
//   static const Color backgroundFlutterToast = Color(0xFFE8F5E9); // green[50]
//   static const Color textFlutterToast = Color(0xFF4CAF50); // green

//   // Toast colors (error)
//   static const Color backgroundFlutterToastError = Color(0xFFFFEBEE); // red[50]
//   static const Color textFlutterToastError = Color(0xFFF44336); // red
// }
