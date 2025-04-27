import 'package:fake_store_design/atoms/break_points.dart';
import 'package:flutter/material.dart';

import 'tokens.dart';

/// A customizable input field with responsive width and design system styling.
///
/// This widget supports label text, validation, obscured text (e.g. for passwords),
/// and toggling floating label behavior.
class AppInputText extends StatelessWidget {
  /// The label displayed above the input field.
  final String label;

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
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.medium),
    );

    return SizedBox(
      width:
          ResponsiveDesign(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
          ).appInputTextWidth,
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
