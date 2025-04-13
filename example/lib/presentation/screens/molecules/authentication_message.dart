import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fake_store_design/atoms/tokens.dart';
import 'package:fake_store_design/molecules/molecules.dart';

class AuthenticationMessage extends StatelessWidget {
  const AuthenticationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Authentication message',
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
      body: SingleChildScrollView(
        child: Column(children: [AuthenticationWelcome()]),
      ),
    );
  }
}
