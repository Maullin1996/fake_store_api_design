import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';

class LoginTemplate extends StatelessWidget {
  final bool? isLoadingButton;
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
    this.isLoadingButton,
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
              isLoadingButton: isLoadingButton,
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
