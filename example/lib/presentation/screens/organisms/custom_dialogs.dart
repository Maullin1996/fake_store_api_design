import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';

class CustomDialogs extends StatelessWidget {
  const CustomDialogs({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Custom Dialog',
        colorType: ColorType.primary,
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('User Unauthenticated', style: textTheme.displayMedium),

            SizedBox(height: AppSpacing.small),
            CustomDialog(
              dialogType: DialogType.unauthenticated,
              onDialogButtonPressed: () {},
            ),
            SizedBox(height: AppSpacing.medium),
            Text('User Authenticated', style: textTheme.displayMedium),
            SizedBox(height: AppSpacing.small),
            CustomDialog(
              dialogType: DialogType.authenticated,
              onDialogButtonPressed: () {},
            ),
            SizedBox(height: AppSpacing.small),
          ],
        ),
      ),
    );
  }
}
