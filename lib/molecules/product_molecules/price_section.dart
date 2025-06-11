import 'package:fake_store_design/atoms/app_colors.dart';
import 'package:fake_store_design/config/semantics_text.dart';
import 'package:flutter/material.dart';

/// A stateless widget that displays the price of a product.
///
/// If [isPromotion] is true, it shows both the original and discounted prices.
/// Otherwise, only the regular price is displayed.
class PriceSection extends StatelessWidget {
  /// Whether the product is on promotion.
  final bool isPromotion;

  /// The original price of the product.
  final double productPrice;

  /// The discount percentage to apply if [isPromotion] is true.
  /// Should be a value between 0.0 and 1.0 (e.g., 0.2 for 20%).
  final double? discount;

  /// Creates a [PriceSection] widget.
  ///
  /// All parameters are required and must not be null.
  const PriceSection({
    super.key,
    required this.isPromotion,
    required this.productPrice,
    this.discount = 1,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return isPromotion
        ? MergeSemantics(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Original price with strikethrough style to indicate a discount.
              Semantics(
                label: PreJson.productInformationScreen[3].semantics,
                child: Text(
                  '\$ ${productPrice.toStringAsFixed(2)}',
                  style: textTheme.labelLarge?.copyWith(
                    color: AppColors.disabledButton,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: AppColors.disabledButton,
                    decorationThickness: 2.0,
                  ),
                ),
              ),
              // Final price after applying the discount.
              Semantics(
                label: PreJson.productInformationScreen[3].label,
                child: Text(
                  '\$ ${(productPrice - productPrice * discount!).toStringAsFixed(2)}',
                  style: textTheme.labelLarge,
                ),
              ),
            ],
          ),
        )
        : Semantics(
          label: PreJson.productInformationScreen[3].label,
          child: Text(
            '\$ ${productPrice.toStringAsFixed(2)}',
            style: textTheme.labelLarge,
          ),
        );
  }
}
