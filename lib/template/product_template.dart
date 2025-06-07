import 'package:flutter/material.dart';
import 'package:fake_store_design/molecules/molecules.dart';
import 'package:fake_store_design/organisms/organisms.dart';

/// A widget representing the product detail screen.
///
/// This screen displays the detailed information of a specific product, including
/// the product's image, name, description, price, and options for adding it to the
/// cart or marking it as a favorite.
///
/// It also includes an app bar with options to navigate back or to the cart.
class ProductTemplate extends StatelessWidget {
  /// A flag indicating whether the product is marked as a favorite.
  final bool isFavorite;

  /// unique identifier
  final int id;

  /// The callback function for when the cart button is pressed.
  final VoidCallback? cartonPressed;

  /// The callback function for when the back button is pressed.
  final VoidCallback? backonPressed;

  /// The callback function for when the favorite button is pressed.
  final VoidCallback? onPressedFavorite;

  /// The callback function for when the buy button is pressed.
  final VoidCallback? onPressedbuy;

  /// The URL of the product's image.
  final String url;

  /// Must be a valid assets image URL.
  final String assetsImage;

  /// A description of the product.
  final String description;

  /// The name of the product.
  final String productName;

  /// The price of the product.
  final double productPrice;

  /// Whether the product is in promotion.
  final bool isPromotion;

  /// Discount value
  final double discount;

  /// Text button to add to the cart
  //final String textButonProduct;

  /// Creates an instance of [ProductTemplate].
  ///
  /// This widget represents a screen displaying detailed product information,
  /// including the product's image, name, description, price, and actions for
  /// adding it to the cart or marking it as a favorite.
  const ProductTemplate({
    super.key,
    required this.isFavorite,
    this.cartonPressed,
    this.backonPressed,
    this.onPressedFavorite,
    this.onPressedbuy,
    required this.url,
    required this.description,
    required this.productName,
    required this.productPrice,
    required this.isPromotion,
    required this.discount,
    required this.assetsImage,
    required this.id,
    //required this.textButonProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The app bar for the product details screen with custom actions
      appBar: CustomAppbars(
        appbarType:
            AppbarType.productAppbar, // Type for the product screen app bar
        backonPressed: backonPressed, // Action for the back button press
        cartonPressed: cartonPressed, // Action for the cart button press
      ),
      // The main body of the screen displaying the product details
      body: ProductInfoContainer(
        id: id,
        assetsImage: assetsImage,
        url: url, // Product image URL
        productName: productName, // Product name
        description: description, // Product description
        productPrice: productPrice, // Product price
        //textButonProduct: textButonProduct,
        onPressedbuy: onPressedbuy, // Action for the buy button
        isFavorite: isFavorite, // Whether the product is marked as a favorite
        onPressedFavorite: onPressedFavorite,
        isPromotion: isPromotion,
        discount: discount, // Action for the favorite button
      ),
    );
  }
}
