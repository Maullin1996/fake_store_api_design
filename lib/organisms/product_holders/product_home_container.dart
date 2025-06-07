import 'package:fake_store_design/config/copys.dart';
import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';
import '../../molecules/molecules.dart';

/// A widget that displays a product card used on the home screen grid.
///
/// Includes product image, name, category, pricing (with promotion support),
/// and user interactions such as favoriting, viewing details, and adding to cart.
///
/// This widget maintains its state even when it is scrolled out of view
/// using [AutomaticKeepAliveClientMixin].
class ProducthomeContainer extends StatefulWidget {
  /// URL of the product image to load from network.
  final String url;

  /// Unique identifier used for animations and tracking.
  final int id;

  /// Fallback asset image if network image fails.
  final String assetsImage;

  /// Display name of the product.
  final String productName;

  /// Category or type of the product.
  final String productCategory;

  /// Base price of the product before any discounts.
  final double productPrice;

  /// Text button to add to the cart
  //final String textButonProduct;

  /// Called when the "Add to Cart" button is tapped.
  final Function()? onPressedbuy;

  /// Called when the product image is tapped for more details.
  final Function()? onPressedinfo;

  /// Called when the favorite icon is tapped.
  final Function()? onPressedFavorite;

  /// Indicates whether the product is marked as a favorite.
  final bool isFavorite;

  /// Whether this product has a promotional discount.
  final bool isPromotion;

  /// Percentage discount applied if [isPromotion] is true.
  final double discount;

  /// Creates a [ProducthomeContainer] with required product display information.
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
    //required this.textButonProduct,
  });

  @override
  State<ProducthomeContainer> createState() => _ProducthomeContainerState();
}

/// State implementation for [ProducthomeContainer] that keeps itself alive
/// while offscreen in a scrollable list/grid.
class _ProducthomeContainerState extends State<ProducthomeContainer>
    with AutomaticKeepAliveClientMixin {
  /// Keeps the widget alive when it’s offscreen in a sliver list/grid.
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // Required call when using AutomaticKeepAliveClientMixin.
    super.build(context);

    final textTheme = Theme.of(context).textTheme;
    final double width = MediaQuery.sizeOf(context).width;
    final ResponsiveDesign responsiveDesign = ResponsiveDesign(width: width);

    return IntrinsicHeight(
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.all(AppSpacing.small),
          decoration: BoxDecoration(
            color: AppColors.onPrimary,
            boxShadow: [
              BoxShadow(
                offset: const Offset(5, 5),
                color: Colors.black.withAlpha(50),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppSpacing.small),

              // Displays the product image inside a Hero for page transitions.
              Hero(
                tag: widget.id,
                child: GestureDetector(
                  onTap: widget.onPressedinfo,
                  child: Center(
                    child: AppNetworkImage(
                      url: widget.url,
                      assetsImage: widget.assetsImage,
                      widthImage: responsiveDesign.imageHomeContainerWidth,
                      heightImage: responsiveDesign.imageHomeContainerheight,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Displays product name with a favorite toggle icon.
              IsFavorite(
                productName: widget.productName,
                textStyle: textTheme.displaySmall!.copyWith(
                  fontSize: AppTypography.h4,
                ),
                isFavorite: widget.isFavorite,
                onPressedFavorite: widget.onPressedFavorite,
              ),

              // Displays the product category.
              Text(widget.productCategory, style: textTheme.bodyMedium),

              // Displays the product price and promotional info if applicable.
              PriceSection(
                isPromotion: widget.isPromotion,
                productPrice: widget.productPrice,
                discount: widget.discount,
              ),

              const Spacer(),

              // Button to add the product to the shopping cart.
              Center(
                child: AppButtons(
                  type: ButtonType.secondaryTextButton,
                  title: Copys.productContainerText,
                  fontSizeTextButton: AppTypography.h3,
                  onPressed: widget.onPressedbuy,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
