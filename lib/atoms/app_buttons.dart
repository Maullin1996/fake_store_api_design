import 'package:flutter/material.dart';

import 'tokens.dart';

enum ButtonType {
  /// Represents a primary button with a filled background.
  primaryFillButton,

  /// Represents a secondary button with a filled background.
  secondaryFillButton,

  /// Represents a primary text button.
  primaryTextButton,

  /// Represents a secondary text button.
  secondaryTextButton,

  /// Represents a primary Icon button.
  primaryIconButton,

  /// Represents a secondary Icon button.
  secondaryIconButton,
}

class AppButtons extends StatelessWidget {
  final String title;
  final IconData? icon;
  final double fontSizeElevatedButton;
  final double fontSizeTextButton;
  final void Function()? onPressed;
  final ButtonType type;
  final double? iconSize;
  final double buttonWidth;

  const AppButtons({
    super.key,
    this.title = 'Enter Title',
    this.onPressed,
    required this.type,
    this.fontSizeElevatedButton = AppTypography.h4,
    this.icon,
    this.iconSize,
    this.fontSizeTextButton = AppTypography.h3,
    this.buttonWidth = AppSpacing.medium,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    switch (type) {
      case ButtonType.primaryFillButton:
      case ButtonType.secondaryFillButton:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: buttonWidth),
            backgroundColor:
                type == ButtonType.primaryFillButton
                    ? AppColors.primary
                    : AppColors.secondary,
            disabledBackgroundColor: AppColors.disabledButton,
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: textTheme.displaySmall?.copyWith(color: AppColors.onPrimary),
          ),
        );

      case ButtonType.primaryTextButton:
      case ButtonType.secondaryTextButton:
        return TextButton(
          style: TextButton.styleFrom(shape: const BeveledRectangleBorder()),
          onPressed: onPressed,
          child: Text(
            title,
            style: textTheme.displaySmall?.copyWith(
              fontSize: fontSizeTextButton,
              color:
                  onPressed != null
                      ? (type == ButtonType.primaryTextButton
                          ? AppColors.primary
                          : AppColors.secondary)
                      : AppColors.disabledButton,
            ),
          ),
        );

      case ButtonType.primaryIconButton:
      case ButtonType.secondaryIconButton:
        return IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: iconSize,
            color:
                onPressed != null
                    ? (type == ButtonType.primaryIconButton
                        ? AppColors.primary
                        : AppColors.secondary)
                    : AppColors.disabledButton,
          ),
        );
    }
  }
}
