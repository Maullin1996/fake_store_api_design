import 'package:animate_do/animate_do.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';

/// A widget representing the cart screen for authenticated and unauthenticated users.
///
/// This screen displays a list of products in the cart, including the ability to
/// adjust product quantities. It also displays different dialogs depending on
/// whether the user is logged in or not. The widget conditionally shows the appropriate
/// app bar and dialog based on the authentication state of the user.
class CartTemplate extends StatelessWidget {
  /// The authentication state of the user.
  final bool authentication;

  /// The first name of the user (if authenticated).
  final String? name;

  /// The last name of the user (if authenticated).
  final String? lastName;

  /// The total price to pay for the items in the cart.
  final String totalToPay;

  /// The list of products in the cart.
  final List<dynamic> listCart;

  /// The callback function for the "back" button.
  final VoidCallback? backonPressed;

  /// The callback function for logging out.
  final VoidCallback? logOutonPressed;

  /// The callback function for logging in.
  final VoidCallback? logInonPressed;

  /// The callback function for decreasing the quantity of a product in the cart.
  final void Function(dynamic)? onPressedminus;

  /// The callback function for increasing the quantity of a product in the cart.
  final void Function(dynamic)? onPressedplus;

  /// The callback function for when the dialog button is pressed.
  final VoidCallback? onDialogButtonPressed;

  /// Creates an instance of [CartTemplate].
  ///
  /// The [authentication] parameter determines if the user is logged in. The [listCart]
  /// contains the products in the cart, and the [totalToPay] indicates the amount to be paid.
  /// The other parameters provide actions for logging in, logging out, and modifying the cart's contents.
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
  });

  @override
  Widget build(BuildContext context) {
    // Scaffold is used to create the basic visual structure of the screen
    return Scaffold(
      // The app bar changes based on whether the user is authenticated
      appBar:
          authentication
              ? CustomAppbars(
                appbarType: AppbarType.cartAppbarlogout, // For logged-in users
                backonPressed: backonPressed,
                logOutonPressed: logOutonPressed,
                name: name,
                lastName: lastName,
              )
              : CustomAppbars(
                appbarType:
                    AppbarType.cartAppbarlogin, // For unauthenticated users
                backonPressed: backonPressed,
                logInonPressed: logInonPressed,
              ),
      backgroundColor: Color.fromARGB(255, 238, 238, 238), // Background color
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Padding around the body content
        child: Stack(
          children: [
            // List of cart products displayed in a scrollable list
            FadeInUp(
              child: ListView.separated(
                padding: EdgeInsets.only(
                  bottom: AppSpacing.large,
                ), // Padding at the bottom
                itemCount: listCart.length, // Number of items in the cart
                itemBuilder: (BuildContext context, int index) {
                  final product =
                      listCart[index]; // Get the product at this index
                  return ProductCartContainer(
                    url: product.image, // Image URL for the product
                    productName: product.title, // Name of the product
                    amount:
                        'x${product.quantity}', // Product quantity in the cart
                    productPrice: product.price.toString(), // Product price
                    onPressedminus:
                        () =>
                            onPressedminus?.call(product), // Decrease quantity
                    onPressedplus:
                        () => onPressedplus?.call(product), // Increase quantity
                  );
                },
                separatorBuilder:
                    (context, index) => SizedBox(
                      height: AppSpacing.small,
                    ), // Spacer between items
              ),
            ),
            // Positioned widget to display the dialog at the bottom of the screen
            Positioned(
              bottom: AppSpacing.small, // Bottom margin for the dialog
              left: 0,
              right: 0,
              child: Center(
                child:
                    authentication
                        ? CustomDialog(
                          totalToPay: totalToPay, // Display total price
                          dialogType:
                              DialogType
                                  .authenticated, // Dialog for authenticated users
                          onDialogButtonPressed: onDialogButtonPressed,
                        )
                        : CustomDialog(
                          totalToPay: totalToPay, // Display total price
                          dialogType:
                              DialogType
                                  .unauthenticated, // Dialog for unauthenticated users
                          onDialogButtonPressed: onDialogButtonPressed,
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
