import 'package:fake_store_design/atoms/app_radius.dart';
import 'package:fake_store_design/atoms/app_colors.dart';
import 'package:fake_store_design/config/config.dart';
import 'package:flutter/material.dart';

/// A customizable search widget built on top of [SearchAnchor.bar], which provides
/// a search field and a list of suggestions filtered based on the user's input.
///
/// This widget is generic and accepts a list of items of any type [T]. It uses a
/// display function to convert each item into a string, and a callback to handle
/// item selection.
///
/// Typically used in scenarios where searchable content is needed in the UI, such as
/// product lookups or dropdown-style selectors.
class SearchAnchorWidget<T> extends StatelessWidget {
  /// Creates a [SearchAnchorWidget].
  ///
  /// The [items], [displayString], and [onItemSelected] parameters must not be null.
  /// The [hintText] defaults to `'Search Product'`.
  /// The [maxListHeight] defines the height of the suggestion list, with a default of `200`.
  const SearchAnchorWidget({
    super.key,
    required this.items,
    required this.displayString,
    required this.onItemSelected,
    //this.hintText = 'Search Product',
    this.controller,
    this.maxListHeight = 200,
  });

  /// The list of items to search from.
  final List<T> items;

  /// A function to convert an item of type [T] into a [String] for display.
  final String Function(T item) displayString;

  /// Callback function triggered when an item is selected from the suggestions.
  final void Function(T selectedItem) onItemSelected;

  /// Placeholder text displayed in the search bar when it is empty.
  //final String hintText;

  /// Optional controller to manage search view state and input.
  final SearchController? controller;

  /// Maximum height of the list displaying suggestions.
  final double maxListHeight;

  @override
  Widget build(BuildContext context) {
    final searchController = controller ?? SearchController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor.bar(
        barElevation: WidgetStateProperty.all(0),
        barBackgroundColor: WidgetStateProperty.all<Color>(AppColors.onPrimary),
        viewBackgroundColor: AppColors.onPrimary,
        barShape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.medium),
          ),
        ),
        barSide: WidgetStateProperty.all(
          BorderSide(color: AppColors.primaryVariant, width: 1.5),
        ),
        searchController: searchController,
        viewLeading: BackButton(color: AppColors.secondary),
        viewHintText: Copys.searchAnchorWidget,
        barHintText: Copys.searchAnchorWidget,

        /// Builds the suggestion list based on the user's input.
        ///
        /// Filters the [items] using [displayString] and displays a list of
        /// matching entries. When a suggestion is tapped, it updates the
        /// search text, closes the search view, and invokes [onItemSelected].
        suggestionsBuilder: (context, controller) {
          final query = controller.text.toLowerCase();
          final filtered = items.where(
            (item) => displayString(item).toLowerCase().contains(query),
          );

          return filtered
              .map(
                (item) => ListTile(
                  title: Text(displayString(item)),
                  onTap: () {
                    searchController.text = displayString(item);
                    searchController.closeView(displayString(item));
                    searchController.text = "";
                    onItemSelected(item);
                  },
                ),
              )
              .toList();
        },
      ),
    );
  }
}
