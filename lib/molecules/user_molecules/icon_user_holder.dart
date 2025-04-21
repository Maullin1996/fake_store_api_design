import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

/// A widget that displays a user icon in a container.
///
/// This widget shows a user icon, typically used in profile or user-related screens.
/// The icon is centered within the container, with a top padding and a specified size.
class IconUserHolder extends StatelessWidget {
  const IconUserHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding is applied to the top to provide spacing from the top edge.
      padding: EdgeInsets.only(top: AppSpacing.small),

      // Set the width of the container to match the screen width.
      width: MediaQuery.sizeOf(context).width,

      // The container's background color is set to [AppColors.onPrimary].
      color: AppColors.onPrimary,

      child: Column(
        children: [
          // Display the user icon with a size of 100.
          Icon(AppIcons.user, size: 100),

          // Add spacing below the icon for proper layout.
          SizedBox(height: AppSpacing.medium),
        ],
      ),
    );
  }
}
