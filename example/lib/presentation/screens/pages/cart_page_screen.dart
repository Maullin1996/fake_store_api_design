import 'package:example/domain/models/product_entity.dart';
import 'package:example/presentation/providers/providers.dart';
import 'package:fake_store_design/template/tamplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartPageScreen extends ConsumerWidget {
  const CartPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> cartList = ref.watch(cartListProvider);
    final String token = ref.watch(authenticationProvider).token;
    final user = ref.watch(userInfoProvider).user;
    return CartTemplate(
      onDialogButtonPressed: () {
        if (token.isEmpty) {
          context.pop();
          context.push('/login_page');
        } else {
          ref.read(cartListProvider.notifier).emptyCart();
          context.push('/home_page');
        }
      },
      logOutonPressed: () {
        ref.read(authenticationProvider.notifier).logOutUser();
        ref.read(userInfoProvider.notifier).logOutUser();
      },
      lastName: user == null ? '' : user.name.lastname,
      name: user == null ? '' : user.name.firstname,
      authentication: token.isNotEmpty,
      listCart: cartList,
      totalToPay: ref
          .read(cartListProvider.notifier)
          .totalToPay
          .toStringAsFixed(2),
      backonPressed: () {
        context.pop();
      },
      logInonPressed: () {
        context.push('/login_page');
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
