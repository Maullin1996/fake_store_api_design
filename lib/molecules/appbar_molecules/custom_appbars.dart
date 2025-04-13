import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

enum AppbarType {
  productAppbar,
  cartAppbarlogin,
  cartAppbarlogout,
  homeLogInAppbar,
  homeLogOutAppbar,
  userAppbar,
  logInAppbar,
}

class CustomAppbars extends StatelessWidget implements PreferredSizeWidget {
  final AppbarType appbarType;
  final String? name;
  final String? lastName;
  final Function()? backonPressed;
  final Function()? cartonPressed;
  final Function()? logInonPressed;
  final Function()? logOutonPressed;
  final Function()? useronPressed;

  const CustomAppbars({
    super.key,
    required this.appbarType,
    this.backonPressed,
    this.cartonPressed,
    this.logInonPressed,
    this.logOutonPressed,
    this.useronPressed,
    this.name,
    this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return _getAppBar(appbarType, context);
  }

  AppBar _getAppBar(AppbarType appbarType, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    List<Widget> leading = [];
    List<Widget> actions = [];
    Widget? title;

    switch (appbarType) {
      case AppbarType.productAppbar:
        leading = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.back,
            onPressed: backonPressed,
          ),
        ];
        actions = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.cart,
            onPressed: cartonPressed,
          ),
        ];
        break;
      case AppbarType.cartAppbarlogin:
        leading = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.back,
            onPressed: backonPressed,
          ),
        ];
        actions = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.login,
            onPressed: logInonPressed,
          ),
        ];
        break;
      case AppbarType.cartAppbarlogout:
        leading = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.back,
            onPressed: backonPressed,
          ),
        ];
        title = Center(
          child: Text('$name $lastName', style: textTheme.displaySmall),
        );
        actions = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.logout,
            onPressed: logOutonPressed,
          ),
        ];
        break;
      case AppbarType.homeLogOutAppbar:
        leading = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.user,
            onPressed: useronPressed,
          ),
        ];
        title = Center(
          child: Text('$name $lastName', style: textTheme.displaySmall),
        );
        actions = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.cart,
            onPressed: cartonPressed,
          ),
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.logout,
            onPressed: logOutonPressed,
          ),
        ];
        break;
      case AppbarType.homeLogInAppbar:
        leading = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.login,
            onPressed: logInonPressed,
          ),
        ];
        title = Center(child: Text('Home', style: textTheme.displaySmall));
        actions = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.cart,
            onPressed: cartonPressed,
          ),
        ];
        break;
      case AppbarType.userAppbar:
        leading = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.back,
            onPressed: backonPressed,
          ),
        ];
        title = Center(
          child: Text('$name $lastName', style: textTheme.displaySmall),
        );
        actions = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.cart,
            onPressed: cartonPressed,
          ),
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.logout,
            onPressed: logOutonPressed,
          ),
        ];
        break;
      case AppbarType.logInAppbar:
        leading = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.back,
            onPressed: backonPressed,
          ),
        ];
        actions = [
          AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.cart,
            onPressed: cartonPressed,
          ),
        ];
        break;
    }

    return AppBar(
      backgroundColor: AppColors.onPrimary,
      leading: leading.isNotEmpty ? Row(children: leading) : null,
      title: title,
      actions: actions.isNotEmpty ? actions : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
