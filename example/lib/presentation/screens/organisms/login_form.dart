import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fake_store_design/design_system.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Login form',
          style: textTheme.displayMedium?.copyWith(
            color: AppColors.onPrimary,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.onPrimary,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.onPrimary),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Custom form', style: textTheme.displayMedium),
            LoginForm(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
