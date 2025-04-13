import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum TypeProductVerification { added, notAdded }

class CustomProductVerification {
  // Mensajes constantes para evitar instancias repetidas.
  static const Map<TypeProductVerification, String> _messages = {
    TypeProductVerification.added: 'Product Add',
    TypeProductVerification.notAdded: 'Product already add',
  };

  // Colores de notificación definidos según el estado del producto.
  static final Map<TypeProductVerification, Color> _backgroundColors = {
    TypeProductVerification.added: AppColors.backGoundFutterToast,
    TypeProductVerification.notAdded: AppColors.backGoundFutterToastError,
  };

  static const Map<TypeProductVerification, Color> _textColors = {
    TypeProductVerification.added: AppColors.textFutterToast,
    TypeProductVerification.notAdded: AppColors.textFutterToastError,
  };

  void productVerification(TypeProductVerification type) {
    _showToast(type);
  }

  void _showToast(TypeProductVerification type) {
    Fluttertoast.showToast(
      msg: _messages[type]!,
      backgroundColor: _backgroundColors[type]!,
      textColor: _textColors[type]!,
      timeInSecForIosWeb: 1,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
