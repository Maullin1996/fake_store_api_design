import 'package:flutter/material.dart';

import 'tokens.dart';

/// Defines input sizes available for [AppInputText].
enum InputTextSize {
  /// Large input field — typically used in forms or onboarding.
  large,

  /// Medium input field — suited for most general use cases.
  medium,

  /// Small input field — often used for compact UIs like toolbars or filters.
  small,
}

/// A customizable input field with responsive width and design system styling.
///
/// This widget supports label text, validation, obscured text (e.g. for passwords),
/// and toggling floating label behavior.
class AppInputText extends StatelessWidget {
  /// The label displayed above the input field.
  final String label;

  /// Controls the size (and width) of the input field.
  final InputTextSize inputTextSize;

  /// Optional controller to manage the input's text.
  final TextEditingController? textEditingController;

  /// Whether to obscure the text, typically used for passwords.
  final bool obscureText;

  /// Whether the label should float when focused or not.
  final bool floatingLabelBehavior;

  /// Callback triggered when the input value changes.
  final void Function(String)? onChange;

  /// Optional validator for form usage.
  final String? Function(String?)? validator;

  /// Creates an [AppInputText] widget.
  const AppInputText({
    super.key,
    this.textEditingController,
    this.obscureText = false,
    this.onChange,
    this.validator,
    this.floatingLabelBehavior = true,
    required this.label,
    required this.inputTextSize,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Determine width based on the selected size
    final double width;
    switch (inputTextSize) {
      case InputTextSize.large:
        width = MediaQuery.sizeOf(context).width - 60;
        break;
      case InputTextSize.medium:
        width = 270;
        break;
      case InputTextSize.small:
        width = 150;
        break;
    }

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.medium),
    );

    return SizedBox(
      width: width,
      child: TextFormField(
        controller: textEditingController,
        obscureText: obscureText,
        onChanged: onChange,
        validator: validator,
        decoration: InputDecoration(
          errorStyle: textTheme.bodyLarge,
          fillColor: AppColors.backgroundTextFormField,
          filled: true,
          label: Text(
            label,
            style: textTheme.displaySmall?.copyWith(
              color: AppColors.backgroundText,
            ),
          ),
          floatingLabelBehavior:
              floatingLabelBehavior
                  ? FloatingLabelBehavior.auto
                  : FloatingLabelBehavior.never,
          isDense: true,
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
          errorBorder: border.copyWith(
            borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          ),
          focusedErrorBorder: border.copyWith(
            borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          ),
        ),
      ),
    );
  }
}
