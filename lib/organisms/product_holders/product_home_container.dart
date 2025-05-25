import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';
import '../../molecules/molecules.dart';

/// A stateless widget that displays a product card for the home screen.
///
/// Shows product image, name, category, price (with optional discount),
/// and allows user interactions like viewing details, favoriting, or adding to cart.
class ProducthomeContainer extends StatelessWidget {
  /// URL of the product image.
  final String url;

  /// unique identifier
  final int id;

  /// Local asset fallback image.
  final String assetsImage;

  /// Product name displayed prominently.
  final String productName;

  /// Category of the product (e.g., "Beverages").
  final String productCategory;

  /// Regular price of the product.
  final double productPrice;

  /// Callback when the "Add to Cart" button is pressed.
  final Function()? onPressedbuy;

  /// Callback when the product container is tapped for more info.
  final Function()? onPressedinfo;

  /// Callback when the favorite icon is pressed.
  final Function()? onPressedFavorite;

  /// Whether the product is currently marked as favorite.
  final bool isFavorite;

  /// Whether the product has a promotional price.
  final bool isPromotion;

  /// Discount percentage applied if [isPromotion] is true.
  final double discount;

  /// Creates a [ProducthomeContainer].
  const ProducthomeContainer({
    super.key,
    required this.url,
    required this.productName,
    required this.productCategory,
    required this.productPrice,
    required this.isPromotion,
    required this.discount,
    this.onPressedbuy,
    this.onPressedinfo,
    required this.isFavorite,
    this.onPressedFavorite,
    required this.assetsImage,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final double width = MediaQuery.sizeOf(context).width;
    final ResponsiveDesign responsiveDesign = ResponsiveDesign(width: width);

    return IntrinsicHeight(
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.small),
          decoration: BoxDecoration(
            color: AppColors.onPrimary,
            boxShadow: [
              BoxShadow(
                offset: const Offset(5, 5),
                color: Colors.black.withAlpha(50),
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
              const SizedBox(height: AppSpacing.small),

              // Displays the product image inside a Hero widget for smooth transitions.
              Hero(
                tag: id,
                child: GestureDetector(
                  onTap: onPressedinfo,
                  child: Center(
                    child: AppNetworkImage(
                      url: url,
                      assetsImage: assetsImage,
                      widthImage: responsiveDesign.imageHomeContainerWidth,
                      heightImage: responsiveDesign.imageHomeContainerheight,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Product title with favorite icon toggle.
              IsFavorite(
                productName: productName,
                textStyle: textTheme.displaySmall!.copyWith(
                  fontSize: AppTypography.h4,
                ),
                isFavorite: isFavorite,
                onPressedFavorite: onPressedFavorite,
              ),

              // Product category label.
              Text(productCategory, style: textTheme.bodyMedium),

              // Price section with promotional logic.
              PriceSection(
                isPromotion: isPromotion,
                productPrice: productPrice,
                discount: discount,
              ),

              const Spacer(),

              // Add to cart button centered at the bottom.
              Center(
                child: AppButtons(
                  type: ButtonType.secondaryTextButton,
                  title: 'Add to Cart',
                  fontSizeTextButton: AppTypography.h3,
                  onPressed: onPressedbuy,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
