import 'package:fake_store_design/design_system.dart';
//import 'package:fake_store_design/models/base_product.dart';

import 'package:flutter/material.dart';

/// A widget representing the home screen of the application.
///
/// This screen displays a list of products, along with a category selection menu,
/// and provides actions for interacting with the products (like adding to favorites,
/// viewing product details, and purchasing). The screen adjusts the layout and
/// app bar based on the user's authentication state.
class HomeTamplate extends StatelessWidget {
  /// A flag indicating whether the user is logged in.
  final bool isLogIn;

  /// A list of products to be displayed on the home screen.
  final List<dynamic> products;

  /// An optional error message to be displayed in case of an error.
  final String? errorMessage;

  /// A flag indicating whether the products are currently loading.
  final bool isLoading;

  /// A list of the user's favorite products.
  final List<dynamic> myFavoriteList;

  /// A list of the products in the user's shopping cart.
  final List<dynamic> myCartList;

  /// The selected category to filter the displayed products.
  final String selectedCategory;

  /// The callback function to handle favorite button presses on products.
  final void Function(dynamic)? onPressedFavorite;

  /// The callback function to handle info button presses on products.
  final void Function(dynamic)? onPressedinfo;

  /// The callback function to handle buy button presses on products.
  final void Function(dynamic)? onPressedbuy;

  /// The callback function to handle the log in action.
  final VoidCallback? logInonPressed;

  /// The callback function to handle the cart button press.
  final VoidCallback? cartonPressed;

  /// The callback function to handle user profile button press.
  final VoidCallback? useronPressed;

  /// The callback function to handle log out action.
  final VoidCallback? logOutonPressed;

  /// The first name of the user (if logged in).
  final String? name;

  /// The last name of the user (if logged in).
  final String? lastName;

  /// The callback function to handle category selection.
  final void Function(String) onCategorySelected;

  /// Creates an instance of [HomeTemplate].
  ///
  /// This widget represents the home screen where products are displayed, and
  /// users can interact with them through the favorite, info, and buy buttons.
  /// The layout changes based on whether the user is logged in or not, and
  /// it handles loading and error states.
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
    // Scaffold is used to create the basic visual structure of the screen
    return Scaffold(
      // The app bar changes based on whether the user is logged in
      appBar:
          !isLogIn
              ? CustomAppbars(
                appbarType: AppbarType.homeLogOutAppbar, // For logged-out users
                useronPressed: useronPressed,
                name: name,
                lastName: lastName,
                cartonPressed: cartonPressed,
                logOutonPressed: logOutonPressed,
              )
              : CustomAppbars(
                appbarType: AppbarType.homeLogInAppbar, // For logged-in users
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

  /// Builds the body of the home screen, handling the loading state, error state,
  /// and the display of products.
  ///
  /// If the products are loading, a progress indicator is shown. If an error
  /// message is provided, it is displayed. Otherwise, the list of products is shown.
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
      return const Center(child: CircularProgressIndicator()); // Loading state
    } else if (errorMessage != null) {
      return Center(
        child: Text(
          'Error: $errorMessage', // Error message
          style: textTheme.bodyMedium?.copyWith(color: AppColors.error),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          // Category selection widget
          ListCategory(
            selectedCategory: selectedCategory,
            onCategorySelected: onCategorySelected,
          ),
          // Product grid
          GridView.builder(
            shrinkWrap: true, // Prevents GridView from taking extra space
            physics:
                const NeverScrollableScrollPhysics(), // Disables scrolling within the grid
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns
              mainAxisSpacing: 4, // Vertical spacing between items
              crossAxisSpacing: 4, // Horizontal spacing between items
              childAspectRatio: 0.47, // Aspect ratio of each item
            ),
            itemCount: products.length, // Number of products
            itemBuilder: (context, index) {
              final product = products[index];
              return ProducthomeContainer(
                url: product.image, // Product image URL
                productName: product.title, // Product name
                productCategory: product.category, // Product category
                productPrice: product.price.toString(), // Product price
                isFavorite: myFavoriteList.contains(
                  product,
                ), // Whether the product is in favorites
                onPressedFavorite:
                    () => onPressedFavorite?.call(
                      product,
                    ), // Favorite button action
                onPressedinfo:
                    () => onPressedinfo?.call(product), // Info button action
                onPressedbuy:
                    () => onPressedbuy?.call(product), // Buy button action
              );
            },
          ),
          const SizedBox(height: AppSpacing.small), // Spacer at the bottom
        ],
      ),
    );
  }
}
