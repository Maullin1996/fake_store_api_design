import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Enum to define the verification types for product actions.
///
/// It has three states:
/// - [added]: Product was successfully added.
/// - [notAdded]: Product was already added.
/// - [errorMessage]: Custom error message.

enum TypeVerification {
  added, // The product was added successfully.
  notAdded, // The product was already added.
  errorMessage, // A custom error message.
}

/// A utility class to show floating notifications (toast messages) for product verification.
///
/// This class provides a method to display a floating toast message with different content, background,
/// and text colors based on the product verification status (added, not added, or error).
class CustomFloatingNotifications {
  /// Constructor to initialize the class with an optional error message.
  ///
  /// If provided, the error message can be displayed in case of a custom error.
  CustomFloatingNotifications({this.errorMessage});

  // Optional error message to be used when TypeVerification.errorMessage is triggered.
  final String? errorMessage;

  /// A map that associates a verification type with a predefined message.
  static const Map<TypeVerification, String> _messages = {
    TypeVerification.added:
        'Product Add', // Message for when a product is added successfully.
    TypeVerification.notAdded:
        'Product already add', // Message for when the product is already added.
  };

  /// A map that associates a verification type with a background color for the toast.
  static final Map<TypeVerification, Color> _backgroundColors = {
    TypeVerification.added:
        AppColors
            .backgroundFlutterToast, // Background color for a successful product addition.
    TypeVerification.notAdded:
        AppColors
            .backgroundFlutterToastError, // Background color for error when product is already added.
    TypeVerification.errorMessage:
        AppColors
            .backgroundFlutterToastError, // Background color for a custom error message.
  };

  /// A map that associates a verification type with a text color for the toast.
  static const Map<TypeVerification, Color> _textColors = {
    TypeVerification.added:
        AppColors
            .textFlutterToast, // Text color for a successful product addition.
    TypeVerification.notAdded:
        AppColors
            .textFlutterToastError, // Text color for error when product is already added.
    TypeVerification.errorMessage:
        AppColors
            .textFlutterToastError, // Text color for a custom error message.
  };

  /// A method to trigger the toast notification based on the verification status.
  ///
  /// The toast message, background color, and text color are determined by the type of verification.
  void productVerification(TypeVerification type) {
    _showToast(type);
  }

  /// A private helper method to show the toast message with the appropriate content and style.
  ///
  /// This method is responsible for displaying the toast message with the correct styling
  /// based on the verification type and optional error message.
  void _showToast(TypeVerification type) {
    String message;

    // If the type is errorMessage and an errorMessage is provided, use it; otherwise, use the predefined messages.
    if (type == TypeVerification.errorMessage && errorMessage != null) {
      message = errorMessage!; // Use the custom error message.
    } else {
      message =
          _messages[type]!; // Use the predefined message based on the verification type.
    }

    // Show the toast message with the appropriate style.
    Fluttertoast.showToast(
      msg: message, // The message to display in the toast.
      backgroundColor:
          _backgroundColors[type]!, // The background color based on the verification type.
      textColor:
          _textColors[type]!, // The text color based on the verification type.
      timeInSecForIosWeb:
          1, // Duration for which the toast will be shown on iOS/Web.
      gravity:
          ToastGravity
              .CENTER, // The position where the toast will appear (center of the screen).
      toastLength:
          Toast.LENGTH_SHORT, // The length of time the toast will appear.
    );
  }
}
