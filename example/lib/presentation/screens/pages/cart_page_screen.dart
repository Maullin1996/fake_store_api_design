import 'package:example/config/mock/user_mock.dart';
import 'package:example/domain/models/product_entity.dart';
import 'package:example/presentation/providers/providers.dart';
import 'package:fake_store_design/template/tamplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartPageScreen extends ConsumerStatefulWidget {
  const CartPageScreen({super.key});

  @override
  ConsumerState<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends ConsumerState<CartPageScreen> {
  bool userStatus = false;
  @override
  Widget build(BuildContext context) {
    final List<Product> cartList = ref.watch(cartListProvider);
    return CartTemplate(
      assetsImage: 'assets/images/error.png',
      onDialogButtonPressed: () {
        if (userStatus) {
          ref.read(cartListProvider.notifier).emptyCart();
          context.pop();
        } else {
          setState(() {
            userStatus = true;
          });
          context.pop();
        }
      },
      logOutonPressed: () {
        setState(() {
          userStatus = false;
        });
      },
      lastName: userMock.name.lastname,
      name: userMock.name.firstname,
      authentication: userStatus,
      listCart: cartList,
      totalToPay: ref
          .read(cartListProvider.notifier)
          .totalToPay
          .toStringAsFixed(2),
      backonPressed: () {
        context.pop();
      },
      logInonPressed: () {
        setState(() {
          userStatus = true;
        });
      },
      onPressedplus:
          (product) =>
              ref.read(cartListProvider.notifier).increaseQuantity(product),
      onPressedminus:
          (product) =>
              ref.read(cartListProvider.notifier).decreaseQuantity(product),
    );
  }
}
