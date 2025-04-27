import 'dart:math';

import 'package:fake_store_design/atoms/app_spacings.dart';

abstract class BreakPoints {
  static const xsmall = 750;
  static const small = 940;
  static const xsmedium = 1100;
  static const medium = 1290;
  static const large = 1698;
}

class ResponsiveDesign {
  final double height;
  final double width;
  late final double mainAxisSpacing;
  late final double crossAxisSpacing;
  late final int columnAmount;
  late final double childAspectRatio;
  late final double appInputTextWidth;
  late final double imageHomeContainerWidth;
  late final double imageHomeContainerheight;
  late final double imageinfoContainerWidth;
  late final double imageinfoContainerheight;
  late final double imageCartContainerWidth;
  late final double imageCartContainerheight;
  late final double cartHorizontalPadding;
  late final double productAndUserHorizontalPadding;
  late final double iconZise;

  ResponsiveDesign({required this.height, required this.width}) {
    _calculateGridProperties();
  }

  void _calculateGridProperties() {
    double diagonal = sqrt(height * height + width * width);

    if (diagonal >= BreakPoints.xsmall && diagonal <= BreakPoints.small) {
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
      appInputTextWidth = width - 60;
      cartHorizontalPadding = AppSpacing.xSmall;
      iconZise = 25;
      productAndUserHorizontalPadding = AppSpacing.medium;
    } else if (diagonal > BreakPoints.small &&
        diagonal <= BreakPoints.xsmedium) {
      columnAmount = 2;
      childAspectRatio = 0.5;
      mainAxisSpacing = 4;
      crossAxisSpacing = 4;
      imageHomeContainerWidth = 110;
      imageHomeContainerheight = 140;
      imageinfoContainerWidth = 250;
      imageinfoContainerheight = 300;
      imageCartContainerWidth = 70;
      imageCartContainerheight = 100;
      appInputTextWidth = width - 60;
      cartHorizontalPadding = AppSpacing.xSmall;
      iconZise = 25;
      productAndUserHorizontalPadding = AppSpacing.medium;
    } else if (diagonal > BreakPoints.xsmedium &&
        diagonal <= BreakPoints.medium) {
      columnAmount = 3;
      childAspectRatio = 0.55;
      mainAxisSpacing = 8;
      crossAxisSpacing = 8;
      imageHomeContainerWidth = 150;
      imageHomeContainerheight = 180;
      imageinfoContainerWidth = 300;
      imageinfoContainerheight = 350;
      imageCartContainerWidth = 120;
      imageCartContainerheight = 150;
      appInputTextWidth = 600;
      cartHorizontalPadding = AppSpacing.small;
      productAndUserHorizontalPadding = AppSpacing.mediumLarge;
      iconZise = 28;
    } else if (diagonal > BreakPoints.medium && diagonal <= BreakPoints.large) {
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
    } else if (diagonal > BreakPoints.large) {
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
      productAndUserHorizontalPadding = AppSpacing.large;
      iconZise = 35;
    } else {
      columnAmount = 2;
      childAspectRatio = 0.5;
      mainAxisSpacing = 4;
      crossAxisSpacing = 4;
      imageHomeContainerWidth = 110;
      imageHomeContainerheight = 140;
      imageinfoContainerWidth = 250;
      imageinfoContainerheight = 300;
      imageCartContainerWidth = 70;
      imageCartContainerheight = 100;
      appInputTextWidth = width - 60;
      cartHorizontalPadding = AppSpacing.small;
      productAndUserHorizontalPadding = AppSpacing.medium;
      iconZise = 25;
    }
  }
}
