import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Defines an abstract class `Icons`
/// representing various icons used in the application.
abstract class AppIcons {
  /// Shopping cart icon.
  static IconData cart = CupertinoIcons.cart;

  /// Plus icon.
  static IconData plus = CupertinoIcons.plus;

  /// minus icon.
  static IconData minus = CupertinoIcons.minus;

  /// Favorite icon with fill (heart).
  static IconData favorite = CupertinoIcons.suit_heart_fill;

  /// Unlike icon (empty heart).
  static IconData unLike = CupertinoIcons.suit_heart;

  /// Star icon with fill (commonly used for ratings).
  static IconData star = CupertinoIcons.star_fill;

  /// Login icon (person inside a circle).
  static IconData user = CupertinoIcons.person_circle;

  static IconData username = CupertinoIcons.person;

  static IconData phone = CupertinoIcons.phone_circle;

  static IconData city = CupertinoIcons.building_2_fill;

  static IconData street = CupertinoIcons.map;

  static IconData direction = CupertinoIcons.number;

  static IconData zipCode = CupertinoIcons.placemark;

  /// Email icon.
  static IconData mail = CupertinoIcons.mail;

  /// Error or warning icon.
  static IconData error = CupertinoIcons.exclamationmark_square;

  /// Credit card icon.
  static IconData creditCart = CupertinoIcons.creditcard;

  /// Check mark icon, often used for confirmation.
  static IconData check = CupertinoIcons.check_mark_circled;

  /// Home or main page icon.
  static IconData home = CupertinoIcons.home;

  /// Logout icon (references the main `Icons` class itself).
  static IconData logout = Icons.logout;

  /// Login icon (references the main `Icons` class itself).
  static IconData login = Icons.login;

  /// Login icon (references the main `Icons` class itself).
  static IconData info = Icons.info_outline;

  /// Login icon (references the main `Icons` class itself).
  static IconData back = Icons.arrow_back_outlined;
}
