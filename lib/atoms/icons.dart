import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Defines a central place to access commonly used icons across the app.
///
/// Follows the atomic design principle, keeping UI elements decoupled
/// and easily reusable.
abstract class AppIcons {
  /// Icon representing a shopping cart.
  static const IconData cart = CupertinoIcons.cart;

  /// Icon representing a "plus" or "add" action.
  static const IconData plus = CupertinoIcons.plus;

  /// Icon representing a "minus" or "remove" action.
  static const IconData minus = CupertinoIcons.minus;

  /// Filled heart icon, usually used for "favorite" states.
  static const IconData favorite = CupertinoIcons.suit_heart_fill;

  /// Outline heart icon, usually used for "unliked" states.
  static const IconData unLike = CupertinoIcons.suit_heart;

  /// Filled star icon, often used for ratings.
  static const IconData star = CupertinoIcons.star_fill;

  /// Circle icon representing a user avatar.
  static const IconData user = CupertinoIcons.person_circle;

  /// Icon used for username or person fields.
  static const IconData username = CupertinoIcons.person;

  /// Icon used for phone input fields.
  static const IconData phone = CupertinoIcons.phone_circle;

  /// Icon representing a building (city selector).
  static const IconData city = CupertinoIcons.building_2_fill;

  /// Icon for street or map location input.
  static const IconData street = CupertinoIcons.map;

  /// Icon used for house/apartment number.
  static const IconData direction = CupertinoIcons.number;

  /// Icon representing a zip/postal code input.
  static const IconData zipCode = CupertinoIcons.placemark;

  /// Mail or email input icon.
  static const IconData mail = CupertinoIcons.mail;

  /// Error indication icon.
  static const IconData error = CupertinoIcons.exclamationmark_square;

  /// Credit card icon, used in payment UIs.
  static const IconData creditCart = CupertinoIcons.creditcard;

  /// Icon used to show a successful action or check.
  static const IconData check = CupertinoIcons.check_mark_circled;

  /// Home icon.
  static const IconData home = CupertinoIcons.home;

  /// Icon representing logout actions.
  static const IconData logout = Icons.logout;

  /// Icon representing login actions.
  static const IconData login = Icons.login;

  /// Info icon, often used in dialogs or tooltips.
  static const IconData info = Icons.info_outline;

  /// Icon used for navigation back actions.
  static const IconData back = Icons.arrow_back_outlined;

  /// Icon used for whatsapp number.
  static const IconData whatsapp = FontAwesomeIcons.whatsapp;

  /// Icon used for Instagram name.
  static const IconData instagram = FontAwesomeIcons.instagram;
}
