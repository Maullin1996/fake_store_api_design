import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter/material.dart';

class SpacingRadiusScreen extends StatelessWidget {
  const SpacingRadiusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final Map<String, double> spacings = {
      '5px': AppSpacing.xSmall,
      '12px': AppSpacing.small,
      '24px': AppSpacing.smallMedium,
      '34px': AppSpacing.medium,
      '44px': AppSpacing.mediumLarge,
      '64px': AppSpacing.large,
      '124px': AppSpacing.extraLarge,
    };

    final Map<String, double> radius = {
      '8px': AppRadius.small,
      '12px': AppRadius.medium,
      '16px': AppRadius.large,
      '24px': AppRadius.extraLarge,
    };

    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Spacing and Radius',
        colorType: ColorType.primary,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.small,
          horizontal: AppSpacing.small,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Spacings for the App', style: textTheme.displayLarge),
              SizedBox(height: AppSpacing.small),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: spacings.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: AppSpacing.small);
                },
                itemBuilder: (BuildContext context, int index) {
                  final spacing = spacings.values.elementAt(index);
                  final labels = spacings.keys.elementAt(index);
                  return Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text(labels, style: textTheme.displaySmall),
                      ),
                      SizedBox(width: AppSpacing.small),
                      Container(
                        height: spacing,
                        width: spacing,
                        decoration: BoxDecoration(color: AppColors.primary),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: AppSpacing.medium),
              Text('Radius for the App', style: textTheme.displayLarge),
              SizedBox(height: AppSpacing.small),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: radius.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: AppSpacing.small);
                },
                itemBuilder: (BuildContext context, int index) {
                  final border = radius.values.elementAt(index);
                  final labels = radius.keys.elementAt(index);
                  return Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text(labels, style: textTheme.displaySmall),
                      ),
                      SizedBox(width: AppSpacing.small),
                      Container(
                        height: AppSpacing.large,
                        width: AppSpacing.large,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(border),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
