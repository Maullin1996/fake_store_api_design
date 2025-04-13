import 'package:flutter/material.dart';
import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter/cupertino.dart';

class TemplateMenu {
  final String title;
  final IconData iconData;
  final String route;

  const TemplateMenu({
    required this.title,
    required this.iconData,
    required this.route,
  });
}

final List<TemplateMenu> templateMenu = [
  TemplateMenu(
    title: 'Home template',
    iconData: Icons.home,
    route: '/home_template',
  ),
  TemplateMenu(
    title: 'User template',
    iconData: CupertinoIcons.person_crop_circle,
    route: '/user_template',
  ),
  TemplateMenu(
    title: 'Product template',
    iconData: Icons.dry_cleaning,
    route: '/product_template',
  ),
  TemplateMenu(
    title: 'Cart template',
    iconData: AppIcons.cart,
    route: '/cart_template',
  ),
  TemplateMenu(
    title: 'Login template',
    iconData: AppIcons.login,
    route: '/login_template',
  ),
];
