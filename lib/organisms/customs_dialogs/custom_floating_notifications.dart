import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum TypeVerification { added, notAdded, errorMessage }

class CustomFloatingNotifications {
  CustomFloatingNotifications({this.errorMessage});
  final String? errorMessage;

  static const Map<TypeVerification, String> _messages = {
    TypeVerification.added: 'Product Add',
    TypeVerification.notAdded: 'Product already add',
  };

  static final Map<TypeVerification, Color> _backgroundColors = {
    TypeVerification.added: AppColors.backGoundFutterToast,
    TypeVerification.notAdded: AppColors.backGoundFutterToastError,
    TypeVerification.errorMessage: AppColors.backGoundFutterToastError,
  };

  static const Map<TypeVerification, Color> _textColors = {
    TypeVerification.added: AppColors.textFutterToast,
    TypeVerification.notAdded: AppColors.textFutterToastError,
    TypeVerification.errorMessage: AppColors.textFutterToastError,
  };

  void productVerification(TypeVerification type) {
    _showToast(type);
  }

  void _showToast(TypeVerification type) {
    String message;
    if (type == TypeVerification.errorMessage && errorMessage != null) {
      message = errorMessage!;
    } else {
      message = _messages[type]!;
    }
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: _backgroundColors[type]!,
      textColor: _textColors[type]!,
      timeInSecForIosWeb: 1,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
