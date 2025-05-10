import 'package:flutter/material.dart';

import '../../design_system.dart';

/// A widget that represents a container for a product in the cart.
///
/// This widget displays a product's image, name, quantity, price, and buttons to
/// adjust the quantity (increase/decrease). It provides interactive buttons to
/// modify the quantity of the product.
class ProductCartContainer extends StatelessWidget {
  /// The URL of the product image.
  final String url;

  /// The name of the product.
  final String productName;

  /// The current amount (quantity) of the product in the cart.
  final String amount;

  /// The price of the product.
  final double productPrice;

  /// The description of the product.
  final String descrition;

  /// Whether the product is in promotion.
  final bool isPromotion;

  /// Discount value
  final double discount;

  /// The callback function to handle the increase action for the product quantity.
  final Function()? onPressedplus;

  /// The callback function to handle the decrease action for the product quantity.
  final Function()? onPressedminus;

  /// The callback function for the information button.
  final Function()? onPressedinfo;

  /// Creates an instance of [ProductCartContainer].
  ///
  /// The [url], [productName], [amount], and [productPrice] are required, while the
  /// [onPressedplus] and [onPressedminus] functions are optional to handle the
  /// increase and decrease button actions.
  const ProductCartContainer({
    super.key,
    required this.url,
    required this.productName,
    required this.amount,
    required this.productPrice,
    required this.isPromotion,
    required this.discount,
    required this.descrition,
    this.onPressedplus,
    this.onPressedminus,
    this.onPressedinfo,
  });

  @override
  Widget build(BuildContext context) {
    // Obtain the text theme from the current context to apply consistent text styling
    final textTheme = Theme.of(context).textTheme;
    final ResponsiveDesign responsiveDesign = ResponsiveDesign(
      width: MediaQuery.sizeOf(context).width,
    );

    // The main container for displaying the product information
    return GestureDetector(
      onTap: onPressedinfo,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: responsiveDesign.cartHorizontalPadding,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: responsiveDesign.cartHorizontalPadding,
          vertical: responsiveDesign.cartHorizontalPadding,
        ), // Padding around the entire container
        decoration: BoxDecoration(
          color: AppColors.onPrimary, // Background color for the container
          borderRadius: BorderRadius.circular(
            AppRadius.small,
          ), // Rounded corners
        ),
        child: Row(
          // Row to align the image, details, and price on the same line
          children: [
            // Display the product image using the AppNetworkImage widget
            AppNetworkImage(
              url: url,
              heightImage: responsiveDesign.imageCartContainerheight,
              widthImage: responsiveDesign.imageCartContainerWidth,
            ),

            SizedBox(
              width: AppSpacing.small,
            ), // Small spacing between the image and the text

            Expanded(
              // The product details section, takes remaining space
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the start (left)
                children: [
                  // Display the product name
                  Text(
                    productName,
                    style: textTheme.displaySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(
                    height: AppSpacing.small,
                  ), // Small spacing between the name and amount
                  // Display the amount (quantity) of the product
                  Text(
                    amount,
                    style: textTheme.labelLarge?.copyWith(
                      fontSize:
                          AppTypography.h3, // Custom font size for the amount
                    ),
                  ),
                  SizedBox(height: AppSpacing.small),
                  responsiveDesign.descriptionCartContainer
                      ? Text(descrition, style: textTheme.bodyLarge)
                      : SizedBox(),
                ],
              ),
            ),

            // Column to display the product price and action buttons (increase/decrease)
            Column(
              mainAxisAlignment:
                  MainAxisAlignment
                      .center, // Align items vertically in the center
              children: [
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

                // Row for the buttons to increase or decrease the quantity
                Row(
                  children: [
                    // Button to increase quantity
                    AppButtons(
                      type: ButtonType.secondaryIconButton,
                      icon: AppIcons.plus,
                      onPressed:
                          onPressedplus, // Calls the provided callback for increase
                    ),

                    // Button to decrease quantity
                    AppButtons(
                      type: ButtonType.secondaryIconButton,
                      icon: AppIcons.minus,
                      onPressed:
                          onPressedminus, // Calls the provided callback for decrease
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
