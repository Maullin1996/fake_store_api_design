import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildWidget({
  required bool isPromotion,
  required bool isFavorite,
  Function()? onPressedbuy,
  Function()? onPressedFavorite,
}) {
  return MaterialApp(
    home: Scaffold(
      body: ProductInfoContainer(
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
        onPressedFavorite: onPressedFavorite,
        onPressedbuy: onPressedbuy,
      ),
    ),
  );
}

void main() {
  group(
    'Verify the product home container when the product is not in	promotion',
    () {
      setUp(() async {
        await AtomicDesignConfig.initializeFromAsset(
          'assets/config/app_config.json',
        );
      });
      testWidgets("Text in the home holder", (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          buildWidget(isPromotion: false, isFavorite: true),
        );

        // Act
        final productName = find.text("Fjallraven");
        final productPrice = find.text("\$ 1000000.95");
        final productDescription = find.text(
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        );

        // Assert
        expect(productDescription, findsOneWidget);
        expect(productPrice, findsOneWidget);
        expect(productName, findsOneWidget);
      });
      testWidgets("Check if the image is displayed", (
        WidgetTester tester,
      ) async {
        // Arrange
        await tester.pumpWidget(
          buildWidget(isPromotion: false, isFavorite: true),
        );
        // Act
        final productImage = find.byType(AppNetworkImage);
        // Assert
        expect(productImage, findsOneWidget);
      });
      testWidgets("Check the button actions", (WidgetTester tester) async {
        bool isFavorite = false;
        bool addCart = false;

        void onPressedFavorite() {
          isFavorite = true;
        }

        void onPressedbuy() {
          addCart = true;
        }

        await tester.pumpWidget(
          buildWidget(
            isPromotion: false,
            isFavorite: isFavorite,
            onPressedFavorite: onPressedFavorite,
            onPressedbuy: onPressedbuy,
          ),
        );

        // Act
        // Scroll down to make the text button visible
        await tester.scrollUntilVisible(
          find.byKey(ValueKey("AddToTheCart")),
          500.0,
        );
        await tester.pump();
        await tester.tap(find.byType(IconButton));
        await tester.tap(find.byType(TextButton));
        await tester.pump();

        // Assert
        expect(isFavorite, isTrue);
        expect(addCart, isTrue);
      });
    },
  );

  group(
    'Verify the product cart container when the product is in	promotion',
    () {
      setUp(() async {
        await AtomicDesignConfig.initializeFromAsset(
          'assets/config/app_config.json',
        );
      });
      testWidgets(
        "Should displaye the two priceses with discount and withou discount",
        (WidgetTester tester) async {
          // Arrange
          await tester.pumpWidget(
            buildWidget(isPromotion: true, isFavorite: true),
          );
          // Act
          final productPrice = find.text("\$ 1000000.95");
          final productDiscountPrice = find.text("\$ 900000.85");
          // Assert
          expect(productPrice, findsOneWidget);
          expect(productDiscountPrice, findsOneWidget);
        },
      );
    },
  );
}
