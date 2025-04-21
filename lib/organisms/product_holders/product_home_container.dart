import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';
import '../../molecules/molecules.dart';

class ProducthomeContainer extends StatelessWidget {
  final String url;
  final String productName;
  final String productCategory;
  final String productPrice;
  final Function()? onPressedbuy;
  final Function()? onPressedinfo;
  final Function()? onPressedFavorite;
  final bool isFavorite;
  const ProducthomeContainer({
    super.key,
    required this.url,
    required this.productName,
    required this.productCategory,
    required this.productPrice,
    this.onPressedbuy,
    this.onPressedinfo,
    required this.isFavorite,
    this.onPressedFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return IntrinsicHeight(
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.only(
            left: AppSpacing.small,
            right: AppSpacing.small,
            bottom: AppSpacing.small,
          ),
          decoration: BoxDecoration(
            color: AppColors.onPrimary,
            boxShadow: [
              BoxShadow(
                offset: Offset(5, 5),
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 5,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppSpacing.small),

              Center(
                child: AppNetworkImage(
                  url: url,
                  widthImage: 140,
                  heightImage: 180,
                ),
              ),
              Spacer(),
              IsFavorite(
                productName: productName,
                textStyle: textTheme.displaySmall!.copyWith(
                  fontSize: AppTypography.h4,
                ),
                isFavorite: isFavorite,
                onPressedFavorite: onPressedFavorite,
              ),
              Text(productCategory, style: textTheme.bodyMedium),
              Text(
                '\$ $productPrice',
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: AppTypography.h3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButtons(
                    type: ButtonType.secondaryIconButton,
                    onPressed: onPressedbuy,
                    icon: AppIcons.cart,
                  ),
                  AppButtons(
                    type: ButtonType.secondaryIconButton,
                    onPressed: onPressedinfo,
                    icon: AppIcons.info,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
