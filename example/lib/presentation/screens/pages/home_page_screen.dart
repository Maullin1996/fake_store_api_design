import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:example/domain/models.dart';
import 'package:example/presentation/helpers/category_selected.dart';
import 'package:example/presentation/providers/providers.dart';
import 'package:fake_store_design/design_system.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
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
    ref.read(myFavoriteListProvider.notifier).toggleFavorite(product);
  }

  void _handleBuyProduct(product) {
    if (ref.read(cartListProvider.notifier).addToCart(product)) {
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
    final List<Product> myCartList = ref.watch(cartListProvider);
    final authenticationState = ref.watch(authenticationProvider);
    final userProvider = ref.watch(userInfoProvider);
    final userInfo = userProvider.user;
    return HomeTamplate(
      isLogIn: authenticationState.token.isEmpty,
      cartonPressed: () {
        context.push('/cart_page');
      },
      logInonPressed: () {
        context.push('/login_page');
      },
      useronPressed: () {
        context.push('/user_page');
      },
      logOutonPressed: () {
        ref.read(authenticationProvider.notifier).logOutUser();
        ref.read(userInfoProvider.notifier).logOutUser();
      },
      name: userInfo == null ? '' : userInfo.name.firstname,
      lastName: userInfo == null ? '' : userInfo.name.lastname,
      errorMessage: productApiResponse.errorMessage,
      isLoading: productApiResponse.isLoading,
      products: productApiResponse.products,
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
