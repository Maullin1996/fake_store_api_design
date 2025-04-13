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
    title: 'Product Holders',
    iconData: CupertinoIcons.cube_box,
    route: '/product_holders',
  ),
];
