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
    final List<Product> myCartList = ref.watch(myCartListProvider);
    return CartTemplate(
      authentication: false,
      listCart: myCartList,
      backonPressed: () {
        context.pop();
      },
      logInonPressed: () {
        context.push('/login_page');
      },
      onPressedplus: () {},
      onPressedminus: () {},
    );
  }
}
