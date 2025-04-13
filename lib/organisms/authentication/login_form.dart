import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

class LoginForm extends StatelessWidget {
  final Function()? onPressed;
  final Function(String)? onChangeUsername;
  final String? Function(String?)? validatorUsername;
  final TextEditingController? usernameController;
  final Function(String)? onChangePassword;
  final String? Function(String?)? validatorPassword;
  final TextEditingController? passwordController;

  const LoginForm({
    super.key,
    this.onPressed,
    this.onChangeUsername,
    this.validatorUsername,
    this.usernameController,
    this.onChangePassword,
    this.validatorPassword,
    this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(AppSpacing.medium),
      width: MediaQuery.sizeOf(context).width,
      color: AppColors.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Log in', style: textTheme.displayLarge),
          SizedBox(height: AppSpacing.medium),
          AppInputText(
            label: 'Username',
            inputTextSize: InputTextSize.large,
            floatingLabelBehavior: false,
            onChange: onChangeUsername,
            validator: validatorUsername,
            textEditingController: usernameController,
          ),
          SizedBox(height: AppSpacing.medium),
          AppInputText(
            label: 'Password',
            inputTextSize: InputTextSize.large,
            floatingLabelBehavior: false,
            obscureText: true,
            onChange: onChangePassword,
            validator: validatorPassword,
            textEditingController: passwordController,
          ),
          SizedBox(height: AppSpacing.medium),
          Center(
            child: AppButtons(
              type: ButtonType.primaryFillButton,
              title: 'Login',
              onPressed: onPressed,
              buttonWidth: AppSpacing.large,
            ),
          ),
        ],
      ),
    );
  }
}
