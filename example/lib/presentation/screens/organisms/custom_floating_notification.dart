import 'package:flutter/material.dart';
import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/design_system.dart';

class CustomFloatingNotification extends StatelessWidget {
  const CustomFloatingNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: "Custom Floating Notification",
        colorType: ColorType.primary,
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 380),
            AppButtons(
              type: ButtonType.secondaryFillButton,
              title: "Success",
              onPressed: () {
                CustomFloatingNotifications().customNotification(
                  TypeVerification.added,
                );
              },
            ),
            SizedBox(height: AppSpacing.small),
            AppButtons(
              type: ButtonType.secondaryFillButton,
              title: "Fail",
              onPressed: () {
                CustomFloatingNotifications().customNotification(
                  TypeVerification.notAdded,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
