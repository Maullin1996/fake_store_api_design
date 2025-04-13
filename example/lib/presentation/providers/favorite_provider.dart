import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fake_store_api_package/domain/models.dart';

class FavoriteListProvider extends StateNotifier<List<Product>> {
  FavoriteListProvider(super.state);

  void addToFavorite(Product product) {
    state = [...state, product];
  }

  void removeToFavorite(Product product) {
    state = [...state]..remove(product);
  }
}

final myFavoriteListProvider =
    StateNotifierProvider<FavoriteListProvider, List<Product>>((ref) {
      return FavoriteListProvider([]);
    });
