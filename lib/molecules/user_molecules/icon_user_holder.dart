import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

class IconUserHolder extends StatelessWidget {
  const IconUserHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: AppSpacing.small),
      width: MediaQuery.sizeOf(context).width,
      color: AppColors.onPrimary,
      child: Column(
        children: [
          Icon(AppIcons.user, size: 100),
          SizedBox(height: AppSpacing.medium),
        ],
      ),
    );
  }
}
