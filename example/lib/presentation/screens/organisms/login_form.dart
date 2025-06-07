import 'package:flutter/material.dart';
import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/design_system.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  bool oscureText = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Log In Form',
        colorType: ColorType.primary,
      ),
      backgroundColor: AppColors.onPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Custom form', style: textTheme.displayMedium),
            LoginForm(
              // loginTitle: "Login",
              // subtitle: "Sign in to continue",
              // labelUsername: "Username",
              // labelPassword: "Password",
              // titleButtonLogin: "Enter",
              onPressed: () {},
              isLoadingButton: false,
              obscureText: oscureText,
              iconOnPressed: () {
                setState(() {
                  oscureText = !oscureText;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
