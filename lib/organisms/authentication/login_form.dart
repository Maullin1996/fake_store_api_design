import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

/// A widget representing a login form.
///
/// This form allows users to input their username and password to log in.
/// It includes validation, custom input fields, and a button that shows a loading state.
class LoginForm extends StatelessWidget {
  final bool? isLoadingButton;
  final Function()? onPressed;
  final Function()? iconOnPressed;
  final Function(String)? onChangeUsername;
  final String? Function(String?)? validatorUsername;
  final TextEditingController? usernameController;
  final Function(String)? onChangePassword;
  final String? Function(String?)? validatorPassword;
  final TextEditingController? passwordController;
  final bool obscureText;

  const LoginForm({
    super.key,
    this.onPressed,
    this.onChangeUsername,
    this.validatorUsername,
    this.usernameController,
    this.onChangePassword,
    this.validatorPassword,
    this.passwordController,
    this.isLoadingButton,
    this.iconOnPressed,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    // Accessing the text theme of the current context for styling the text.
    final textTheme = Theme.of(context).textTheme;

    // Returning the form widget.
    return Container(
      // Applying padding around the form.
      padding: EdgeInsets.all(AppSpacing.medium),

      // Setting the width of the container to match the screen width.
      width: MediaQuery.sizeOf(context).width,

      // Setting the background color for the form container.
      color: AppColors.secondary,

      child: Center(
        child: Column(
          // Aligning the contents of the column to the start of the cross axis (left).
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            // Title for the login form.
            Text('Log in', style: textTheme.displayLarge),

            // Adding some vertical spacing between elements.
            SizedBox(height: AppSpacing.medium),

            // Username input field.
            AppInputText(
              label: 'Username', // Label text for the field.
              floatingLabelBehavior: false, // Making the label always visible.
              onChange:
                  onChangeUsername, // Function to handle changes in the username field.
              validator:
                  validatorUsername, // Validation function for the username.
              textEditingController:
                  usernameController, // Controller for managing username input.
            ),

            // Vertical space between the username and password fields.
            SizedBox(height: AppSpacing.medium),

            // Password input field.
            AppInputText(
              label: 'Password', // Label text for the password field.
              floatingLabelBehavior: false, // Making the label always visible.
              obscureText:
                  obscureText, // Ensuring the password is hidden when typed.
              onChange:
                  onChangePassword, // Function to handle changes in the password field.
              validator:
                  validatorPassword, // Validation function for the password.
              textEditingController:
                  passwordController, // Controller for managing password input.
              suffixIcon: IconButton(
                onPressed: iconOnPressed,
                icon: Icon(
                  obscureText
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_rounded,
                  size: 20,
                ),
              ),
            ),
            SizedBox(height: AppSpacing.medium),
            // Centering the login button.
            AppButtons(
              type:
                  ButtonType
                      .primaryFillButton, // Type of button (filled button).
              title: 'Login', // Text to be displayed on the button.
              isLoading:
                  isLoadingButton, // Shows a loading indicator when true.
              onPressed:
                  onPressed, // Callback function when the button is pressed.
              buttonWidth: AppSpacing.large, // Setting the width of the button.
            ),
          ],
        ),
      ),
    );
  }
}
