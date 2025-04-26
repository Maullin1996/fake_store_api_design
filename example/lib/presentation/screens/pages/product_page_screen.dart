//import 'package:example/presentation/providers/api_response/category_provider.dart';
import 'package:example/config/mock/product_mock.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/product_entity.dart';
import '../../providers/shared/cart_provider.dart';
import '../../providers/shared/favorite_provider.dart';

class ProductPageScreen extends ConsumerWidget {
  final Product? product;
  const ProductPageScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool productsValidation = product == null ? true : false;
    final List<Product> myFavoriteList = ref.watch(myFavoriteListProvider);
    return ProductTemplate(
      isFavorite: myFavoriteList.contains(product),
      url: productsValidation ? productMock(true)[0].image : product!.image,
      description:
          productsValidation
              ? productMock(true)[0].description
              : product!.description,
      productName:
          productsValidation ? productMock(true)[0].title : product!.title,
      productPrice:
          productsValidation
              ? productMock(true)[0].price.toString()
              : product!.price.toString(),
      onPressedFavorite: () {
        ref
            .read(myFavoriteListProvider.notifier)
            .toggleFavorite(productMock(true)[0]);
      },
      backonPressed: () {
        context.pop();
      },
      cartonPressed: () {
        context.push('/cart_page');
      },
      onPressedbuy: () {
        if (ref
            .read(cartListProvider.notifier)
            .addToCart(productMock(true)[0])) {
          CustomFloatingNotifications().customNotification(
            TypeVerification.added,
          );
        } else {
          CustomFloatingNotifications().customNotification(
            TypeVerification.notAdded,
          );
        }
      },
    );
  }
}
