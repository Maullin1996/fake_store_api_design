import 'package:flutter/material.dart';

/// A stateless widget for displaying an image from the asset bundle.
///
/// This widget provides optional customization for image width and height.
class AppAssetsImage extends StatelessWidget {
  /// The path to the image asset.
  ///
  /// This must be a valid path defined in your `pubspec.yaml`.
  final String path;

  /// Optional width of the image.
  ///
  /// If null, the image will size itself to its natural width.
  final double? widthImage;

  /// Optional height of the image.
  ///
  /// If null, the image will size itself to its natural height.
  final double? heightImage;

  /// Creates an [AppAssetsImage] widget.
  ///
  /// The [path] parameter must not be null.
  const AppAssetsImage({
    super.key,
    required this.path,
    this.widthImage,
    this.heightImage,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(path, width: widthImage, height: heightImage);
  }
}
