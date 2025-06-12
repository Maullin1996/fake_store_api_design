import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock/mock_product.dart';

Widget buildWidget({
  required bool authentication,
  String errorMessage = "",
  bool isLoading = false,
}) {
  return MaterialApp(
    home: HomeTemplate(
      // address: "45584",
      // email: "test@gmail.com",
      // whatsapp: "311122365",
      // instagram: "allstorehouse",
      isLoading: isLoading,
      categories: categoriesMock,
      myCartList: [],
      myFavoriteList: [],
      isLogIn: authentication,
      errorMessage: errorMessage,
      selectedCategory: "All",
      products: mockCartItems,
      assetsImage: 'assets/test/company_info.png',
      lastName: "Perez",
      name: "Pepito",
      onCategorySelected: (_) {},
      logInonPressed: () {},
      logOutonPressed: () {},
      onPressedinfo: (_) {},
      onItemSelected: (_) {},
      onPressedFavorite: (_) {},
      onPressedbuy: (_) {},
      useronPressed: () {},
      refreshProducts: () async {},
      cartonPressed: () {},
    ),
  );
}

void main() {
  group('User is Login', () {
    setUp(() async {
      await AtomicDesignConfig.initializeFromAsset(
        'assets/config/app_config.json',
      );
      await SemanticsConfig.initializeFromAsset(
        'assets/locale/en/semantics_json.json',
      );
    });
    testWidgets("Error message", (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        buildWidget(authentication: true, errorMessage: "error"),
      );
      await tester.pump(const Duration(milliseconds: 1000));
      // Act
      final errorMessage = find.text("Error to get the products");
      // Assert
      expect(errorMessage, findsOneWidget);
    });
    testWidgets("should render the SkeletonLoadingContainer when is loading", (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        buildWidget(authentication: true, isLoading: true),
      );
      await tester.pump(const Duration(milliseconds: 1000));
      // Act
      final loadingSkeleton = find.byType(SkeletonLoadingContainer);
      // Assert
      expect(loadingSkeleton, findsWidgets);
    });
    testWidgets("should render the ProducthomeContainer when is loading", (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(buildWidget(authentication: true));
      await tester.pump(const Duration(milliseconds: 1000));
      // Act
      final loadingSkeleton = find.byType(ProducthomeContainer);
      // Assert
      expect(loadingSkeleton, findsWidgets);
    });
  });
}
