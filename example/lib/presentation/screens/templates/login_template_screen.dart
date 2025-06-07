import 'package:flutter/material.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:go_router/go_router.dart';

class LoginTemplateScreen extends StatefulWidget {
  const LoginTemplateScreen({super.key});

  @override
  State<LoginTemplateScreen> createState() => _LoginTemplateScreenState();
}

class _LoginTemplateScreenState extends State<LoginTemplateScreen> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      // loginTitle: "Login",
      // subtitle: "Sign in to continue",
      // labelUsername: "Username",
      // labelPassword: "Password",
      // titleButtonLogin: "Enter",
      path: 'assets/images/Logotipo.png',
      obscureText: obscureText,
      iconOnPressed: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      isLoadingButton: false,
      cartonPressed: () {},
      backonPressed: () {
        context.pop();
      },
      onPressed: () {},
    );
  }
}
