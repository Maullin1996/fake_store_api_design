import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

enum DialogType { authenticated, unauthenticated }

class CustomDialog extends StatelessWidget {
  final DialogType dialogType;
  final VoidCallback? onDialogButtonPressed;
  const CustomDialog({
    super.key,
    required this.dialogType,
    this.onDialogButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppButtons(
      type: ButtonType.secondaryFillButton,
      title: 'Go to pay',
      onPressed: () {
        dialogs(
          context: context,
          textTheme: textTheme,
          dialogType: dialogType,
          onPressed: onDialogButtonPressed,
        );
      },
    );
  }
}

Future<dynamic> dialogs({
  required BuildContext context,
  required TextTheme textTheme,
  required DialogType dialogType,
  VoidCallback? onPressed,
}) {
  String alertText;
  Widget icon;
  String titleTextButton;
  if (dialogType == DialogType.authenticated) {
    alertText = 'Successful Purchase';
    icon = Icon(AppIcons.check, size: 90, color: AppColors.secondary);
    titleTextButton = 'Continue Shopping';
  } else {
    alertText = 'Unauthenticated user';
    icon = Icon(AppIcons.error, size: 90, color: AppColors.error);
    titleTextButton = 'Log In';
  }
  return showDialog(
    context: context,
    builder:
        (context) => Dialog(
          child: Container(
            padding: EdgeInsets.all(AppSpacing.small),
            decoration: BoxDecoration(
              color: AppColors.onPrimary,
              borderRadius: BorderRadius.circular(AppRadius.medium),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 1500),
                  tween: Tween<double>(begin: 0.0, end: 720.0),
                  curve: Curves.easeInOut,
                  builder: (
                    BuildContext context,
                    dynamic angle,
                    Widget? child,
                  ) {
                    return Transform(
                      alignment: Alignment.center,
                      transform:
                          Matrix4.identity()..rotateY(angle * (math.pi / 180)),
                      child: icon,
                    );
                  },
                ),
                SizedBox(height: AppSpacing.medium),
                Text(alertText, style: textTheme.displayMedium),
                SizedBox(height: AppSpacing.small),
                AppButtons(
                  type: ButtonType.secondaryTextButton,
                  title: titleTextButton,
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        ),
  );
}
