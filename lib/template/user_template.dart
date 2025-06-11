import 'package:flutter/material.dart';

import '../atoms/tokens.dart';
import '../molecules/molecules.dart';

/// A widget representing the user profile screen.
///
/// This screen displays the user's profile information, such as their name,
/// email, phone number, and address details. It also provides the ability to
/// log out, navigate back, or view the cart through custom app bar buttons.
class UserTemplate extends StatelessWidget {
  /// The callback function for when the back button is pressed.
  final VoidCallback? backonPressed;

  /// The callback function for when the cart button is pressed.
  final VoidCallback? cartonPressed;

  /// The callback function for when the log out button is pressed.
  final VoidCallback? logOutonPressed;

  /// The user's last name.
  final String lastName;

  /// The user's first name.
  final String name;

  /// The user's username.
  final String username;

  /// The user's email address.
  final String email;

  /// The user's phone number.
  final String phone;

  /// The user's city of residence.
  final String city;

  /// The user's street address.
  final String street;

  /// The user's street number.
  final String number;

  /// The user's postal code.
  final String zipcode;

  /// Creates an instance of [UserTemplate].
  ///
  /// This widget represents a user profile screen where personal information
  /// like the user's name, email, phone, and address is displayed, along with
  /// actions to log out, navigate back, or view the cart.
  const UserTemplate({
    super.key,
    this.backonPressed,
    this.cartonPressed,
    this.logOutonPressed,
    required this.lastName,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The app bar for the user profile screen with custom actions
      appBar: CustomAppbars(
        appbarType: AppbarType.userAppbar, // Type for the user profile app bar
        backonPressed: backonPressed, // Action for the back button press
        cartonPressed: cartonPressed, // Action for the cart button press
        logOutonPressed: logOutonPressed, // Action for the log out button press
        lastName: lastName, // The user's last name
        name: name, // The user's first name
      ),
      // The main body of the screen displaying the user's profile
      backgroundColor: AppColors.onPrimary, // Background color for the screen
      body: SingleChildScrollView(
        child: MergeSemantics(
          child: Column(
            children: [
              // Displays the user's profile icon
              IconUserHolder(),
              // Displays the user's personal information
              InfoUserHolder(
                username: username, // The user's username
                email: email, // The user's email address
                phone: phone, // The user's phone number
                city: city, // The user's city
                street: street, // The user's street
                number: number, // The user's street number
                zipcode: zipcode, // The user's postal code
              ),
            ],
          ),
        ),
      ),
    );
  }
}
