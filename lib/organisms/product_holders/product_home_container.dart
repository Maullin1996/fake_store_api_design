import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';
import '../../molecules/molecules.dart';

/// A widget that represents a product card displayed on the home screen.
///
/// This widget displays a product's image, name, category, price, and buttons for
/// buying the product, viewing more information, and adding it to favorites.
class ProducthomeContainer extends StatelessWidget {
  /// The URL of the product image.
  final String url;

  /// The name of the product.
  final String productName;

  /// The category to which the product belongs.
  final String productCategory;

  /// The price of the product.
  final double productPrice;

  /// The callback function for the buy button.
  final Function()? onPressedbuy;

  /// The callback function for the information button.
  final Function()? onPressedinfo;

  /// The callback function for the favorite button.
  final Function()? onPressedFavorite;

  /// Whether the product is marked as a favorite.
  final bool isFavorite;

  /// Whether the product is in promotion.
  final bool isPromotion;

  /// Discount value
  final double discount;

  /// Creates an instance of [ProducthomeContainer].
  ///
  /// The [url], [productName], [productCategory], and [productPrice] are required,
  /// while the [onPressedbuy], [onPressedinfo], and [onPressedFavorite] are optional
  /// to handle the respective button actions. The [isFavorite] flag indicates whether
  /// the product is marked as a favorite.
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
  });

  @override
  Widget build(BuildContext context) {
    // Obtain the text theme from the current context to apply consistent text styling
    final textTheme = Theme.of(context).textTheme;
    final double width = MediaQuery.sizeOf(context).width;
    final ResponsiveDesign responsiveDesign = ResponsiveDesign(width: width);

    // The main container for displaying the product details
    return IntrinsicHeight(
      child: IntrinsicWidth(
        child: GestureDetector(
          onTap: onPressedinfo,
          child: Container(
            padding: EdgeInsets.only(
              top: AppSpacing.small,
              left: AppSpacing.small, // Padding on the left side
              right: AppSpacing.small, // Padding on the right side
              bottom: AppSpacing.small, // Padding at the bottom
            ),
            decoration: BoxDecoration(
              color:
                  AppColors
                      .onPrimary, // Background color for the product container
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 5), // Shadow offset
                  color: Colors.black.withValues(alpha: 0.2), // Shadow color
                  blurRadius: 5, // Shadow blur effect
                  spreadRadius: 3, // Spread radius for the shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align items to the start (top)
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align items to the start (left)
              mainAxisSize:
                  MainAxisSize.min, // Let the column take minimum space
              children: [
                SizedBox(
                  height: AppSpacing.small,
                ), // Small spacing above the image
                // Center the product image
                Hero(
                  tag: url,
                  child: Center(
                    child: AppNetworkImage(
                      url: url, // URL of the product image
                      widthImage:
                          responsiveDesign
                              .imageHomeContainerWidth, // Set the image width
                      heightImage:
                          responsiveDesign
                              .imageHomeContainerheight, // Set the image height
                    ),
                  ),
                ),
                // Favorite icon section
                Spacer(), // Flexible space between the image and text below
                IsFavorite(
                  productName: productName,
                  textStyle: textTheme.displaySmall!.copyWith(
                    fontSize:
                        AppTypography
                            .h4, // Adjust font size for the product name
                  ),
                  isFavorite: isFavorite, // Whether the product is a favorite
                  onPressedFavorite:
                      onPressedFavorite, // Callback for favorite button
                ),

                // Product category text
                Text(productCategory, style: textTheme.bodyMedium),

                isPromotion
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product promotion price text with custom font size
                        Text(
                          '\$ ${productPrice.toStringAsFixed(2)}', // Display price with a dollar sign
                          style: textTheme.labelLarge?.copyWith(
                            color: AppColors.disabledButton,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.disabledButton,
                            decorationThickness: 2.0,
                          ),
                        ),
                        // Product promotion price text with custom font size
                        Text(
                          '\$ ${(productPrice - productPrice * discount).toStringAsFixed(2)}', // Display price with a dollar sign
                          style: textTheme.labelLarge,
                        ),
                      ],
                    )
                    : Text(
                      '\$ ${productPrice.toStringAsFixed(2)}', // Display price with a dollar sign
                      style: textTheme.labelLarge,
                    ),

                Spacer(), // Flexible space between the image and text below
                // Action buttons: Buy and Info
                Center(
                  child: AppButtons(
                    type: ButtonType.secondaryTextButton,
                    title: 'Add to Cart',
                    fontSizeTextButton: AppTypography.h3,
                    onPressed: onPressedbuy, // Callback for buy button
                  ),
                ),

                // Action buttons: Buy and Info
              ],
            ),
          ),
        ),
      ),
    );
  }
}
