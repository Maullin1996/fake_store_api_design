import 'package:fake_store_design/template/tamplate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartPageScreen extends StatelessWidget {
  const CartPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CartTemplate(
      authentication: false,
      listCart: [],
      backonPressed: () {
        context.pop();
      },
      logInonPressed: () {
        context.push('/login_page');
      },
    );
  }
}
