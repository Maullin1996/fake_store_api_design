import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

class ProductCartContainer extends StatelessWidget {
  final String url;
  final String productName;
  final String amount;
  final String productPrice;
  final Function()? onPressedplus;
  final Function()? onPressedminus;
  const ProductCartContainer({
    super.key,
    required this.url,
    required this.productName,
    required this.amount,
    required this.productPrice,
    this.onPressedplus,
    this.onPressedminus,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(AppSpacing.small),
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(AppRadius.small),
      ),
      child: Row(
        children: [
          AppNetworkImage(url: url, heightImage: 100, widthImage: 70),
          SizedBox(width: AppSpacing.small),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName, style: textTheme.displaySmall),
                SizedBox(height: AppSpacing.small),
                Text(
                  amount,
                  style: textTheme.labelLarge?.copyWith(
                    fontSize: AppTypography.h3,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\$ $productPrice', style: textTheme.headlineSmall),
              Row(
                children: [
                  AppButtons(
                    type: ButtonType.secondaryIconButton,
                    icon: AppIcons.plus,
                    onPressed: onPressedplus,
                  ),
                  AppButtons(
                    type: ButtonType.secondaryIconButton,
                    icon: AppIcons.minus,
                    onPressed: onPressedminus,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
