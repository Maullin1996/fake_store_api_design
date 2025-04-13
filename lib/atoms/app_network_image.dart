import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  /// The URL of the network image.
  final String url;

  /// The desired width of the image.
  final double? widthImage;

  /// The desired height of the image.
  final double? heightImage;

  const AppNetworkImage({
    super.key,
    required this.url,
    this.widthImage,
    this.heightImage,
  });

  @override
  Widget build(BuildContext context) {
    Widget designImage = Image.network(
      url,
      width: widthImage,
      height: heightImage,
    );
    return designImage;
  }
}
