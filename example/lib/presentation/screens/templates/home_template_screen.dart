//import 'package:example/config/mock/product_mock.dart';
import 'package:example/presentation/helpers/category_selected.dart';
import 'package:example/presentation/providers/cart_provider.dart';
import 'package:example/presentation/providers/category_provider.dart';

import 'package:example/presentation/providers/favorite_provider.dart';
import 'package:fake_store_api_package/domain/models/product_entity.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTemplateScreen extends ConsumerStatefulWidget {
  const HomeTemplateScreen({super.key});

  @override
  ConsumerState<HomeTemplateScreen> createState() => _HomeTemplateScreenState();
}

class _HomeTemplateScreenState extends ConsumerState<HomeTemplateScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(categoryProductsProvider.notifier).fetchAllProducts();
    });
  }

  String selectedCategory = 'All';
  void _handleCategorySelection(String category) {
    setState(() {
      selectedCategory = category;
    });
    final notifier = ref.read(categoryProductsProvider.notifier);
    if (selectedCategory == 'All') {
      notifier.fetchAllProducts();
    } else {
      notifier.fetchByCategory(categorySelected(selectedCategory));
    }
  }

  void _handleIsFvaorite(Product product, List<Product> myFavoriteList) {
    final isAlreadyFavorite = myFavoriteList.contains(product);
    if (isAlreadyFavorite) {
      ref.read(myFavoriteListProvider.notifier).removeToFavorite(product);
    } else {
      ref.read(myFavoriteListProvider.notifier).addToFavorite(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    final productApiResponse = ref.watch(categoryProductsProvider);
    final List<Product> myFavoriteList = ref.watch(myFavoriteListProvider);
    final List<Product> myCartList = ref.watch(myCartListProvider);
    return Scaffold(
      appBar: CustomAppbars(
        appbarType: AppbarType.homeLogInAppbar,
        logInonPressed: () {},
        cartonPressed: () {},
      ),
      body: _buildBody(
        productApiResponse: productApiResponse,
        myFavoriteList: myFavoriteList,
        myCartList: myCartList,
      ),
    );
  }

  Widget _buildBody({
    required List<Product> myFavoriteList,
    required ProductApiResponse productApiResponse,
    required List<Product> myCartList,
  }) {
    final textTheme = Theme.of(context).textTheme;
    if (productApiResponse.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (productApiResponse.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error: ${productApiResponse.errorMessage}',
              style: textTheme.bodyMedium?.copyWith(color: AppColors.error),
            ),
          ],
        ),
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          ListCategory(
            selectedCategory: selectedCategory,
            onCategorySelected: _handleCategorySelection,
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 0.47,
            ),
            itemCount: productApiResponse.products.length,
            itemBuilder: (BuildContext context, int index) {
              final product = productApiResponse.products[index];
              return ProducthomeContainer(
                url: product.image,
                productName: product.title,
                productCategory: product.category,
                productPrice: product.price.toString(),
                isFavorite: myFavoriteList.contains(product),
                onPressedFavorite: () {
                  _handleIsFvaorite(product, myFavoriteList);
                },
                onPressedbuy: () {
                  if (!myCartList.contains(product)) {
                    ref.read(myCartListProvider.notifier).addToCart(product);
                    CustomProductVerification().productVerification(
                      TypeProductVerification.added,
                    );
                  } else {
                    CustomProductVerification().productVerification(
                      TypeProductVerification.notAdded,
                    );
                  }
                },
                onPressedinfo: () {},
              );
            },
          ),
          SizedBox(height: AppSpacing.small),
        ],
      ),
    );
  }
}
