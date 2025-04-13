import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:example/config/menus/home_menu.dart';
import 'package:example/presentation/widgets/custom_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Atomic Design',
          style: textTheme.displayMedium?.copyWith(color: AppColors.onPrimary),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      backgroundColor: AppColors.onPrimary,
      body: ListView.builder(
        itemCount: homeMenu.length,
        itemBuilder: (BuildContext context, int index) {
          final menuItems = homeMenu[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () => context.push(menuItems.route),
              child: CustomMenu(title: menuItems.title, image: menuItems.image),
            ),
          );
        },
      ),
    );
  }
}
