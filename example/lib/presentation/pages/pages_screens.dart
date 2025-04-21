import 'package:example/config/menus/pages_menu.dart';
import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:example/presentation/widgets/custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PagesScreens extends StatelessWidget {
  const PagesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Pages',
        colorType: ColorType.primaryVariant,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: pagesMenu.length,
        itemBuilder: (BuildContext context, int index) {
          final menu = pagesMenu[index];
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
