import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';

/// A widget representing a login form.
///
/// This form allows users to input their username and password to log in.
/// It includes validation, custom input fields, and a button that shows a loading state.
class LoginForm extends StatelessWidget {
  //final String loginTitle;
  //final String subtitle;
  // final String labelUsername;
  // final String labelPassword;
  //final String titleButtonLogin;
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
    this.isLoadingButton = false,
    this.iconOnPressed,
    required this.obscureText,
    //required this.loginTitle,
    //required this.subtitle,
    // required this.labelUsername,
    // required this.labelPassword,
    //required this.titleButtonLogin,
  });

  @override
  Widget build(BuildContext context) {
    // Accessing the text theme of the current context for styling the text.
    final textTheme = Theme.of(context).textTheme;
    final loginSemantics = SemanticsConfig.instance.data.inputTextSemantics;

    // Returning the form widget.
    return Container(
      // Applying padding around the form.
      padding: EdgeInsets.only(
        left: AppSpacing.medium,
        right: AppSpacing.medium,
        bottom: AppSpacing.medium,
      ),

      // Setting the width of the container to match the screen width.
      width: MediaQuery.sizeOf(context).width,

      child: Center(
        child: Column(
          // Aligning the contents of the column to the start of the cross axis (left).
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            // Title for the login form.
            Text(Copys.loginTitle, style: textTheme.displayLarge),

            SizedBox(height: AppSpacing.small),

            // Subtittle for the login form.
            Text(Copys.loginSubtitle, style: textTheme.bodyLarge),

            // Adding some vertical spacing between elements.
            SizedBox(height: AppSpacing.medium),

            // Username input field.
            AppInputText(
              key: Key("username"),
              label: Copys.loginLabelUsername, // Label text for the field.
              semanticText: loginSemantics[0].label, // Semantics text
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
              key: Key("password"),
              label:
                  Copys
                      .loginLabelPassword, // Label text for the password field.
              semanticText: loginSemantics[1].label, // Semantics text
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
                key: Key("Icon button"),
                onPressed: iconOnPressed,
                icon: Icon(
                  semanticLabel: loginSemantics[2].label, // Semantics text
                  obscureText
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_rounded,
                  size: 20,
                ),
              ),
            ),
            SizedBox(height: AppSpacing.small),
            // Centering the login button.
            AppButtons(
              key: Key("enter button"),
              fontSizeTextButton: AppTypography.h1,
              type:
                  ButtonType
                      .secondaryTextButton, // Type of button (filled button).
              title:
                  Copys
                      .loginTitleButtonLogin, // Text to be displayed on the button.
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
