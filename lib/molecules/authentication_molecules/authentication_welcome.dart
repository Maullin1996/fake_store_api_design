import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

class AuthenticationWelcome extends StatelessWidget {
  const AuthenticationWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: AppColors.onPrimary,
      padding: EdgeInsets.fromLTRB(
        AppSpacing.medium,
        AppSpacing.large,
        AppSpacing.small,
        AppSpacing.small,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hello!', style: textTheme.displayLarge),
          SizedBox(height: AppSpacing.small),
          Text('Welcome to Fake App Store', style: textTheme.displaySmall),
        ],
      ),
    );
  }
}
