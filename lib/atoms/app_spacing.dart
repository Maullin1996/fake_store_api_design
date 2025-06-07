import 'package:fake_store_design/config/atomic_design_config.dart';

/// Defines spacing values used throughout the app.
///
/// These constants are used for padding, margin, gaps, and layout consistency.
abstract class AppSpacing {
  /// Extra-extra small spacing. Suitable for tight UI elements.
  static double get xSmall => _getSpacing('xSmall');

  /// Small spacing. Commonly used for compact padding/margin.
  static double get small => _getSpacing('small');

  /// Medium-small spacing. Ideal for spacing between inline elements.
  static double get smallMedium => _getSpacing('smallMedium');

  /// Standard medium spacing. Often used for section padding.
  static double get medium => _getSpacing('medium');

  /// Medium-large spacing. Great for separating larger UI blocks.
  static double get mediumLarge => _getSpacing('mediumLarge');

  /// Large spacing. Used for modals, cards, or page sections.
  static double get large => _getSpacing('large');

  /// Extra large spacing. Typically for hero sections or full-width content.
  static double get extraLarge => _getSpacing('extraLarge');

  static double _getSpacing(String key) {
    double spacing = AtomicDesignConfig.instance.config.spacing[key]!;

    return spacing;
  }
}

// abstract class AppSpacing {
//   /// Extra-extra small spacing. Suitable for tight UI elements.
//   static const double xSmall = 8.0;

//   /// Small spacing. Commonly used for compact padding/margin.
//   static const double small = 12.0;

//   /// Medium-small spacing. Ideal for spacing between inline elements.
//   static const double smallMedium = 24.0;

//   /// Standard medium spacing. Often used for section padding.
//   static const double medium = 34.0;

//   /// Medium-large spacing. Great for separating larger UI blocks.
//   static const double mediumLarge = 44.0;

//   /// Large spacing. Used for modals, cards, or page sections.
//   static const double large = 64.0;

//   /// Extra large spacing. Typically for hero sections or full-width content.
//   static const double extraLarge = 124.0;
// }
