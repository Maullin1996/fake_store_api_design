import 'package:collection/collection.dart';
import 'package:example/domain/models.dart';
import 'package:example/infraestructure/helppers/products/product_mapper.dart';
import 'package:fake_store_api_package/methods/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductApiResponse {
  final bool isLoading;
  final String? errorMessage;
  final String category;
  final List<Product> products;
  final Product? product;

  ProductApiResponse({
    this.isLoading = false,
    this.errorMessage,
    this.category = 'All',
    this.products = const [],
    this.product,
  });

  ProductApiResponse copyWith({
    Product? product,
    bool? isLoading,
    String? errorMessage,
    String? category,
    List<Product>? products,
  }) {
    return ProductApiResponse(
      product: product ?? this.product,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      category: category ?? this.category,
      products: products ?? this.products,
    );
  }
}

class CategoryNotifier extends StateNotifier<ProductApiResponse> {
  CategoryNotifier() : super(ProductApiResponse());

  final ApiServices _apiServices = ApiServices();

  Future<void> fetchAllProducts() async {
    await _fetchByCategory(null);
  }

  Future<void> fetchByCategory(String? categoryPath) async {
    await _fetchByCategory(categoryPath);
  }

  Future<void> _fetchByCategory(String? categoryPath) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      category: categoryPath ?? 'All',
    );

    final productResult = await _apiServices.fetchProducts(
      category: categoryPath,
    );

    state = productResult.fold(
      (failure) =>
          state.copyWith(isLoading: false, errorMessage: failure.message),
      (products) => state.copyWith(
        products:
            products
                .map(
                  (product) => ProductMapper.productFakeStoreToProduct(product),
                )
                .toList(),
        isLoading: false,
      ),
    );
  }

  void productById(int id) {
    final product = state.products.firstWhereOrNull(
      (product) => product.id == id,
    );
    state = state.copyWith(product: product);
  }
}

final categoryProductsProvider =
    StateNotifierProvider<CategoryNotifier, ProductApiResponse>((ref) {
      return CategoryNotifier();
    });
