import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// A stateless widget for displaying an image from the network.
///
/// This widget allows optional customization of image width and height.
class AppNetworkImage extends StatelessWidget {
  /// The URL of the image to load.
  ///
  /// Must be a valid network image URL.
  final String url;

  /// Optional width of the image.
  ///
  /// If null, the image will size itself to its natural width.
  final double? widthImage;

  /// Optional height of the image.
  ///
  /// If null, the image will size itself to its natural height.
  final double? heightImage;

  /// Creates an [AppNetworkImage] widget.
  ///
  /// The [url] parameter must not be null.
  const AppNetworkImage({
    super.key,
    required this.url,
    this.widthImage,
    this.heightImage,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: widthImage,
      height: heightImage,
    );
  }
}
