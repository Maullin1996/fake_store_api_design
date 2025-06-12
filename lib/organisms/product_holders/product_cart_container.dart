import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A stateless widget that displays a product inside the shopping cart UI.
///
/// Shows the product image, name, quantity (amount), and pricing information,
/// including promotional pricing if applicable. Also includes buttons to increase
/// or decrease quantity, and optionally displays a product description depending
/// on the screen size.
class ProductCartContainer extends StatelessWidget {
  /// Image URL for the product.
  final String url;

  /// Local fallback image path if [url] fails to load.
  final String assetsImage;

  /// Name of the product.
  final String productName;

  /// Quantity or unit description of the product (e.g., "2 x 500ml").
  final String amount;

  /// Regular price of the product.
  final double productPrice;

  /// Detailed product description.
  final String description;

  /// Whether the product is under a promotional discount.
  final bool isPromotion;

  /// Discount percentage to apply if [isPromotion] is true (e.g., 0.2 for 20%).
  final double discount;

  /// Callback when the plus button is pressed.
  final Function()? onPressedplus;

  /// Callback when the minus button is pressed.
  final Function()? onPressedminus;

  /// Callback when the container is tapped for more info.
  final Function()? onPressedinfo;

  /// Creates a [ProductCartContainer].
  const ProductCartContainer({
    super.key,
    required this.url,
    required this.productName,
    required this.amount,
    required this.productPrice,
    required this.isPromotion,
    required this.discount,
    required this.description,
    this.onPressedplus,
    this.onPressedminus,
    this.onPressedinfo,
    required this.assetsImage,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final semantics = SemanticsConfig.instance.data.cartTemplateSemantics;
    final ResponsiveDesign responsiveDesign = ResponsiveDesign(
      width: MediaQuery.sizeOf(context).width,
    );

    return GestureDetector(
      key: Key('info_gesture'),
      onTap: onPressedinfo,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: responsiveDesign.cartHorizontalPadding,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: responsiveDesign.cartHorizontalPadding,
          vertical: responsiveDesign.cartHorizontalPadding,
        ),
        decoration: BoxDecoration(
          color: AppColors.onPrimary,
          borderRadius: BorderRadius.circular(AppRadius.small),
        ),
        child: Row(
          children: [
            // Product image (from network with local fallback).
            Semantics(
              sortKey: OrdinalSortKey(semantics[0].semanticOrdinal),
              readOnly: true,
              value: semantics[0].label,
              label: semantics[0].semantics,
              child: ExcludeSemantics(
                child: AppNetworkImage(
                  url: url,
                  assetsImage: assetsImage,
                  heightImage: responsiveDesign.imageCartContainerheight,
                  widthImage: responsiveDesign.imageCartContainerWidth,
                ),
              ),
            ),
            SizedBox(width: AppSpacing.small),
            // Product info: name, amount, and optional description.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    sortKey: OrdinalSortKey(semantics[1].semanticOrdinal),
                    label: semantics[1].label,
                    readOnly: true,
                    child: Text(
                      productName,
                      style: textTheme.displaySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: AppSpacing.small),
                  Semantics(
                    sortKey: OrdinalSortKey(semantics[2].semanticOrdinal),
                    value: semantics[2].label,
                    label: '${semantics[2].semantics} $amount',
                    readOnly: true,
                    liveRegion: true,
                    child: ExcludeSemantics(
                      child: Text(
                        amount,
                        style: textTheme.labelLarge?.copyWith(
                          fontSize: AppTypography.h3,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.small),
                  if (responsiveDesign.descriptionCartContainer)
                    Semantics(
                      label: semantics[3].label,
                      sortKey: OrdinalSortKey(semantics[3].semanticOrdinal),
                      readOnly: true,
                      child: Text(description, style: textTheme.bodyLarge),
                    ),
                ],
              ),
            ),
            // Price and quantity adjustment buttons.
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Semantics(
                  sortKey: OrdinalSortKey(semantics[4].semanticOrdinal),
                  readOnly: true,
                  child: PriceSection(
                    isPromotion: isPromotion,
                    productPrice: productPrice,
                    discount: discount,
                  ),
                ),
                Row(
                  children: [
                    Semantics(
                      sortKey: OrdinalSortKey(semantics[5].semanticOrdinal),
                      readOnly: true,
                      child: AppButtons(
                        semanticsText: semantics[5].label,
                        type: ButtonType.secondaryIconButton,
                        icon: AppIcons.plus,
                        onPressed: onPressedplus,
                      ),
                    ),
                    Semantics(
                      sortKey: OrdinalSortKey(semantics[6].semanticOrdinal),
                      readOnly: true,
                      child: AppButtons(
                        semanticsText: semantics[6].label,
                        type: ButtonType.secondaryIconButton,
                        icon: AppIcons.minus,
                        onPressed: onPressedminus,
                      ),
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
