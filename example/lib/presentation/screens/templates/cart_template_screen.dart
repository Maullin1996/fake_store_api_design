import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:example/config/mock/product_mock.dart';

class CartTemplateScreen extends StatefulWidget {
  const CartTemplateScreen({super.key});

  @override
  State<CartTemplateScreen> createState() => _CartTemplateScreenState();
}

class _CartTemplateScreenState extends State<CartTemplateScreen> {
  bool authentication = false;
  void _handleAuthentication() {
    setState(() {
      authentication = !authentication;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CartTemplate(
      authentication: authentication,
      listCart: products,
      backonPressed: () {
        Navigator.of(context).pop();
      },
      logInonPressed: () {
        _handleAuthentication;
      },
      logOutonPressed: () {
        _handleAuthentication;
      },
      name: 'Pepito',
      lastName: 'Perez',
      onPressedplus: () {},
      onDialogButtonPressed: () {},
      onPressedminus: () {},
    );
  }
}
