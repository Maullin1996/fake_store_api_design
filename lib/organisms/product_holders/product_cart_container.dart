import 'package:fake_store_design/config/semantics_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../../design_system.dart';

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
              sortKey: OrdinalSortKey(
                PreJson.cartTemplateSemantics[0].semanticOrdinal,
              ),
              readOnly: true,
              value: PreJson.cartTemplateSemantics[0].label,
              label: PreJson.cartTemplateSemantics[0].semantics,
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
                    sortKey: OrdinalSortKey(
                      PreJson.cartTemplateSemantics[1].semanticOrdinal,
                    ),
                    label: PreJson.cartTemplateSemantics[1].label,
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
                    sortKey: OrdinalSortKey(
                      PreJson.cartTemplateSemantics[2].semanticOrdinal,
                    ),
                    value: PreJson.cartTemplateSemantics[2].label,
                    label:
                        '${PreJson.cartTemplateSemantics[2].semantics} $amount',
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
                      label: PreJson.cartTemplateSemantics[3].label,
                      sortKey: OrdinalSortKey(
                        PreJson.cartTemplateSemantics[3].semanticOrdinal,
                      ),
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
                  sortKey: OrdinalSortKey(
                    PreJson.cartTemplateSemantics[4].semanticOrdinal,
                  ),
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
                      sortKey: OrdinalSortKey(
                        PreJson.cartTemplateSemantics[5].semanticOrdinal,
                      ),
                      readOnly: true,
                      child: AppButtons(
                        semanticsText: PreJson.cartTemplateSemantics[5].label,
                        type: ButtonType.secondaryIconButton,
                        icon: AppIcons.plus,
                        onPressed: onPressedplus,
                      ),
                    ),
                    Semantics(
                      sortKey: OrdinalSortKey(
                        PreJson.cartTemplateSemantics[6].semanticOrdinal,
                      ),
                      readOnly: true,
                      child: AppButtons(
                        semanticsText: PreJson.cartTemplateSemantics[6].label,
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
