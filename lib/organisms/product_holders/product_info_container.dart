import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';
import '../../molecules/is_favorite/is_favorite.dart';

class ProductInfoContainer extends StatelessWidget {
  final String url;
  final String productName;
  final String description;
  final String productPrice;
  final Function()? onPressedbuy;
  final bool isFavorite;
  final Function()? onPressedFavorite;

  const ProductInfoContainer({
    super.key,
    required this.url,
    required this.productName,
    required this.description,
    required this.productPrice,
    this.onPressedbuy,
    this.isFavorite = false,
    this.onPressedFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.small,
        horizontal: AppSpacing.medium,
      ),
      width: MediaQuery.sizeOf(context).width,
      color: AppColors.onPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: AppNetworkImage(url: url, widthImage: 250, heightImage: 300),
          ),
          SizedBox(height: AppSpacing.medium),
          IsFavorite(
            productName: productName,
            textStyle: textTheme.displayMedium!,
            isFavorite: isFavorite,
            onPressedFavorite: onPressedFavorite,
          ),
          SizedBox(height: AppSpacing.medium),
          Text(description, style: textTheme.bodyMedium),
          SizedBox(height: AppSpacing.medium),
          Text('\$ $productPrice', style: textTheme.headlineMedium),
          SizedBox(height: AppSpacing.small),
          Center(
            child: AppButtons(
              title: 'Add to the cart',
              type: ButtonType.secondaryFillButton,
              onPressed: onPressedbuy,
            ),
          ),
        ],
      ),
    );
  }
}
