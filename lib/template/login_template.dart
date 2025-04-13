import 'package:flutter/material.dart';
import 'package:fake_store_design/molecules/molecules.dart';

import '../atoms/tokens.dart';
import '../organisms/authentication/login_form.dart';

class LoginTemplate extends StatelessWidget {
  final VoidCallback? cartonPressed;
  final VoidCallback? backonPressed;
  final VoidCallback? onPressed;
  final Function(String)? onChangePassword;
  final Function(String)? onChangeUsername;
  final TextEditingController? usernameController;
  final TextEditingController? passwordController;
  final String? Function(String?)? validatorPassword;
  final String? Function(String?)? validatorUsername;

  const LoginTemplate({
    super.key,
    this.cartonPressed,
    this.backonPressed,
    this.onPressed,
    this.onChangePassword,
    this.onChangeUsername,
    this.usernameController,
    this.passwordController,
    this.validatorPassword,
    this.validatorUsername,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbars(
        appbarType: AppbarType.logInAppbar,
        cartonPressed: cartonPressed,
        backonPressed: backonPressed,
      ),
      backgroundColor: AppColors.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthenticationWelcome(),
            LoginForm(
              onPressed: onPressed,
              onChangePassword: onChangePassword,
              passwordController: passwordController,
              onChangeUsername: onChangeUsername,
              usernameController: usernameController,
              validatorPassword: validatorPassword,
              validatorUsername: validatorUsername,
            ),
          ],
        ),
      ),
    );
  }
}
