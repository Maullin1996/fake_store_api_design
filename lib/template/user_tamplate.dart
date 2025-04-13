import 'package:flutter/material.dart';

import '../atoms/tokens.dart';
import '../molecules/molecules.dart';

class UserTemplate extends StatelessWidget {
  final VoidCallback? backonPressed;
  final VoidCallback? cartonPressed;
  final VoidCallback? logOutonPressed;
  final String lastName;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String city;
  final String street;
  final String number;
  final String zipcode;
  const UserTemplate({
    super.key,
    this.backonPressed,
    this.cartonPressed,
    this.logOutonPressed,
    required this.lastName,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbars(
        appbarType: AppbarType.userAppbar,
        backonPressed: backonPressed,
        cartonPressed: cartonPressed,
        logOutonPressed: logOutonPressed,
        lastName: lastName,
        name: name,
      ),
      backgroundColor: AppColors.onPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconUserHolder(),
            InfoUserHolder(
              username: username,
              email: email,
              phone: phone,
              city: city,
              street: street,
              number: number,
              zipcode: zipcode,
            ),
          ],
        ),
      ),
    );
  }
}
