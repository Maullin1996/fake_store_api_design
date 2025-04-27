import 'package:fake_store_design/atoms/break_points.dart';
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
  final String productPrice;

  /// The callback function for the buy button.
  final Function()? onPressedbuy;

  /// The callback function for the information button.
  final Function()? onPressedinfo;

  /// The callback function for the favorite button.
  final Function()? onPressedFavorite;

  /// Whether the product is marked as a favorite.
  final bool isFavorite;

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
    this.onPressedbuy,
    this.onPressedinfo,
    required this.isFavorite,
    this.onPressedFavorite,
  });

  @override
  Widget build(BuildContext context) {
    // Obtain the text theme from the current context to apply consistent text styling
    final textTheme = Theme.of(context).textTheme;
    final ResponsiveDesign responsiveDesign = ResponsiveDesign(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
    );

    // The main container for displaying the product details
    return IntrinsicHeight(
      child: IntrinsicWidth(
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
            mainAxisSize: MainAxisSize.min, // Let the column take minimum space
            children: [
              SizedBox(
                height: AppSpacing.small,
              ), // Small spacing above the image
              // Center the product image
              Center(
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
              // Favorite icon section
              Spacer(), // Flexible space between the image and text below
              IsFavorite(
                productName: productName,
                textStyle: textTheme.displaySmall!.copyWith(
                  fontSize:
                      AppTypography.h4, // Adjust font size for the product name
                ),
                isFavorite: isFavorite, // Whether the product is a favorite
                onPressedFavorite:
                    onPressedFavorite, // Callback for favorite button
              ),

              // Product category text
              Text(productCategory, style: textTheme.bodyMedium),

              // Product price text with custom font size
              Text(
                '\$ $productPrice', // Display price with a dollar sign
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: AppTypography.h3, // Adjust font size for price
                ),
              ),
              Spacer(), // Flexible space between the image and text below
              // Action buttons: Buy and Info
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Space buttons evenly
                children: [
                  // Buy button
                  AppButtons(
                    type: ButtonType.secondaryIconButton,
                    onPressed: onPressedbuy, // Callback for buy button
                    icon: AppIcons.cart, // Cart icon for buy button
                  ),

                  // Info button
                  AppButtons(
                    type: ButtonType.secondaryIconButton,
                    onPressed: onPressedinfo, // Callback for info button
                    icon: AppIcons.info, // Info icon for info button
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
