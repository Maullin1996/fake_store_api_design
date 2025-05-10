import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';
import '../../molecules/is_favorite/is_favorite.dart';

/// A widget that represents a product detail view container.
///
/// This widget displays detailed information about a product, including its image,
/// name, description, price, and action buttons for adding the product to the cart
/// and managing the product's favorite status.
class ProductInfoContainer extends StatelessWidget {
  /// The URL of the product image.
  final String url;

  /// The name of the product.
  final String productName;

  /// A detailed description of the product.
  final String description;

  /// The price of the product.
  final double productPrice;

  /// Whether the product is in promotion.
  final bool isPromotion;

  /// Discount value
  final double discount;

  /// The callback function for the "Add to cart" button.
  final Function()? onPressedbuy;

  /// Whether the product is marked as a favorite.
  final bool isFavorite;

  /// The callback function for the favorite button.
  final Function()? onPressedFavorite;

  /// Creates an instance of [ProductInfoContainer].
  ///
  /// The [url], [productName], [description], and [productPrice] are required to
  /// display the product's details. The [onPressedbuy] is optional and is used for
  /// the "Add to cart" button. The [isFavorite] indicates if the product is marked
  /// as a favorite, and [onPressedFavorite] handles the favorite action.
  const ProductInfoContainer({
    super.key,
    required this.url,
    required this.productName,
    required this.description,
    required this.productPrice,
    required this.isPromotion,
    required this.discount,
    this.onPressedbuy,
    this.isFavorite = false,
    this.onPressedFavorite,
  });

  @override
  Widget build(BuildContext context) {
    // Obtain the text theme from the current context to apply consistent text styling
    final textTheme = Theme.of(context).textTheme;
    final ResponsiveDesign responsiveDesign = ResponsiveDesign(
      width: MediaQuery.sizeOf(context).width,
    );
    // The container holding the product details
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.small, // Vertical padding around the content
        horizontal:
            responsiveDesign
                .productAndUserHorizontalPadding, // Horizontal padding around the content
      ),
      width:
          MediaQuery.sizeOf(
            context,
          ).width, // Set the width to the screen's width
      color: AppColors.onPrimary, // Background color for the product container
      child: ListView(
        children: [
          // Center the product image with specified width and height
          Hero(
            tag: url,
            child: Center(
              child: AppNetworkImage(
                url: url, // Product image URL
                widthImage:
                    responsiveDesign
                        .imageinfoContainerWidth, // Width of the image
                heightImage:
                    responsiveDesign
                        .imageinfoContainerheight, // Height of the image
              ),
            ),
          ),
          SizedBox(
            height: AppSpacing.medium,
          ), // Space between the image and the next section
          // Display the favorite icon and product name with a custom text style
          IsFavorite(
            productName: productName,
            textStyle:
                textTheme.displayMedium!, // Use the display medium text style
            isFavorite: isFavorite, // Whether the product is a favorite
            onPressedFavorite:
                onPressedFavorite, // Callback for the favorite button
          ),
          SizedBox(
            height: AppSpacing.medium,
          ), // Space between the favorite section and the description
          // Display the product description
          Text(description, style: textTheme.bodyMedium),
          SizedBox(
            height: AppSpacing.medium,
          ), // Space between description and price

          isPromotion
              ? // Display the product price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product promotion price text with custom font size
                  Text(
                    '\$ ${productPrice.toStringAsFixed(2)}', // Display price with a dollar sign
                    style: textTheme.labelLarge?.copyWith(
                      fontSize: AppTypography.h2,
                      color: AppColors.disabledButton,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.disabledButton,
                      decorationThickness: 2.0,
                    ),
                  ),
                  // Product promotion price text with custom font size
                  Text(
                    '\$ ${(productPrice - productPrice * discount).toStringAsFixed(2)}', // Display price with a dollar sign
                    style: textTheme.labelLarge?.copyWith(
                      fontSize: AppTypography.h2,
                    ),
                  ),
                ],
              )
              : // Display the product price
              Text(
                '\$ ${productPrice.toStringAsFixed(2)}', // Display price with a dollar sign
                style: textTheme.labelLarge?.copyWith(
                  fontSize: AppTypography.h2,
                ),
              ),

          SizedBox(
            height: AppSpacing.small,
          ), // Space between the price and the action button
          // Centered "Add to cart" button
          Center(
            child: AppButtons(
              title: 'Add to the cart', // Button text
              type:
                  ButtonType
                      .secondaryTextButton, // Button type (secondary with fill style)
              onPressed: onPressedbuy, // Callback for the button
              fontSizeTextButton: AppTypography.h2,
            ),
          ),
        ],
      ),
    );
  }
}
