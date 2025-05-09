import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

enum DialogType { authenticated, unauthenticated }

/// A custom dialog widget that displays a message based on the authentication status.
///
/// This widget displays a dialog with different content and actions depending on whether the user is authenticated or unauthenticated.
class CustomDialog extends StatelessWidget {
  final DialogType
  dialogType; // Type of dialog (authenticated or unauthenticated).
  final VoidCallback?
  onDialogButtonPressed; // Callback for when the dialog button is pressed.
  final String totalToPay; // Total amount to be paid.

  const CustomDialog({
    super.key,
    required this.dialogType, // The type of dialog to display (authenticated or unauthenticated).
    this.onDialogButtonPressed, // Optional callback for the button action.
    this.totalToPay = '', // Optional total amount to pay (default is empty).
  });

  @override
  Widget build(BuildContext context) {
    // Accessing the text theme from the current context for consistent text styling.
    final textTheme = Theme.of(context).textTheme;

    // The button to trigger the dialog.
    return AppButtons(
      type:
          ButtonType
              .secondaryTextButton, // The type of button (filled with secondary color).
      // Button title: If total to pay is 0.00, display 'Add Products', otherwise show the total amount to pay.
      title: totalToPay == "0.00" ? 'Add Products' : 'Go To Pay : $totalToPay',

      // When the button is pressed, the dialog is triggered.
      onPressed: () {
        dialogs(
          context: context,
          textTheme: textTheme,
          dialogType: dialogType,
          onPressed:
              onDialogButtonPressed, // Pass the callback for the dialog button.
        );
      },
    );
  }
}

/// Function to display a dialog with content based on the user's authentication status.
///
/// Displays a dialog with a message, an icon, and a button that can trigger a callback function.
Future<dynamic> dialogs({
  required BuildContext context, // The build context to display the dialog.
  required TextTheme textTheme, // The text theme to apply styles to the text.
  required DialogType
  dialogType, // The type of dialog (authenticated or unauthenticated).
  VoidCallback?
  onPressed, // Callback function when the dialog button is pressed.
}) {
  String alertText; // The alert message to display in the dialog.
  Widget icon; // The icon to display in the dialog.
  String titleTextButton; // The text for the dialog's button.

  // Determine the dialog content based on the dialog type.
  if (dialogType == DialogType.authenticated) {
    alertText = 'Successful Purchase'; // Message for authenticated users.
    icon = Icon(
      AppIcons.check,
      size: 90,
      color: AppColors.secondary,
    ); // Checkmark icon for success.
    titleTextButton =
        'Continue Shopping'; // Button text for authenticated users.
  } else {
    alertText = 'Unauthenticated user'; // Message for unauthenticated users.
    icon = Icon(
      AppIcons.error,
      size: 90,
      color: AppColors.error,
    ); // Error icon for unauthenticated users.
    titleTextButton = 'Log In'; // Button text for unauthenticated users.
  }

  // Show the dialog.
  return showDialog(
    context: context,
    builder:
        (context) => Dialog(
          child: Container(
            padding: EdgeInsets.all(
              AppSpacing.small,
            ), // Padding around the dialog content.
            decoration: BoxDecoration(
              color: AppColors.onPrimary, // Background color for the dialog.
              borderRadius: BorderRadius.circular(
                AppRadius.medium,
              ), // Rounded corners for the dialog.
            ),
            child: Column(
              mainAxisSize:
                  MainAxisSize
                      .min, // Make the dialog as small as possible to fit content.
              children: [
                // Icon with animation.
                TweenAnimationBuilder(
                  duration: const Duration(
                    milliseconds: 1500,
                  ), // Animation duration.
                  tween: Tween<double>(
                    begin: 0.0,
                    end: 720.0,
                  ), // Rotating the icon from 0 to 720 degrees.
                  curve: Curves.easeInOut, // Easing curve for smooth animation.
                  builder: (
                    BuildContext context,
                    dynamic angle,
                    Widget? child,
                  ) {
                    return Transform(
                      alignment:
                          Alignment
                              .center, // Set alignment to center for the rotation.
                      transform:
                          Matrix4.identity()..rotateY(
                            angle * (math.pi / 180),
                          ), // Apply rotation.
                      child: icon, // The rotating icon.
                    );
                  },
                ),
                SizedBox(
                  height: AppSpacing.medium,
                ), // Space between the icon and text.
                Text(
                  alertText,
                  style: textTheme.displayMedium,
                ), // Display the alert text with the correct style.
                SizedBox(
                  height: AppSpacing.small,
                ), // Space between the text and the button.
                AppButtons(
                  type:
                      ButtonType
                          .secondaryTextButton, // Type of button (text button).
                  title: titleTextButton, // Button title.
                  onPressed:
                      onPressed, // Callback function when the button is pressed.
                ),
              ],
            ),
          ),
        ),
  );
}
