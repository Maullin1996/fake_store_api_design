//import 'package:example/presentation/providers/api_response/category_provider.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/product_entity.dart';
import '../../providers/shared/cart_provider.dart';
import '../../providers/shared/favorite_provider.dart';

class ProductPageScreen extends ConsumerWidget {
  final Product product;
  const ProductPageScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> myFavoriteList = ref.watch(myFavoriteListProvider);
    return ProductTemplate(
      isFavorite: myFavoriteList.contains(product),
      url: product.image,
      description: product.description,
      productName: product.title,
      productPrice: product.price.toString(),
      onPressedFavorite: () {
        ref.read(myFavoriteListProvider.notifier).toggleFavorite(product);
      },
      backonPressed: () {
        context.pop();
      },
      cartonPressed: () {
        context.push('/cart_page');
      },
      onPressedbuy: () {
        if (ref.read(cartListProvider.notifier).addToCart(product)) {
          CustomFloatingNotifications().productVerification(
            TypeVerification.added,
          );
        } else {
          CustomFloatingNotifications().productVerification(
            TypeVerification.notAdded,
          );
        }
      },
    );
  }
}
