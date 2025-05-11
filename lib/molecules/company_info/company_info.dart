import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';

class CompanyInfo extends StatelessWidget {
  final String address;
  final String email;
  final String whatsapp;
  final String instagram;
  const CompanyInfo({
    super.key,
    required this.address,
    required this.email,
    required this.whatsapp,
    required this.instagram,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      width: screenWidth,
      color: AppColors.secondary,
      child: _buildWidget(screenWidth, textTheme),
    );
  }

  Widget _buildWidget(double screenWidth, TextTheme textTheme) {
    Widget infoStructure(IconData iconData, String text) {
      return (screenWidth <= BreakPoints.small)
          ? Row(
            children: [
              Icon(iconData),
              SizedBox(width: AppSpacing.small),
              SizedBox(
                width: screenWidth * 0.8,
                child: Text(
                  text,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
          : Row(
            children: [
              Icon(iconData),
              SizedBox(width: AppSpacing.small),
              Text(
                text,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
    }

    return (screenWidth <= BreakPoints.small)
        ? Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.small),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoStructure(AppIcons.city, address),
                  SizedBox(height: AppSpacing.xSmall),
                  infoStructure(AppIcons.mail, email),
                  SizedBox(height: AppSpacing.xSmall),
                  infoStructure(AppIcons.whatsapp, whatsapp),
                  SizedBox(height: AppSpacing.xSmall),
                  infoStructure(AppIcons.instagram, instagram),
                  SizedBox(height: AppSpacing.xSmall),
                ],
              ),
            ],
          ),
        )
        : Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoStructure(AppIcons.city, address),
                  SizedBox(height: AppSpacing.xSmall),
                  infoStructure(AppIcons.mail, email),
                  SizedBox(height: AppSpacing.xSmall),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoStructure(AppIcons.whatsapp, whatsapp),
                  SizedBox(height: AppSpacing.xSmall),
                  infoStructure(AppIcons.instagram, instagram),
                  SizedBox(height: AppSpacing.xSmall),
                ],
              ),
            ],
          ),
        );
  }
}
