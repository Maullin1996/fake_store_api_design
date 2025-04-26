import 'package:example/config/mock/product_mock.dart';
import 'package:example/config/mock/user_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:example/domain/models.dart';
import 'package:example/presentation/providers/providers.dart';
import 'package:fake_store_design/design_system.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  String selectedCategory = 'All';
  bool userStatus = false;

  void _handleCategorySelection(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void _handleIsFavorite(product) {
    ref.read(myFavoriteListProvider.notifier).toggleFavorite(product);
  }

  void _handleBuyProduct(product) {
    if (ref.read(cartListProvider.notifier).addToCart(product)) {
      CustomFloatingNotifications().customNotification(TypeVerification.added);
    } else {
      CustomFloatingNotifications().customNotification(
        TypeVerification.notAdded,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> myFavoriteList = ref.watch(myFavoriteListProvider);
    final List<Product> myCartList = ref.watch(cartListProvider);
    return HomeTamplate(
      isLogIn: userStatus,
      cartonPressed: () {},
      logInonPressed: () {
        setState(() {
          userStatus = true;
        });
      },
      useronPressed: () {
        context.pop();
      },
      logOutonPressed: () {
        setState(() {
          userStatus = false;
        });
      },
      name: userMock.name.firstname,
      lastName: userMock.name.lastname,
      errorMessage: null,
      isLoading: false,
      products: productMock(true),
      myFavoriteList: myFavoriteList,
      myCartList: myCartList,
      selectedCategory: selectedCategory,
      onCategorySelected: _handleCategorySelection,
      onPressedinfo: (product) {
        context.push('/product_page', extra: product);
      },
      onPressedFavorite: _handleIsFavorite,
      onPressedbuy: _handleBuyProduct,
    );
  }
}
