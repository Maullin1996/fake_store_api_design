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
  final List<String> categories = [
    'All', // Display all categories.
    "electronics", // Category for electronics.
    "jewelery", // Category for jewelery.
    "men's clothing", // Category for men's clothing.
    "women's clothing", // Category for women's clothing.
  ];
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
            categories: categories,
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
          SizedBox(height: AppSpacing.medium),
          Text('Price section normal price', style: textTheme.displayMedium),
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(AppSpacing.small),
            color: AppColors.onPrimary,
            child: Center(
              child: PriceSection(isPromotion: false, productPrice: 1000),
            ),
          ),
          SizedBox(height: AppSpacing.medium),
          Text('Price section discount', style: textTheme.displayMedium),
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(AppSpacing.small),
            color: AppColors.onPrimary,
            child: Center(
              child: PriceSection(
                isPromotion: true,
                productPrice: 1000,
                discount: 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
