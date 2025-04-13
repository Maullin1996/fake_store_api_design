import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:example/config/mock/product_mock.dart';
import 'package:example/presentation/providers/cart_provider.dart';
import 'package:fake_store_api_package/domain/models/product_entity.dart';
import 'package:fake_store_design/design_system.dart';

import 'package:go_router/go_router.dart';

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
    return CartTemplate(authentication: authentication, listCart: products);
  }
}

class CartTemplate extends StatelessWidget {
  const CartTemplate({
    super.key,
    required this.authentication,
    required this.listCart,
    this.name,
    this.lastName,
    this.backonPressed,
    this.logOutonPressed,
    this.logInonPressed,
    this.onPressedminus,
    this.onPressedplus,
    this.onDialogButtonPressed,
  });

  final bool authentication;
  final String? name;
  final String? lastName;
  final List<Product> listCart;
  final VoidCallback? backonPressed;
  final VoidCallback? logOutonPressed;
  final VoidCallback? logInonPressed;
  final VoidCallback? onPressedminus;
  final VoidCallback? onPressedplus;
  final VoidCallback? onDialogButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          authentication
              ? CustomAppbars(
                appbarType: AppbarType.cartAppbarlogout,
                backonPressed: backonPressed,
                logOutonPressed: logOutonPressed,
                name: name,
                lastName: lastName,
              )
              : CustomAppbars(
                appbarType: AppbarType.cartAppbarlogin,
                backonPressed: backonPressed,
                logInonPressed: logInonPressed,
              ),
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListView.separated(
              itemCount: listCart.length,
              itemBuilder: (BuildContext context, int index) {
                final product = listCart[index];
                return ProductCartContainer(
                  url: product.image,
                  productName: product.title,
                  amount: 'x1',
                  productPrice: product.price.toString(),
                  onPressedminus: onPressedminus,
                  onPressedplus: onPressedplus,
                );
              },
              separatorBuilder:
                  (context, index) => SizedBox(height: AppSpacing.small),
            ),
            Positioned(
              bottom: AppSpacing.small,
              left: 0,
              right: 0,
              child: Center(
                child:
                    authentication
                        ? CustomDialog(
                          dialogType: DialogType.authenticated,
                          onDialogButtonPressed: onDialogButtonPressed,
                        )
                        : CustomDialog(
                          dialogType: DialogType.unauthenticated,
                          onDialogButtonPressed: onDialogButtonPressed,
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
