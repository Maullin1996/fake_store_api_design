import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fake_store_api_package/domain/models.dart';

class CartListProvider extends StateNotifier<List<Product>> {
  CartListProvider(super.state);

  void addToCart(Product product) {
    state = [...state, product];
  }

  void removeToCart(Product product) {
    state = [...state]..remove(product);
    print('prodduct remove');
  }
}

final myCartListProvider =
    StateNotifierProvider<CartListProvider, List<Product>>((ref) {
      return CartListProvider([]);
    });
