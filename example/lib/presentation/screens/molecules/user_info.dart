import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'User Info',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('User Icon', style: textTheme.displayMedium),
            IconUserHolder(),
            SizedBox(height: AppSpacing.medium),
            Text('User Information', style: textTheme.displayMedium),
            InfoUserHolder(
              username: 'Username',
              email: 'Email',
              phone: 'Phone',
              city: 'City',
              street: 'Street',
              number: 'Number',
              zipcode: 'ZipCode',
            ),
          ],
        ),
      ),
    );
  }
}
