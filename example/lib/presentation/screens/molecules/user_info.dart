import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'User Information',
        colorType: ColorType.primary,
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
