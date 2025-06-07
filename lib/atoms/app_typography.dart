import 'package:fake_store_design/config/atomic_design_config.dart';

/// Centralized typography configuration for font families and text sizes.
///
/// This class defines the font families and standard text sizes
/// used throughout the application. It helps maintain consistency
/// across different screens and components.

abstract class AppTypography {
  // Font Families

  /// Font family used for general text, usually for body text.
  static String get familyRoboto => _getFamily('body');

  /// Font family used for headings and large text.
  static String get familyOpenSans => _getFamily('heading');

  /// Font family used for more casual or creative elements, like titles.
  static String get familyKarla => _getFamily('casual');

  // Text Sizes

  /// Default body text size.
  static double get body => _getSize("body");

  /// Small header text size (typically for smaller headings or subheadings).
  static double get h5 => _getSize("h5");

  /// Standard heading size, often used for subtitles.
  static double get h4 => _getSize("h4");

  /// Medium heading size, typically used for section titles.
  static double get h3 => _getSize("h3");

  /// Large heading size, typically used for page titles.
  static double get h2 => _getSize("h2");

  /// Largest heading size, typically used for main titles.
  static double get h1 => _getSize("h1");

  static String _getFamily(String key) {
    String spacing = AtomicDesignConfig.instance.config.typography.fonts[key]!;

    return spacing;
  }

  static double _getSize(String key) {
    double spacing = AtomicDesignConfig.instance.config.typography.sizes[key]!;

    return spacing;
  }
}

// abstract class AppTypography {
//   // Font Families

//   /// Font family used for general text, usually for body text.
//   static const String familyRoboto = 'Roboto';

//   /// Font family used for headings and large text.
//   static const String familyOpenSans = 'OpenSans';

//   /// Font family used for more casual or creative elements, like titles.
//   static const String familyKarla = 'Karla';

//   // Text Sizes

//   /// Default body text size.
//   static const double body = 18;

//   /// Small header text size (typically for smaller headings or subheadings).
//   static const double h5 = 12;

//   /// Standard heading size, often used for subtitles.
//   static const double h4 = 16;

//   /// Medium heading size, typically used for section titles.
//   static const double h3 = 22;

//   /// Large heading size, typically used for page titles.
//   static const double h2 = 28;

//   /// Largest heading size, typically used for main titles.
//   static const double h1 = 36;
// }
