import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

/// A widget that displays a user's personal and address information.
///
/// This widget shows the user's details such as username, email, phone, and address
/// in a structured format. It uses icons and text to represent each piece of information.
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

  /// Builds a row containing an icon and a piece of text.
  ///
  /// This helper method creates a row with an icon and a corresponding text
  /// to represent a specific piece of information (e.g., username, phone).
  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        // Display the icon with a size of 35 and color [AppColors.secondary].
        Icon(icon, size: 35, color: AppColors.secondary),

        // Add spacing between the icon and the text.
        SizedBox(width: AppSpacing.small),

        // Display the text with a specific style.
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
      // Set padding around the container to add spacing.
      padding: EdgeInsets.only(
        left: AppSpacing.small,
        bottom: AppSpacing.medium,
        right: AppSpacing.small,
      ),

      // Set the background color of the container.
      color: AppColors.onPrimary,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title for personal information section.
          Text('Personal Information', style: textTheme.headlineLarge),

          // Add some vertical spacing.
          SizedBox(height: AppSpacing.small),

          // Display each piece of personal information using _buildInfoRow.
          _buildInfoRow(context, AppIcons.username, username),
          SizedBox(height: AppSpacing.small),
          _buildInfoRow(context, AppIcons.mail, email),
          SizedBox(height: AppSpacing.small),
          _buildInfoRow(context, AppIcons.phone, phone),

          // Title for address information section.
          SizedBox(height: AppSpacing.small),
          Text('Address Information', style: textTheme.headlineLarge),
          SizedBox(height: AppSpacing.small),

          // Display each piece of address information using _buildInfoRow.
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
