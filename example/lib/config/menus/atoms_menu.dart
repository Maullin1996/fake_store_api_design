import 'package:flutter/material.dart';

class AtomsMenu {
  final String title;
  final IconData iconData;
  final String route;

  AtomsMenu({required this.title, required this.iconData, required this.route});
}

final List<AtomsMenu> atomsMenu = [
  AtomsMenu(title: 'Colors', iconData: Icons.color_lens, route: '/colors'),
  AtomsMenu(
    title: 'Typography',
    iconData: Icons.text_format_sharp,
    route: '/typography',
  ),
  AtomsMenu(
    title: 'Buttons',
    iconData: Icons.radio_button_checked,
    route: '/buttons',
  ),
  AtomsMenu(
    title: 'Icons',
    iconData: Icons.insert_emoticon_rounded,
    route: '/icons',
  ),
  AtomsMenu(
    title: 'Spacing and Radius',
    iconData: Icons.space_bar_outlined,
    route: '/spacing-radius',
  ),
  AtomsMenu(
    title: 'Input Text',
    iconData: Icons.app_registration_rounded,
    route: '/inputText',
  ),
];
