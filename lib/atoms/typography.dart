/// Centralized typography configuration for font families and text sizes.
///
/// This class defines the font families and standard text sizes
/// used throughout the application. It helps maintain consistency
/// across different screens and components.
abstract class AppTypography {
  // Font Families

  /// Font family used for general text, usually for body text.
  static const String familyRoboto = 'Roboto';

  /// Font family used for headings and large text.
  static const String familyOpenSans = 'OpenSans';

  /// Font family used for more casual or creative elements, like titles.
  static const String familyKarla = 'Karla';

  // Text Sizes

  /// Default body text size.
  static const double body = 18;

  /// Small header text size (typically for smaller headings or subheadings).
  static const double h5 = 12;

  /// Standard heading size, often used for subtitles.
  static const double h4 = 16;

  /// Medium heading size, typically used for section titles.
  static const double h3 = 22;

  /// Large heading size, typically used for page titles.
  static const double h2 = 28;

  /// Largest heading size, typically used for main titles.
  static const double h1 = 36;
}
