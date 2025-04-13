import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

class InfoUserHolder extends StatelessWidget {
  final String username;
  final String email;
  final String phone;
  final String city;
  final String street;
  final String number;
  final String zipcode;

  const InfoUserHolder({
    super.key,
    required this.username,
    required this.email,
    required this.phone,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(icon, size: 35, color: AppColors.secondary),
        SizedBox(width: AppSpacing.small),
        Text(
          text,
          style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(
        left: AppSpacing.small,
        bottom: AppSpacing.medium,
        right: AppSpacing.small,
      ),
      color: AppColors.onPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal Information', style: textTheme.headlineLarge),
          SizedBox(height: AppSpacing.small),
          _buildInfoRow(context, AppIcons.username, username),
          SizedBox(height: AppSpacing.small),
          _buildInfoRow(context, AppIcons.mail, email),
          SizedBox(height: AppSpacing.small),
          _buildInfoRow(context, AppIcons.phone, phone),
          SizedBox(height: AppSpacing.small),
          Text('Address Information', style: textTheme.headlineLarge),
          SizedBox(height: AppSpacing.small),
          _buildInfoRow(context, AppIcons.city, city),
          SizedBox(height: AppSpacing.small),
          _buildInfoRow(context, AppIcons.street, street),
          SizedBox(height: AppSpacing.small),
          _buildInfoRow(context, AppIcons.direction, number),
          SizedBox(height: AppSpacing.small),
          _buildInfoRow(context, AppIcons.zipCode, zipcode),
        ],
      ),
    );
  }
}
