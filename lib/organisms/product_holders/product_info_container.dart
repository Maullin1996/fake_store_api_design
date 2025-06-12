import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../atoms/tokens.dart';

/// A widget that represents a product detail view container.
///
/// This widget displays detailed information about a product, including its image,
/// name, description, price, and action buttons for adding the product to the cart
/// and managing the product's favorite status.
class ProductInfoContainer extends StatelessWidget {
  /// The URL of the product image.
  final String url;

  /// unique identifier
  final int id;

  /// Must be a valid assets image URL.
  final String assetsImage;

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

  /// Text button to add to the cart
  //final String textButonProduct;

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
    required this.assetsImage,
    required this.id,
    //required this.textButonProduct,
  });

  @override
  Widget build(BuildContext context) {
    // Obtain the text theme from the current context to apply consistent text styling
    final textTheme = Theme.of(context).textTheme;
    final double width = MediaQuery.sizeOf(context).width;
    final semantics = SemanticsConfig.instance.data.productInformationScreen;
    final ResponsiveDesign responsiveDesign = ResponsiveDesign(width: width);
    // The container holding the product details

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.small, // Vertical padding around the content
        horizontal:
            responsiveDesign
                .productAndUserHorizontalPadding, // Horizontal padding around the content
      ),
      width: width, // Set the width to the screen's width
      color: AppColors.onPrimary, // Background color for the product container
      child: ListView(
        children: [
          // Center the product image with specified width and height
          Hero(
            tag: id,
            child: Center(
              child: Semantics(
                label: semantics[2].label,
                readOnly: true,
                sortKey: OrdinalSortKey(semantics[2].semanticOrdinal),
                child: ExcludeSemantics(
                  child: AppNetworkImage(
                    url: url, // Product image URL
                    assetsImage: assetsImage,
                    widthImage:
                        responsiveDesign
                            .imageinfoContainerWidth, // Width of the image
                    heightImage:
                        responsiveDesign
                            .imageinfoContainerheight, // Height of the image
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: AppSpacing.medium,
          ), // Space between the image and the next section
          // Display the favorite icon and product name with a custom text style
          IsFavorite(
            iconSemantics: semantics[1].label,
            iconSortSemantics: semantics[1].semanticOrdinal,
            productNameSemantics: semantics[0].label,
            productSortSemantics: semantics[0].semanticOrdinal,
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
          Semantics(
            readOnly: true,
            label: semantics[3].label,
            sortKey: OrdinalSortKey(semantics[3].semanticOrdinal),
            child: Text(description, style: textTheme.bodyMedium),
          ),
          SizedBox(
            height: AppSpacing.medium,
          ), // Space between description and price
          Semantics(
            readOnly: true,
            sortKey: OrdinalSortKey(semantics[4].semanticOrdinal),
            child: PriceSection(
              isPromotion: isPromotion,
              productPrice: productPrice,
              discount: discount,
            ),
          ),

          SizedBox(
            height: AppSpacing.small,
          ), // Space between the price and the action button
          // Centered "Add to cart" button
          Semantics(
            sortKey: OrdinalSortKey(semantics[5].semanticOrdinal),
            child: Center(
              child: AppButtons(
                semanticsText: semantics[5].label,
                key: Key("AddToTheCart"),
                title: Copys.productContainerText, // Button text
                type:
                    ButtonType
                        .secondaryTextButton, // Button type (secondary with fill style)
                onPressed: onPressedbuy, // Callback for the button
                fontSizeTextButton: AppTypography.h2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
