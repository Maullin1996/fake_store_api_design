import 'dart:io';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:fake_store_design/molecules/company_info/company_info.dart';

/// A reusable template that represents the main home screen of the app.
///
/// Displays a list of product categories, a search bar, a product grid,
/// and company contact information. Handles user authentication states,
/// loading states, and error display gracefully.
class HomeTemplate extends StatelessWidget {
  /// The company's physical address shown at the bottom.
  final String address;

  /// Local fallback image asset path for products.
  final String assetsImage;

  /// The company's support email address.
  final String email;

  /// The company's WhatsApp contact.
  final String whatsapp;

  /// The company's Instagram handle.
  final String instagram;

  /// List of product categories to filter the product list.
  final List<String> categories;

  /// Indicates whether the user is logged in.
  final bool isLogIn;

  /// Complete list of available products.
  final List<dynamic> products;

  /// Message to display in case of an error fetching products.
  final String errorMessage;

  /// Indicates if the product list is currently loading.
  final bool isLoading;

  /// List of user's favorite products.
  final List<dynamic> myFavoriteList;

  /// List of products added to the user's cart.
  final List<dynamic> myCartList;

  /// Currently selected category filter.
  final String selectedCategory;

  /// Callback when the favorite icon is pressed.
  final void Function(dynamic)? onPressedFavorite;

  /// Callback when product info is tapped.
  final void Function(dynamic)? onPressedinfo;

  /// Callback when buy button is pressed.
  final void Function(dynamic)? onPressedbuy;

  /// Callback when login is requested.
  final VoidCallback? logInonPressed;

  /// Callback when the cart icon is tapped.
  final VoidCallback? cartonPressed;

  /// Callback when the user icon is tapped.
  final VoidCallback? useronPressed;

  /// Callback when logout is requested.
  final VoidCallback? logOutonPressed;

  /// First name of the logged-in user.
  final String? name;

  /// Last name of the logged-in user.
  final String? lastName;

  /// Callback to select a new product category.
  final void Function(String) onCategorySelected;

  /// Callback when a product is selected from search results.
  final void Function(String selectedItem) onItemSelected;

  /// Callback to refresh the product list.
  final Future<void> Function() refreshProducts;

  /// Creates the [HomeTemplate] screen.
  const HomeTemplate({
    super.key,
    required this.address,
    required this.email,
    required this.whatsapp,
    required this.instagram,
    required this.isLoading,
    required this.isLogIn,
    required this.products,
    required this.myFavoriteList,
    required this.myCartList,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.categories,
    required this.onItemSelected,
    required this.refreshProducts,
    required this.errorMessage,
    this.onPressedFavorite,
    this.onPressedinfo,
    this.onPressedbuy,
    this.logInonPressed,
    this.cartonPressed,
    this.useronPressed,
    this.logOutonPressed,
    this.name,
    this.lastName,
    required this.assetsImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          isLogIn
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
      backgroundColor: AppColors.onPrimary,
      body: RefreshIndicator(
        edgeOffset: AppSpacing.extraLarge,
        onRefresh: refreshProducts,
        color: AppColors.secondary,
        backgroundColor: AppColors.onPrimary,
        child: CustomScrollView(
          slivers: [
            // Header with search and categories
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SearchAnchorWidget<String>(
                    items:
                        products
                            .map((product) => product.title.toString())
                            .toList(),
                    displayString: (item) => item,
                    onItemSelected: onItemSelected,
                  ),
                  ListCategory(
                    categories: categories,
                    selectedCategory: selectedCategory,
                    onCategorySelected: onCategorySelected,
                  ),
                ],
              ),
            ),

            // Product grid or loading/error state
            _buildBody(
              assetsImage: assetsImage,
              context: context,
              products: products,
              myFavoriteList: myFavoriteList,
              errorMessage: errorMessage,
              isLoading: isLoading,
            ),

            // Company info footer
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height:
                        (products.isNotEmpty && errorMessage.isEmpty)
                            ? AppSpacing.small
                            : MediaQuery.sizeOf(context).height * 0.8,
                  ),
                  CompanyInfo(
                    key: Key("companiInfo"),
                    address: address,
                    email: email,
                    whatsapp: whatsapp,
                    instagram: instagram,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the product list section depending on the loading or error state.
  Widget _buildBody({
    required String assetsImage,
    required BuildContext context,
    required String errorMessage,
    required bool isLoading,
    required List<dynamic> products,
    required List<dynamic> myFavoriteList,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final double width = MediaQuery.sizeOf(context).width;
    final responsiveDesign = ResponsiveDesign(width: width);

    if (isLoading) {
      return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: 10,
          (context, index) => SkeletonLoadingContainer(width: width),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: responsiveDesign.columnAmount,
          mainAxisSpacing: responsiveDesign.mainAxisSpacing,
          crossAxisSpacing: responsiveDesign.crossAxisSpacing,
          childAspectRatio: responsiveDesign.childAspectRatio,
        ),
      );
    } else if (errorMessage.isNotEmpty) {
      return SliverToBoxAdapter(
        child: Column(
          children: [
            SizedBox(height: AppSpacing.extraLarge),
            Text(
              'Error to get the products',
              style: textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSpacing.medium),
            Text(
              'Pull to update or refresh',
              style: textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: width * 0.02),
          ],
        ),
      );
    } else {
      return SliverGrid(
        delegate: SliverChildBuilderDelegate(childCount: products.length, (
          context,
          index,
        ) {
          final product = products[index];

          return FadeIn(
            duration: const Duration(milliseconds: 300),
            animate: !Platform.environment.containsKey('FLUTTER_TEST'),
            child: ProducthomeContainer(
              key: Key("ProductHome-$index"),
              id: product.id,
              assetsImage: assetsImage,
              isPromotion: product.isPromotion,
              discount: product.discount,
              url: product.image,
              productName: product.title,
              productCategory: product.category,
              productPrice: product.price,
              isFavorite: myFavoriteList.contains(product),
              onPressedFavorite: () => onPressedFavorite?.call(product),
              onPressedinfo: () => onPressedinfo?.call(product),
              onPressedbuy: () => onPressedbuy?.call(product),
            ),
          );
        }),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: responsiveDesign.columnAmount,
          mainAxisSpacing: responsiveDesign.mainAxisSpacing,
          crossAxisSpacing: responsiveDesign.crossAxisSpacing,
          childAspectRatio: responsiveDesign.childAspectRatio,
        ),
      );
    }
  }
}
