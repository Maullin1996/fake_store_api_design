import 'package:example/config/menus/pages_menu.dart';
import 'package:example/presentation/widgets/custom_menu.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PagesScreens extends StatelessWidget {
  const PagesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryVariant,
        title: Text(
          'Pages',
          style: textTheme.displayMedium?.copyWith(
            color: AppColors.onPrimary,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.onPrimary,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.onPrimary),
        ),
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
