import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await AtomicDesignConfig.initializeFromAsset(
      'assets/config/app_config.json',
    );
    await SemanticsConfig.initializeFromAsset(
      'assets/locale/en/semantics_json.json',
    );
  });
  testWidgets("test description", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: PriceSection(
              isPromotion: false,
              productPrice: 985.415,
              discount: 0.1,
            ),
          ),
        ),
      ),
    );
    // Act
    final findPrice = find.text("\$ 985.41");
    final findDiscount = find.text("\$ 886.87");
    // Assert
    expect(findPrice, findsOneWidget);
    expect(findDiscount, findsNothing);
  });

  testWidgets("test description", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: PriceSection(
              isPromotion: true,
              productPrice: 985.415,
              discount: 0.1,
            ),
          ),
        ),
      ),
    );
    // Act
    final findPrice = find.text("\$ 985.41");
    final priceStyle = tester.widget<Text>(find.text("\$ 985.41"));
    final findDiscount = find.text("\$ 886.87");
    // Assert
    expect(findPrice, findsOne);
    expect(priceStyle.style?.decoration, TextDecoration.lineThrough);
    expect(findDiscount, findsOne);
  });
}
