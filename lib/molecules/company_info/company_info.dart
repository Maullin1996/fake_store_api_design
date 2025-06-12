import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';

/// A widget that displays company contact information such as address,
/// email, WhatsApp, and Instagram.
///
/// The layout is responsive and adapts based on screen size.
class CompanyInfo extends StatelessWidget {
  // /// Company's physical address.
  // final String address;

  // /// Company's support email.
  // final String email;

  // /// WhatsApp contact number or link.
  // final String whatsapp;

  // /// Instagram handle or profile link.
  // final String instagram;

  /// Creates a [CompanyInfo] widget.
  const CompanyInfo({
    super.key,
    // required this.address,
    // required this.email,
    // required this.whatsapp,
    // required this.instagram,
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

  /// Builds the layout depending on the screen width.
  ///
  /// On small screens, all contact information is stacked vertically.
  /// On larger screens, it's split into two columns.
  Widget _buildWidget(double screenWidth, TextTheme textTheme) {
    /// Builds a row with an icon and text, with overflow handling.
    Widget infoStructure(IconData iconData, String text) {
      final decoration = textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.bold,
      );

      return Row(
        children: [
          Icon(iconData),
          SizedBox(width: AppSpacing.small),
          screenWidth <= BreakPoints.small
              ? SizedBox(
                width: screenWidth * 0.8,
                child: Text(
                  text,
                  style: decoration,
                  overflow: TextOverflow.ellipsis,
                ),
              )
              : Text(text, style: decoration, overflow: TextOverflow.ellipsis),
        ],
      );
    }

    // Layout for small screens (stacked, single column)
    if (screenWidth <= BreakPoints.medium) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.small),
        child: Row(
          key: Key("1 column"),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                infoStructure(AppIcons.city, Copys.companyInformationAddress),
                SizedBox(height: AppSpacing.xSmall),
                infoStructure(AppIcons.mail, Copys.companyInformationEmail),
                SizedBox(height: AppSpacing.xSmall),
                infoStructure(
                  AppIcons.whatsapp,
                  Copys.companyInformationWhatsapp,
                ),
                SizedBox(height: AppSpacing.xSmall),
                infoStructure(
                  AppIcons.instagram,
                  Copys.companyInformationInstagram,
                ),
                SizedBox(height: AppSpacing.xSmall),
              ],
            ),
          ],
        ),
      );
    }

    // Layout for larger screens (two columns)
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.small),
      child: Row(
        key: Key("2 column"),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoStructure(AppIcons.city, Copys.companyInformationAddress),
              SizedBox(height: AppSpacing.xSmall),
              infoStructure(AppIcons.mail, Copys.companyInformationEmail),
              SizedBox(height: AppSpacing.xSmall),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoStructure(AppIcons.whatsapp, Copys.companyInformationEmail),
              SizedBox(height: AppSpacing.xSmall),
              infoStructure(
                AppIcons.instagram,
                Copys.companyInformationInstagram,
              ),
              SizedBox(height: AppSpacing.xSmall),
            ],
          ),
        ],
      ),
    );
  }
}
