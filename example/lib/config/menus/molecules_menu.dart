import 'package:flutter/material.dart';
import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter/cupertino.dart';

class MoleculesMenu {
  final String title;
  final IconData iconData;
  final String route;

  const MoleculesMenu({
    required this.title,
    required this.iconData,
    required this.route,
  });
}

final List<MoleculesMenu> moleculesMenu = [
  MoleculesMenu(
    title: 'Customs Appbars',
    iconData: Icons.home,
    route: '/customsappbars',
  ),
  MoleculesMenu(
    title: 'User info',
    iconData: CupertinoIcons.person_crop_circle,
    route: '/user_info',
  ),
  MoleculesMenu(
    title: 'Authentication message',
    iconData: AppIcons.login,
    route: '/authentication_message',
  ),
  MoleculesMenu(
    title: 'Product complements',
    iconData: AppIcons.info,
    route: '/product_complements',
  ),
];
