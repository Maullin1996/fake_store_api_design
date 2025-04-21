import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:example/config/menus/organisms_menu.dart';
import 'package:example/presentation/widgets/custom_menu.dart';

class OrganismsScreens extends StatelessWidget {
  const OrganismsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Organisms',
        colorType: ColorType.primaryVariant,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: organismsMenu.length,
        itemBuilder: (BuildContext context, int index) {
          final menu = organismsMenu[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () => context.push(menu.route),
              child: CustomMenu(title: menu.title, icon: menu.iconData),
            ),
          );
        },
      ),
    );
  }
}
