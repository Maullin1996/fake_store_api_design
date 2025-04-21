import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

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
  final String productPrice;

  /// The callback function to handle the increase action for the product quantity.
  final Function()? onPressedplus;

  /// The callback function to handle the decrease action for the product quantity.
  final Function()? onPressedminus;

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
    this.onPressedplus,
    this.onPressedminus,
  });

  @override
  Widget build(BuildContext context) {
    // Obtain the text theme from the current context to apply consistent text styling
    final textTheme = Theme.of(context).textTheme;

    // The main container for displaying the product information
    return Container(
      padding: EdgeInsets.all(
        AppSpacing.small,
      ), // Padding around the entire container
      decoration: BoxDecoration(
        color: AppColors.onPrimary, // Background color for the container
        borderRadius: BorderRadius.circular(AppRadius.small), // Rounded corners
      ),
      child: Row(
        // Row to align the image, details, and price on the same line
        children: [
          // Display the product image using the AppNetworkImage widget
          AppNetworkImage(url: url, heightImage: 100, widthImage: 70),

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
                Text(productName, style: textTheme.displaySmall),

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
              ],
            ),
          ),

          // Column to display the product price and action buttons (increase/decrease)
          Column(
            mainAxisAlignment:
                MainAxisAlignment
                    .center, // Align items vertically in the center
            children: [
              // Display the product price
              Text('\$ $productPrice', style: textTheme.headlineSmall),

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
    );
  }
}
