import 'package:flutter/material.dart';
import 'tokens.dart';

/// The type of button to render.
///
/// Used by [AppButtons] to determine the appropriate styling and widget to display.
enum ButtonType {
  /// A filled button with the primary color.
  primaryFillButton,

  /// A filled button with the secondary color.
  secondaryFillButton,

  /// A text-only button styled with the primary color.
  primaryTextButton,

  /// A text-only button styled with the secondary color.
  secondaryTextButton,

  /// An icon-only button styled with the primary color.
  primaryIconButton,

  /// An icon-only button styled with the secondary color.
  secondaryIconButton,
}

/// A customizable button widget used across the app.
///
/// This widget supports various button types such as filled buttons, text buttons, and icon buttons.
/// Button appearance and behavior are determined by the [type] property.
class AppButtons extends StatelessWidget {
  /// The text label to display on the button.
  ///
  /// Defaults to `'Enter Title'` if not specified.
  final String title;

  /// Optional icon for [ButtonType.primaryIconButton] or [ButtonType.secondaryIconButton].
  final IconData? icon;

  /// Font size for [ElevatedButton] buttons.
  ///
  /// Defaults to [AppTypography.h4].
  final double fontSizeElevatedButton;

  /// Font size for [TextButton] buttons.
  ///
  /// Defaults to [AppTypography.h3].
  final double fontSizeTextButton;

  /// Callback to be executed when the button is pressed.
  final void Function()? onPressed;

  /// Specifies which type of button to render.
  final ButtonType type;

  /// Size of the icon when using an icon button.
  final double? iconSize;

  /// Horizontal padding or width used in button layout.
  final double buttonWidth;

  /// Whether to show a loading indicator.
  ///
  /// When true, disables the button and shows a [CircularProgressIndicator].
  final bool? isLoading;

  /// Creates an instance of [AppButtons].
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
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ResponsiveDesign responsiveDesign = ResponsiveDesign(
      width: MediaQuery.sizeOf(context).width,
    );

    switch (type) {
      // Filled button with either primary or secondary color.
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
          onPressed: isLoading! ? null : onPressed,
          child:
              isLoading!
                  ? const CircularProgressIndicator()
                  : Text(
                    title,
                    style: textTheme.displaySmall?.copyWith(
                      color: AppColors.onPrimary,
                    ),
                  ),
        );

      // Text-only button with dynamic color depending on enabled/disabled state.
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

      // Icon-only button with customizable icon and color.
      case ButtonType.primaryIconButton:
      case ButtonType.secondaryIconButton:
        return IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: iconSize ?? responsiveDesign.iconZise,
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
