import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../../atoms/tokens.dart';

/// A widget that displays a product name and an icon button to mark it as favorite.
///
/// This widget shows a product name in a `Text` widget and an icon button that allows
/// the user to mark the product as a favorite. The icon button changes its icon depending
/// on whether the product is marked as a favorite or not.
///
/// The product name is truncated to fit within two lines if necessary, with ellipsis added for overflow.
class IsFavorite extends StatelessWidget {
  const IsFavorite({
    super.key,
    required this.productName, // The name of the product to display.
    required this.textStyle, // The text style to apply to the product name.
    required this.isFavorite, // A boolean that determines if the product is a favorite.
    required this.onPressedFavorite,
    this.productNameSemantics,
    this.productSortSemantics,
    this.iconSortSemantics,
    this.iconSemantics, // The callback to handle the favorite button press.
  });

  final String productName; // The name of the product.
  final TextStyle textStyle; // The style applied to the product name text.
  final bool isFavorite; // Whether the product is a favorite or not.
  final Function()?
  onPressedFavorite; // The callback function triggered when the favorite button is pressed.
  final String? productNameSemantics;
  final double? productSortSemantics;
  final double? iconSortSemantics;
  final String? iconSemantics;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // The product name is displayed and will be truncated if it overflows.
        Expanded(
          child: Semantics(
            label: productNameSemantics,
            sortKey: OrdinalSortKey(productSortSemantics ?? double.maxFinite),
            readOnly: true,
            child: Text(
              productName,
              style: textStyle, // Apply the provided text style.
              maxLines: 2, // Limit the text to two lines.
              overflow:
                  TextOverflow.ellipsis, // Add ellipsis if the text overflows.
            ),
          ),
        ),

        // Icon button to mark the product as a favorite or not.
        // The icon changes depending on the `isFavorite` value.
        Semantics(
          sortKey: OrdinalSortKey(iconSortSemantics ?? double.maxFinite),
          child: AppButtons(
            semanticsText: iconSemantics,
            type: ButtonType.secondaryIconButton,
            icon:
                isFavorite
                    ? AppIcons.favorite
                    : AppIcons
                        .unLike, // Switch between favorite and un-like icons.
            onPressed:
                onPressedFavorite, // Call the onPressedFavorite callback when the button is pressed.
          ),
        ),
      ],
    );
  }
}
