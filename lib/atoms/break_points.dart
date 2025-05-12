import 'package:fake_store_design/atoms/app_spacing.dart';

/// Defines standard breakpoints for responsive layouts based on device diagonal size.
///
/// These values are used to determine how the UI should adapt on different screen sizes.
abstract class BreakPoints {
  /// Extra small devices.
  static const xsmall = 350;

  /// Small devices.
  static const small = 550;

  /// Extra small-medium devices.
  static const xsmedium = 680;

  /// Medium devices.
  static const medium = 900;

  /// Extra small-Large devices.
  static const xslarge = 1300;

  /// Large devices.
  static const large = 1500;
}

/// Provides responsive design calculations based on the device's height and width.
///
/// Calculates grid layout properties such as column count, spacing, image container sizes,
/// and padding values based on the screen's diagonal length.
class ResponsiveDesign {
  /// Creates a [ResponsiveDesign] instance with the given screen [height] and [width].
  ///
  /// Automatically computes the responsive properties on initialization.
  ResponsiveDesign({required this.width}) {
    _calculateGridProperties();
  }

  /// The screen width.
  final double width;

  /// The spacing between the main axis elements.
  late final double mainAxisSpacing;

  /// The spacing between the cross axis elements.
  late final double crossAxisSpacing;

  /// The number of columns to display in a grid layout.
  late final int columnAmount;

  /// The aspect ratio of each grid item.
  late final double childAspectRatio;

  /// The width of text input fields.
  late final double appInputTextWidth;

  /// The width of the image container on the home page.
  late final double imageHomeContainerWidth;

  /// The height of the image container on the home page.
  late final double imageHomeContainerheight;

  /// The width of the image container on the product info page.
  late final double imageinfoContainerWidth;

  /// The height of the image container on the product info page.
  late final double imageinfoContainerheight;

  /// The width of the image container inside the cart.
  late final double imageCartContainerWidth;

  /// The height of the image container inside the cart.
  late final double imageCartContainerheight;

  /// The horizontal padding inside the cart views.
  late final double cartHorizontalPadding;

  /// The horizontal padding for product and user detail screens.
  late final double productAndUserHorizontalPadding;

  /// The size of icons throughout the UI.
  late final double iconZise;

  late final bool descriptionCartContainer;

  /// Calculates grid and layout properties based on the screen's diagonal size.
  ///
  /// Matches the device's diagonal against predefined [BreakPoints] and sets
  /// the layout parameters accordingly to ensure a consistent user experience
  /// across different device sizes.
  void _calculateGridProperties() {
    double diagonal = width;

    if (diagonal >= BreakPoints.xsmall && diagonal <= BreakPoints.small) {
      descriptionCartContainer = false;
      columnAmount = 2;
      childAspectRatio = 0.47;
      mainAxisSpacing = 4;
      crossAxisSpacing = 4;
      imageHomeContainerWidth = 110;
      imageHomeContainerheight = 140;
      imageinfoContainerWidth = 250;
      imageinfoContainerheight = 300;
      imageCartContainerWidth = 70;
      imageCartContainerheight = 100;
      appInputTextWidth = width - 40;
      cartHorizontalPadding = AppSpacing.small;
      iconZise = 25;
      productAndUserHorizontalPadding = AppSpacing.medium;
    } else if (diagonal > BreakPoints.small &&
        diagonal <= BreakPoints.xsmedium) {
      descriptionCartContainer = false;
      columnAmount = 3;
      childAspectRatio = 0.5;
      mainAxisSpacing = 4;
      crossAxisSpacing = 4;
      imageHomeContainerWidth = 110;
      imageHomeContainerheight = 140;
      imageinfoContainerWidth = 250;
      imageinfoContainerheight = 300;
      imageCartContainerWidth = 70;
      imageCartContainerheight = 100;
      appInputTextWidth = width - 40;
      cartHorizontalPadding = AppSpacing.medium;
      iconZise = 25;
      productAndUserHorizontalPadding = AppSpacing.medium;
    } else if (diagonal > BreakPoints.xsmedium &&
        diagonal <= BreakPoints.medium) {
      descriptionCartContainer = false;
      columnAmount = 3;
      childAspectRatio = 0.55;
      mainAxisSpacing = 8;
      crossAxisSpacing = 8;
      imageHomeContainerWidth = 130;
      imageHomeContainerheight = 150;
      imageinfoContainerWidth = 300;
      imageinfoContainerheight = 350;
      imageCartContainerWidth = 120;
      imageCartContainerheight = 150;
      appInputTextWidth = 600;
      cartHorizontalPadding = AppSpacing.medium;
      productAndUserHorizontalPadding = AppSpacing.mediumLarge;
      iconZise = 28;
    } else if (diagonal > BreakPoints.medium &&
        diagonal <= BreakPoints.xslarge) {
      descriptionCartContainer = true;
      columnAmount = 4;
      childAspectRatio = 0.5;
      mainAxisSpacing = 12;
      crossAxisSpacing = 12;
      imageHomeContainerWidth = 180;
      imageHomeContainerheight = 210;
      imageinfoContainerWidth = 350;
      imageinfoContainerheight = 400;
      imageCartContainerWidth = 160;
      imageCartContainerheight = 190;
      appInputTextWidth = 600;
      cartHorizontalPadding = AppSpacing.medium;
      productAndUserHorizontalPadding = AppSpacing.mediumLarge;
      iconZise = 32;
    } else if (diagonal <= BreakPoints.large &&
        diagonal > BreakPoints.xslarge) {
      descriptionCartContainer = true;
      columnAmount = 5;
      childAspectRatio = 0.5;
      mainAxisSpacing = 16;
      crossAxisSpacing = 16;
      imageHomeContainerWidth = 210;
      imageHomeContainerheight = 230;
      imageinfoContainerWidth = 450;
      imageinfoContainerheight = 500;
      imageCartContainerWidth = 200;
      imageCartContainerheight = 250;
      appInputTextWidth = 600;
      cartHorizontalPadding = AppSpacing.medium;
      productAndUserHorizontalPadding = AppSpacing.extraLarge;
      iconZise = 35;
    } else if (diagonal > BreakPoints.large) {
      descriptionCartContainer = true;
      columnAmount = 6;
      childAspectRatio = 0.5;
      mainAxisSpacing = 16;
      crossAxisSpacing = 16;
      imageHomeContainerWidth = 210;
      imageHomeContainerheight = 230;
      imageinfoContainerWidth = 450;
      imageinfoContainerheight = 500;
      imageCartContainerWidth = 200;
      imageCartContainerheight = 250;
      appInputTextWidth = 600;
      cartHorizontalPadding = AppSpacing.medium;
      productAndUserHorizontalPadding = AppSpacing.extraLarge;
      iconZise = 35;
    } else {
      descriptionCartContainer = false;
      columnAmount = 1;
      childAspectRatio = 0.5;
      mainAxisSpacing = 4;
      crossAxisSpacing = 4;
      imageHomeContainerWidth = 170;
      imageHomeContainerheight = 190;
      imageinfoContainerWidth = 250;
      imageinfoContainerheight = 300;
      imageCartContainerWidth = 70;
      imageCartContainerheight = 100;
      appInputTextWidth = width - 40;
      cartHorizontalPadding = AppSpacing.small;
      productAndUserHorizontalPadding = AppSpacing.medium;
      iconZise = 25;
    }
  }
}
