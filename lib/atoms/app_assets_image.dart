import 'package:flutter/material.dart';

/// A widget that displays an image from the asset bundle.
class AppAssetsImage extends StatelessWidget {
  /// The path to the image asset.
  final String path;

  /// The desired width of the image.
  final double? widthImage;

  /// The desired width of the image.
  final double? heightImage;

  const AppAssetsImage({
    super.key,
    required this.path,
    this.widthImage,
    this.heightImage,
  });

  @override
  Widget build(BuildContext context) {
    Widget designImage = Image.asset(
      path,
      width: widthImage,
      height: heightImage,
    );
    return designImage;
  }
}
