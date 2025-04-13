import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String? image;

  const CustomMenu({super.key, required this.title, this.icon, this.image});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      title: Text(title, style: textTheme.displayMedium),
      leading:
          icon != null
              ? Icon(icon, size: 40, color: AppColors.primary)
              : SizedBox(width: 50, child: AppAssetsImage(path: image!)),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
