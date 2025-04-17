import 'package:flutter/material.dart';

import 'tokens.dart';

enum InputTextSize { large, medium, small }

class AppInputText extends StatelessWidget {
  final String label;
  final InputTextSize inputTextSize;
  final TextEditingController? textEditingController;
  final bool obscureText;
  final bool floatingLabelBehavior;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
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
    final double width;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(12));
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
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: textEditingController,
        obscureText: obscureText,
        onChanged: onChange,
        validator: validator,

        decoration: InputDecoration(
          errorStyle: textTheme.bodyLarge,
          fillColor: AppColors.backGoundTextFormField,
          filled: true,
          label: Text(
            label,
            style: textTheme.displaySmall?.copyWith(
              color: AppColors.backGroundText,
            ),
          ),
          floatingLabelBehavior:
              floatingLabelBehavior
                  ? FloatingLabelBehavior.auto
                  : FloatingLabelBehavior.never,
          isDense: true,
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: BorderSide(color: AppColors.primary, width: 1.5),
          ),
          focusedErrorBorder: border.copyWith(
            borderSide: BorderSide(color: AppColors.error, width: 1.5),
          ),
          errorBorder: border.copyWith(
            borderSide: BorderSide(color: AppColors.error, width: 1.5),
          ),
        ),
      ),
    );
  }
}
