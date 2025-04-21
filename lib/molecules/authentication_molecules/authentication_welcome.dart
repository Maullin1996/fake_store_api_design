import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

/// A widget that displays a welcome message for authentication.
///
/// This widget is shown when the user is directed to the welcome screen
/// during authentication. It consists of a greeting message and the app's
/// welcome text styled with the theme.
class AuthenticationWelcome extends StatelessWidget {
  const AuthenticationWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the text theme of the current context to apply consistent styling.
    final textTheme = Theme.of(context).textTheme;

    return Container(
      // The width of the container spans the entire width of the screen.
      width: MediaQuery.sizeOf(context).width,

      // Set the background color for the container to the primary color.
      color: AppColors.onPrimary,

      // Apply padding to the container to ensure there is spacing around the content.
      padding: EdgeInsets.fromLTRB(
        AppSpacing.medium, // Left padding is medium
        AppSpacing.large, // Top padding is large
        AppSpacing.small, // Right padding is small
        AppSpacing.small, // Bottom padding is small
      ),
      child: Column(
        // Align the children vertically at the start of the container.
        mainAxisAlignment: MainAxisAlignment.start,

        // Align the children horizontally to the start (left side) of the container.
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // Display the 'Hello!' greeting with a large display text style.
          Text('Hello!', style: textTheme.displayLarge),

          // Add some spacing between the texts.
          SizedBox(height: AppSpacing.small),

          // Display the welcome message styled with a smaller display text.
          Text('Welcome to Fake App Store', style: textTheme.displaySmall),
        ],
      ),
    );
  }
}
