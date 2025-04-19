import 'package:fake_store_design/design_system.dart';
//import 'package:fake_store_design/models/base_product.dart';

import 'package:flutter/material.dart';

class HomeTamplate extends StatelessWidget {
  final bool isLogIn;
  final List<dynamic> products;
  final String? errorMessage;
  final bool isLoading;
  final List<dynamic> myFavoriteList;
  final List<dynamic> myCartList;
  final String selectedCategory;
  final void Function(dynamic)? onPressedFavorite;
  final void Function(dynamic)? onPressedinfo;
  final void Function(dynamic)? onPressedbuy;
  final VoidCallback? logInonPressed;
  final VoidCallback? cartonPressed;
  final VoidCallback? useronPressed;
  final VoidCallback? logOutonPressed;
  final String? name;
  final String? lastName;
  final void Function(String) onCategorySelected;

  const HomeTamplate({
    super.key,
    required this.isLoading,
    required this.isLogIn,
    required this.products,
    required this.myFavoriteList,
    required this.myCartList,
    required this.selectedCategory,
    required this.onCategorySelected,
    this.errorMessage,
    this.onPressedFavorite,
    this.onPressedinfo,
    this.onPressedbuy,
    this.logInonPressed,
    this.cartonPressed,
    this.useronPressed,
    this.logOutonPressed,
    this.name,
    this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          !isLogIn
              ? CustomAppbars(
                appbarType: AppbarType.homeLogOutAppbar,
                useronPressed: useronPressed,
                name: name,
                lastName: lastName,
                cartonPressed: cartonPressed,
                logOutonPressed: logOutonPressed,
              )
              : CustomAppbars(
                appbarType: AppbarType.homeLogInAppbar,
                logInonPressed: logInonPressed,
                cartonPressed: cartonPressed,
              ),
      body: _buildBody(
        context: context,
        products: products,
        myFavoriteList: myFavoriteList,
        myCartList: myCartList,
        errorMessage: errorMessage,
        isLoading: isLoading,
      ),
    );
  }

  Widget _buildBody({
    required BuildContext context,
    String? errorMessage,
    required bool isLoading,
    required dynamic products,
    required List<dynamic> myFavoriteList,
    required List<dynamic> myCartList,
  }) {
    final textTheme = Theme.of(context).textTheme;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (errorMessage != null) {
      return Center(
        child: Text(
          'Error: $errorMessage',
          style: textTheme.bodyMedium?.copyWith(color: AppColors.error),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          ListCategory(
            selectedCategory: selectedCategory,
            onCategorySelected: onCategorySelected,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 0.47,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProducthomeContainer(
                url: product.image,
                productName: product.title,
                productCategory: product.category,
                productPrice: product.price.toString(),
                isFavorite: myFavoriteList.contains(product),
                onPressedFavorite: () => onPressedFavorite?.call(product),
                onPressedinfo: () => onPressedinfo?.call(product),
                onPressedbuy: () => onPressedbuy?.call(product),
              );
            },
          ),
          const SizedBox(height: AppSpacing.small),
        ],
      ),
    );
  }
}
