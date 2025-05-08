import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:example/config/mock/product_mock.dart';
import 'package:example/domain/models/product_entity.dart';

import 'package:example/presentation/providers/shared/favorite_provider.dart';
import 'package:fake_store_design/design_system.dart';

class HomeTemplateScreen extends ConsumerStatefulWidget {
  const HomeTemplateScreen({super.key});

  @override
  ConsumerState<HomeTemplateScreen> createState() => _HomeTemplateScreenState();
}

class _HomeTemplateScreenState extends ConsumerState<HomeTemplateScreen> {
  String selectedCategory = 'All';

  final List<String> categories = [
    'All', // Display all categories.
    "electronics", // Category for electronics.
    "jewelery", // Category for jewelery.
    "men's clothing", // Category for men's clothing.
    "women's clothing", // Category for women's clothing.
  ];

  void _handleCategorySelection(String category) {
    setState(() {
      selectedCategory = category;
    });
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

  @override
  Widget build(BuildContext context) {
    final List<Product> myFavoriteList = ref.watch(myFavoriteListProvider);

    return HomeTamplate(
      address: 'CRA 88A # 55W - 44 Sur Medellin',
      email: 'allstorehouse@correo.com',
      instagram: 'all.storehouse',
      whatsapp: '(+57) 3354425145',
      categories: categories,
      isLogIn: false,
      name: 'Pepito',
      lastName: 'Perez',
      isLoading: false,
      errorMessage: null,
      products: productMock(false),
      myFavoriteList: myFavoriteList,
      myCartList: productMock(false),
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
      onPressedbuy: (product) {},
      onCategorySelected: _handleCategorySelection,
      onItemSelected: (String selectedItem) {},
    );
  }
}
