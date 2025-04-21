import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';

/// A widget representing the login screen of the application.
///
/// This screen displays a login form where users can enter their credentials
/// (username and password), and provides actions for submitting the form and
/// navigating to other parts of the app (such as the cart).
///
/// It handles the display of a loading state on the login button while
/// the login process is in progress.
class LoginTemplate extends StatelessWidget {
  /// A flag indicating whether the login button is in a loading state.
  final bool? isLoadingButton;

  /// The callback function for when the cart button is pressed.
  final VoidCallback? cartonPressed;

  /// The callback function for when the back button is pressed.
  final VoidCallback? backonPressed;

  /// The callback function for when the login button is pressed.
  final VoidCallback? onPressed;

  /// The callback function to handle changes to the password field.
  final Function(String)? onChangePassword;

  /// The callback function to handle changes to the username field.
  final Function(String)? onChangeUsername;

  /// A controller for the username input field.
  final TextEditingController? usernameController;

  /// A controller for the password input field.
  final TextEditingController? passwordController;

  /// A validator function for the password field.
  final String? Function(String?)? validatorPassword;

  /// A validator function for the username field.
  final String? Function(String?)? validatorUsername;

  /// Creates an instance of [LoginTemplate].
  ///
  /// This widget represents the login screen where users can input their
  /// credentials and submit the form to log in. It also supports actions like
  /// navigating back, managing loading states, and validating user input.
  const LoginTemplate({
    super.key,
    this.cartonPressed,
    this.backonPressed,
    this.onPressed,
    this.onChangePassword,
    this.onChangeUsername,
    this.usernameController,
    this.passwordController,
    this.validatorPassword,
    this.validatorUsername,
    this.isLoadingButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The app bar for the login screen with custom actions
      appBar: CustomAppbars(
        appbarType: AppbarType.logInAppbar, // Type for the login screen app bar
        cartonPressed: cartonPressed, // Action for cart button press
        backonPressed: backonPressed, // Action for back button press
      ),
      backgroundColor:
          AppColors.secondary, // Background color for the login screen
      body: SingleChildScrollView(
        child: Column(
          children: [
            // A widget welcoming the user to the authentication process
            AuthenticationWelcome(),

            // The login form where users input their credentials
            LoginForm(
              isLoadingButton:
                  isLoadingButton, // Indicates if the button is in loading state
              onPressed:
                  onPressed, // The action triggered when the login button is pressed
              onChangePassword:
                  onChangePassword, // The action triggered when the password is changed
              passwordController:
                  passwordController, // Controller for password input field
              onChangeUsername:
                  onChangeUsername, // The action triggered when the username is changed
              usernameController:
                  usernameController, // Controller for username input field
              validatorPassword:
                  validatorPassword, // Validator for the password field
              validatorUsername:
                  validatorUsername, // Validator for the username field
            ),
          ],
        ),
      ),
    );
  }
}
