import 'package:example/presentation/providers/api_response/category_provider.dart';
import 'package:fake_store_design/template/home_tamplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePageScreen extends ConsumerWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productApiResponse = ref.watch(categoryProductsProvider);
    return HomeTamplate(
      isLogIn: false,
      cartonPressed: () {
        context.push('/cart_page');
      },
      logInonPressed: () {
        context.push('/login_page');
      },
      errorMessage: productApiResponse.errorMessage,
      isLoading: productApiResponse.isLoading,
      products: productApiResponse.products,
      myFavoriteList: [],
      myCartList: [],
      selectedCategory: 'All',
      onCategorySelected: (p0) {},
    );
  }
}
