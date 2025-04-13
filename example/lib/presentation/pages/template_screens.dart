import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:example/config/menus/template_menu.dart';
import 'package:example/presentation/widgets/custom_menu.dart';
import 'package:fake_store_design/atoms/tokens.dart';

class TemplateScreens extends StatelessWidget {
  const TemplateScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryVariant,
        title: Text(
          'Template',
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
        itemCount: templateMenu.length,
        itemBuilder: (BuildContext context, int index) {
          final menu = templateMenu[index];
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
