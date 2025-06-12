import 'package:fake_store_design/config/copys.dart';
import 'package:fake_store_design/config/semantics_config.dart';
import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

class CustomAppbars extends StatelessWidget implements PreferredSizeWidget {
  final AppbarType appbarType; // The type of the AppBar (product, cart, etc.)
  final String? name; // The user's first name (optional)
  final String? lastName; // The user's last name (optional)
  final Function()?
  backonPressed; // Action to perform when the back button is pressed
  final Function()?
  cartonPressed; // Action to perform when the cart button is pressed
  final Function()?
  logInonPressed; // Action to perform when the login button is pressed
  final Function()?
  logOutonPressed; // Action to perform when the logout button is pressed
  final Function()?
  useronPressed; // Action to perform when the user profile button is pressed

  const CustomAppbars({
    super.key,
    required this.appbarType, // Required AppBar type
    this.backonPressed, // Optional callback for back button
    this.cartonPressed, // Optional callback for cart button
    this.logInonPressed, // Optional callback for login button
    this.logOutonPressed, // Optional callback for logout button
    this.useronPressed, // Optional callback for user profile button
    this.name, // Optional user name
    this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return _getAppBar(
      appbarType,
      context,
    ); // Return the AppBar based on the appbarType
  }

  // Method to generate the AppBar based on the appbarType
  AppBar _getAppBar(AppbarType appbarType, BuildContext context) {
    final textTheme = Theme.of(context).textTheme; // Get the current text theme

    List<Widget> leading =
        []; // List of widgets for the leading section (back button, etc.)
    List<Widget> actions =
        []; // List of widgets for the actions section (cart, login, etc.)
    Widget? title; // Title widget for the AppBar

    // Switch case to handle different AppBar types and define the actions
    switch (appbarType) {
      case AppbarType.productAppbar:
        leading = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[0].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.back, // Back button
            onPressed: backonPressed, // Action for back button
          ),
        ];
        actions = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[1].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.cart, // Cart button
            onPressed: cartonPressed, // Action for cart button
          ),
        ];
        break;
      case AppbarType.cartAppbarlogin:
        leading = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[0].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.back, // Back button
            onPressed: backonPressed, // Action for back button
          ),
        ];
        actions = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[3].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.login, // Login button
            onPressed: logInonPressed, // Action for login button
          ),
        ];
        break;
      case AppbarType.cartAppbarlogout:
        leading = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[0].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.back, // Back button
            onPressed: backonPressed, // Action for back button
          ),
        ];
        title = Center(
          child: Semantics(
            label: SemanticsConfig.instance.data.customButtons[5].label,
            child: Text('$name $lastName', style: textTheme.displayMedium),
          ), // Display user's name
        );
        actions = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[4].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.logout, // Logout button
            onPressed: logOutonPressed, // Action for logout button
          ),
        ];
        break;
      case AppbarType.homeLogOutAppbar:
        leading = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[2].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.user, // User profile button
            onPressed: useronPressed, // Action for user profile button
          ),
        ];
        title = Center(
          child: Semantics(
            label: SemanticsConfig.instance.data.customButtons[5].label,
            child: Text('$name $lastName', style: textTheme.displayMedium),
          ), // Display user's name
        );
        actions = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[1].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.cart, // Cart button
            onPressed: cartonPressed, // Action for cart button
          ),
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[4].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.logout, // Logout button
            onPressed: logOutonPressed, // Action for logout button
          ),
        ];
        break;
      case AppbarType.homeLogInAppbar:
        leading = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[3].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.login, // Login button
            onPressed: logInonPressed, // Action for login button
          ),
        ];
        title = Center(
          child: Text(Copys.appbartTexthome, style: textTheme.displayMedium),
        ); // Title "Home"
        actions = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[1].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.cart, // Cart button
            onPressed: cartonPressed, // Action for cart button
          ),
        ];
        break;
      case AppbarType.userAppbar:
        leading = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[0].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.back, // Back button
            onPressed: backonPressed, // Action for back button
          ),
        ];
        title = Center(
          child: Semantics(
            label: SemanticsConfig.instance.data.customButtons[5].label,
            child: Text('$name $lastName', style: textTheme.displayMedium),
          ), // Display user's name
        );
        actions = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[1].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.cart, // Cart button
            onPressed: cartonPressed, // Action for cart button
          ),
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[4].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.logout, // Logout button
            onPressed: logOutonPressed, // Action for logout button
          ),
        ];
        break;
      case AppbarType.logInAppbar:
        leading = [
          AppButtons(
            semanticsText: SemanticsConfig.instance.data.customButtons[0].label,
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.back, // Back button
            onPressed: backonPressed, // Action for back button
          ),
        ];
        break;
    }

    /// Return the AppBar with the configured leading, title, and actions
    return AppBar(
      backgroundColor: AppColors.onPrimary, // Background color of the AppBar
      leading:
          leading.isNotEmpty
              ? Row(children: leading)
              : null, // Leading section (e.g., back button)
      title: title, // The title of the AppBar
      actions:
          actions.isNotEmpty
              ? actions
              : null, // The action buttons (e.g., cart, login)
    );
  }

  // Define the preferred size of the AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Standard AppBar height
}

enum AppbarType {
  productAppbar,
  cartAppbarlogin,
  cartAppbarlogout,
  homeLogInAppbar,
  homeLogOutAppbar,
  userAppbar,
  logInAppbar,
}
