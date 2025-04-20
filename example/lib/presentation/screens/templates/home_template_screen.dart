//import 'package:example/config/mock/product_mock.dart';
import 'package:example/domain/models/product_entity.dart';
import 'package:example/presentation/helpers/category_selected.dart';
import 'package:example/presentation/providers/shared/cart_provider.dart';
import 'package:example/presentation/providers/api_response/category_provider.dart';

import 'package:example/presentation/providers/shared/favorite_provider.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTemplateScreen extends ConsumerStatefulWidget {
  const HomeTemplateScreen({super.key});

  @override
  ConsumerState<HomeTemplateScreen> createState() => _HomeTemplateScreenState();
}

class _HomeTemplateScreenState extends ConsumerState<HomeTemplateScreen> {
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(categoryProductsProvider.notifier).fetchAllProducts();
    });
  }

  void _handleCategorySelection(String category) {
    setState(() {
      selectedCategory = category;
    });
    final notifier = ref.read(categoryProductsProvider.notifier);
    if (category == 'All') {
      notifier.fetchAllProducts();
    } else {
      notifier.fetchByCategory(categorySelected(category));
    }
  }

  void _handleIsFavorite(product) {
    final isAlreadyFavorite = ref
        .read(myFavoriteListProvider)
        .contains(product);
    final notifier = ref.read(myFavoriteListProvider.notifier);
    if (isAlreadyFavorite) {
      notifier.removeToFavorite(product);
    } else {
      notifier.addToFavorite(product);
    }
  }

  void _handleBuyProduct(product) {
    final myCartList = ref.read(cartListProvider);
    final notifier = ref.read(cartListProvider.notifier);
    if (!myCartList.contains(product)) {
      notifier.addToCart(product);
      CustomFloatingNotifications().productVerification(TypeVerification.added);
    } else {
      CustomFloatingNotifications().productVerification(
        TypeVerification.notAdded,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final productApiResponse = ref.watch(categoryProductsProvider);
    final List<Product> myFavoriteList = ref.watch(myFavoriteListProvider);
    // final List<BaseProduct> myFavoriteListUi =
    //     myFavoriteList.map((product) => ProductAdapter(product)).toList();
    final List<Product> myCartList = ref.watch(cartListProvider);
    // final List<BaseProduct> myCartListUi =
    //     myCartList.map((product) => ProductAdapter(product)).toList();

    return HomeTamplate(
      isLogIn: false,
      name: 'Pepito',
      lastName: 'Perez',
      isLoading: productApiResponse.isLoading,
      errorMessage: productApiResponse.errorMessage,
      products: productApiResponse.products,
      myFavoriteList: myFavoriteList,
      myCartList: myCartList,
      selectedCategory: selectedCategory,
      cartonPressed: () {},
      logInonPressed: () {
        Navigator.of(context).pop();
      },
      logOutonPressed: () {},
      useronPressed: () {
        Navigator.of(context).pop();
      },
      onPressedFavorite: _handleIsFavorite,
      onPressedinfo: (product) {},
      onPressedbuy: _handleBuyProduct,
      onCategorySelected: _handleCategorySelection,
    );
  }
}
