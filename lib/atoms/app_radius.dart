import 'package:fake_store_design/config/atomic_design_config.dart';

/// Defines the radius values used throughout the app.
///
/// These constants help maintain consistent corner rounding
/// and support scalable theming based on design guidelines.
abstract class AppRadius {
  /// A small radius value — typically used for subtle rounding.
  static double get small => _getRadious('small');

  /// A medium radius value — commonly used for cards or buttons.
  static double get medium => _getRadious('medium');

  /// A large radius value — used for prominent rounded elements.
  static double get large => _getRadious('large');

  /// An extra large radius — ideal for modals or containers with strong curves.
  static double get extraLarge => _getRadious('extraLarge');

  static double _getRadious(String key) {
    double spacing = AtomicDesignConfig.instance.config.radius[key]!;

    return spacing;
  }
}

// abstract class AppRadius {
//   /// A small radius value — typically used for subtle rounding.
//   static const double small = 8.0;

//   /// A medium radius value — commonly used for cards or buttons.
//   static const double medium = 12.0;

//   /// A large radius value — used for prominent rounded elements.
//   static const double large = 16.0;

//   /// An extra large radius — ideal for modals or containers with strong curves.
//   static const double extraLarge = 24.0;
// }
