import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum ColorType { primary, primaryVariant }

class CustomAppbarNavigator extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final ColorType colorType;
  const CustomAppbarNavigator({
    super.key,
    required this.title,
    required this.colorType,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor:
          colorType == ColorType.primary
              ? AppColors.primary
              : AppColors.primaryVariant,
      title: Text(
        title,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
