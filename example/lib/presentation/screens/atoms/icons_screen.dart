import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IconsScreen extends StatelessWidget {
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final Map<String, IconData> icons = {
      'Cart': AppIcons.cart,
      'Plus': AppIcons.plus,
      'Minus': AppIcons.minus,
      'Favorite': AppIcons.favorite,
      'unLike': AppIcons.unLike,
      'Star': AppIcons.star,
      'User': AppIcons.user,
      'Username': AppIcons.username,
      'Phone': AppIcons.phone,
      'City': AppIcons.city,
      'Street': AppIcons.street,
      'direction': AppIcons.direction,
      'ZiCode': AppIcons.zipCode,
      'Mail': AppIcons.mail,
      'Error': AppIcons.error,
      'creditCart': AppIcons.creditCart,
      'Check': AppIcons.check,
      'Home': AppIcons.home,
      'Log Out': AppIcons.logout,
      'Log In': AppIcons.login,
      'Info': AppIcons.info,
      'Back': AppIcons.back,
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Icons',
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
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: icons.length,
        itemBuilder: (BuildContext context, int index) {
          final icon = icons.values.elementAt(index);
          final name = icons.keys.elementAt(index);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(name, style: textTheme.displaySmall),
              SizedBox(height: 10),
              Icon(icon, size: 35),
            ],
          );
        },
      ),
    );
  }
}
