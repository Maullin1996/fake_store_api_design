import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fake_store_design/atoms/tokens.dart';
import 'package:example/config/menus/organisms_menu.dart';
import 'package:example/presentation/widgets/custom_menu.dart';

class OrganismsScreens extends StatelessWidget {
  const OrganismsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryVariant,
        title: Text(
          'Molecules',
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
