import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
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
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Product information',
          style: textTheme.displayMedium?.copyWith(
            color: AppColors.onPrimary,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.onPrimary,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.onPrimary),
        ),
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
