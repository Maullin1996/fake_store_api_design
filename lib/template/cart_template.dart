import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';

/// Template widget that displays the shopping cart screen.
///
/// Depending on the [authentication] flag, the UI adapts to show
/// either a login or logout app bar and appropriate checkout dialogs.
/// It renders a scrollable list of cart products, along with a fixed
/// dialog at the bottom to handle purchase or authentication prompts.
class CartTemplate extends StatelessWidget {
  /// Indicates if the user is authenticated.
  final bool authentication;

  /// Path to the local fallback image asset.
  final String assetsImage;

  /// User's first name (optional, used when authenticated).
  final String? name;

  /// User's last name (optional, used when authenticated).
  final String? lastName;

  /// Total amount to pay displayed in the bottom dialog.
  final String totalToPay;

  /// List of cart items to render.
  final List<dynamic> listCart;

  /// Callback triggered when the back button is pressed.
  final VoidCallback? backonPressed;

  /// Callback triggered when logout is requested.
  final VoidCallback? logOutonPressed;

  /// Callback triggered when login is requested.
  final VoidCallback? logInonPressed;

  /// Callback triggered when the minus button is tapped on a cart item.
  final void Function(dynamic)? onPressedminus;

  /// Callback triggered when the plus button is tapped on a cart item.
  final void Function(dynamic)? onPressedplus;

  /// Callback triggered when the dialog button (checkout/login) is pressed.
  final VoidCallback? onDialogButtonPressed;

  /// Callback triggered when a cart item is tapped for more information.
  final void Function(dynamic)? onPressedinfo;

  /// Creates a [CartTemplate] widget.
  const CartTemplate({
    super.key,
    required this.authentication,
    required this.listCart,
    this.name,
    this.lastName,
    this.backonPressed,
    this.logOutonPressed,
    this.logInonPressed,
    this.onPressedminus,
    this.onPressedplus,
    this.onDialogButtonPressed,
    this.totalToPay = '',
    this.onPressedinfo,
    required this.assetsImage,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          authentication
              ? CustomAppbars(
                appbarType: AppbarType.cartAppbarlogout,
                backonPressed: backonPressed,
                logOutonPressed: logOutonPressed,
                name: name,
                lastName: lastName,
              )
              : CustomAppbars(
                appbarType: AppbarType.cartAppbarlogin,
                backonPressed: backonPressed,
                logInonPressed: logInonPressed,
              ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Stack(
        children: [
          // Cart item list with fade animation.
          FadeInUp(
            delay: const Duration(milliseconds: 500),
            animate: !Platform.environment.containsKey('FLUTTER_TEST'),
            child: ListView.separated(
              padding: const EdgeInsets.only(
                top: AppSpacing.medium,
                bottom: AppSpacing.large,
              ),
              itemCount: listCart.length,
              itemBuilder: (context, index) {
                final product = listCart[index];

                return ProductCartContainer(
                  key: Key("ProductCartContainer-$index"),
                  onPressedinfo: () => onPressedinfo?.call(product),
                  description: product.description,
                  url: product.image,
                  assetsImage: assetsImage,
                  productName: product.title,
                  amount: 'x${product.quantity}',
                  productPrice: product.price,
                  isPromotion: product.isPromotion,
                  discount: product.discount,
                  onPressedminus: () => onPressedminus?.call(product),
                  onPressedplus: () => onPressedplus?.call(product),
                );
              },
              separatorBuilder:
                  (context, index) => const SizedBox(height: AppSpacing.small),
            ),
          ),

          // Dialog bar for checkout or login.
          Positioned(
            bottom: AppSpacing.small,
            left: 0,
            right: 0,
            child: Center(
              child:
                  authentication
                      ? CustomDialog(
                        totalToPay: totalToPay,
                        dialogType: DialogType.authenticated,
                        onDialogButtonPressed: onDialogButtonPressed,
                      )
                      : CustomDialog(
                        totalToPay: totalToPay,
                        dialogType: DialogType.unauthenticated,
                        onDialogButtonPressed: onDialogButtonPressed,
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
