import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

/// A horizontal list of category buttons that allows the user to select a category.
///
/// This widget displays a list of predefined categories as horizontally scrollable buttons.
/// The selected category button is styled differently to indicate the current selection.
/// When a category is pressed, the [onCategorySelected] callback is triggered to notify
/// the parent widget about the new selected category.
class ListCategory extends StatelessWidget {
  final String selectedCategory; // The category currently selected by the user.
  final List<String>
  categories; // A list of the categories of the products to sell.
  final ValueChanged<String>
  onCategorySelected; // Callback triggered when a category is selected.

  const ListCategory({
    super.key,
    required this.selectedCategory, // The selected category string.
    required this.onCategorySelected,
    required this.categories, // Callback function to notify category selection.
  });

  @override
  Widget build(BuildContext context) {
    // A list of predefined categories to display as buttons.

    return Container(
      width:
          MediaQuery.sizeOf(
            context,
          ).width, // Set the width to match the screen width.
      height: 60, // Fixed height for the container.
      color: AppColors.onPrimary, // Background color of the container.

      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Make the list scroll horizontally.
        shrinkWrap: true, // Prevents the list from taking extra space.
        itemCount: categories.length, // Number of categories to display.
        itemBuilder: (BuildContext context, int index) {
          final category =
              categories[index]; // Get the category for the current index.

          // Return a button for each category.
          return AppButtons(
            key: Key("$index"),
            title: category, // Set the button's title as the category name.
            type:
                selectedCategory ==
                        category // Apply different button styles for selected category.
                    ? ButtonType
                        .secondaryTextButton // Style for selected category.
                    : ButtonType
                        .primaryTextButton, // Style for unselected categories.
            // When a category is pressed, notify the parent widget with the selected category.
            onPressed: () {
              onCategorySelected(category);
            },
          );
        },
      ),
    );
  }
}
