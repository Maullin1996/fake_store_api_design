import 'package:flutter/material.dart';
import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/design_system.dart';

class ProductComplements extends StatefulWidget {
  const ProductComplements({super.key});

  @override
  State<ProductComplements> createState() => _ProductComplementsState();
}

class _ProductComplementsState extends State<ProductComplements> {
  String selectedCategory = 'All';
  bool isFavorite = false;
  void _handleCategorySelection(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void _handleIsFvaorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Product Complements',
        colorType: ColorType.primary,
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('List of categories', style: textTheme.displayMedium),
          ListCategory(
            selectedCategory: selectedCategory,
            onCategorySelected: _handleCategorySelection,
          ),
          SizedBox(height: AppSpacing.medium),
          Text('Favorite Product', style: textTheme.displayMedium),
          Container(
            color: AppColors.onPrimary,
            child: IsFavorite(
              productName: 'productName',
              textStyle: textTheme.displayMedium!,
              isFavorite: isFavorite,
              onPressedFavorite: _handleIsFvaorite,
            ),
          ),
        ],
      ),
    );
  }
}
