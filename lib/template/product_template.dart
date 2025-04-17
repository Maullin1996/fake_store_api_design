import 'package:flutter/material.dart';
import 'package:fake_store_design/molecules/molecules.dart';
import 'package:fake_store_design/organisms/organisms.dart';

class ProductTemplate extends StatelessWidget {
  const ProductTemplate({
    super.key,
    required this.isFavorite,
    this.cartonPressed,
    this.backonPressed,
    this.onPressedFavorite,
    this.onPressedbuy,
    required this.url,
    required this.description,
    required this.productName,
    required this.productPrice,
  });
  final bool isFavorite;
  final VoidCallback? cartonPressed;
  final VoidCallback? backonPressed;
  final VoidCallback? onPressedFavorite;
  final VoidCallback? onPressedbuy;
  final String url;
  final String description;
  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbars(
        appbarType: AppbarType.productAppbar,
        backonPressed: backonPressed,
        cartonPressed: cartonPressed,
      ),
      body: SingleChildScrollView(
        child: ProductInfoContainer(
          url: url,
          productName: productName,
          description: description,
          productPrice: productPrice,
          onPressedbuy: onPressedbuy,
          isFavorite: isFavorite,
          onPressedFavorite: onPressedFavorite,
        ),
      ),
    );
  }
}
