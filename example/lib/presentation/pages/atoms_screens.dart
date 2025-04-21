import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:example/config/menus/atoms_menu.dart';
import 'package:example/presentation/widgets/custom_menu.dart';

class AtomsScreens extends StatelessWidget {
  const AtomsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Atoms',
        colorType: ColorType.primaryVariant,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: atomsMenu.length,
        itemBuilder: (BuildContext context, int index) {
          final menu = atomsMenu[index];
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
