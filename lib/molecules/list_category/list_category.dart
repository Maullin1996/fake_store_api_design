import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

class ListCategory extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;
  const ListCategory({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      "electronics",
      "jewelery",
      "men's clothing",
      "women's clothing",
    ];
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 60,
      color: AppColors.onPrimary,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          return AppButtons(
            title: category,
            type:
                selectedCategory == category
                    ? ButtonType.secondaryTextButton
                    : ButtonType.primaryTextButton,
            onPressed: () {
              onCategorySelected(category);
            },
          );
        },
      ),
    );
  }
}
