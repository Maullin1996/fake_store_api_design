import 'package:fake_store_api_package/domain/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteListProvider extends StateNotifier<List<Product>> {
  FavoriteListProvider(super.state);

  void addToFavorite(Product product) {
    state = [...state, product];
    print('add');
  }

  void removeToFavorite(Product product) {
    state = [...state]..remove(product);
    print('remove');
  }
}

final myFavoriteListProvider =
    StateNotifierProvider<FavoriteListProvider, List<Product>>((ref) {
      return FavoriteListProvider([]);
    });
