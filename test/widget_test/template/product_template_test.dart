import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildWidget({bool isPromotion = false, bool isFavorite = true}) {
  return MaterialApp(
    home: ProductTemplate(
      id: 1,
      url: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      productName: "Fjallraven",
      description:
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      productPrice: 1000000.95,
      isPromotion: isPromotion,
      discount: 0.1,
      isFavorite: isFavorite,
      assetsImage: "assets/test/company_info.png",
      onPressedFavorite: () {},
      onPressedbuy: () {},
      backonPressed: () {},
      cartonPressed: () {},
    ),
  );
}

void main() {
  setUp(() async {
    await AtomicDesignConfig.initializeFromAsset(
      'assets/config/app_config.json',
    );
    await SemanticsConfig.initializeFromAsset(
      'assets/locale/en/semantics_json.json',
    );
  });
  testWidgets("Find icons on the screen", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(buildWidget());
    // Act
    final favortiteIcon = find.byIcon(AppIcons.favorite);
    final cartIcon = find.byIcon(AppIcons.cart);
    // Assert
    expect(favortiteIcon, findsOneWidget);
    expect(cartIcon, findsOneWidget);
  });

  testWidgets("Render the promotion price", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(buildWidget(isPromotion: true));
    // Act
    // Scroll down to make the button visible
    await tester.scrollUntilVisible(find.byType(TextButton), 500.0);
    await tester.pump();
    final promotionPrice = find.text("\$ 900000.85");
    // Assert
    expect(promotionPrice, findsOneWidget);
  });
}
