import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrganismsMenu {
  final String title;
  final IconData iconData;
  final String route;

  const OrganismsMenu({
    required this.title,
    required this.iconData,
    required this.route,
  });
}

final List<OrganismsMenu> organismsMenu = [
  OrganismsMenu(
    title: 'Login form',
    iconData: CupertinoIcons.create,
    route: '/login_form',
  ),
  OrganismsMenu(
    title: 'Custom dialogs',
    iconData: Icons.message,
    route: '/custom_dialogs',
  ),
  OrganismsMenu(
    title: 'Custom Floating Notification',
    iconData: Icons.notification_add,
    route: '/custom_floating_notification',
  ),
  OrganismsMenu(
    title: 'Product Cart Holder',
    iconData: CupertinoIcons.cart,
    route: '/product_cart',
  ),
  OrganismsMenu(
    title: 'Product Home Holder',
    iconData: CupertinoIcons.home,
    route: '/product_home',
  ),
  OrganismsMenu(
    title: 'Product Info Holder',
    iconData: CupertinoIcons.cube_box,
    route: '/product_info_holder',
  ),
];
