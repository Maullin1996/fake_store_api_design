import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildWidget({
  required bool isPromotion,
  required bool isFavorite,
  Function()? onPressedbuy,
  Function()? onPressedFavorite,
  Function()? onPressedinfo,
}) {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: ProducthomeContainer(
          id: 1,
          url: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          productName: "Fjallraven",
          productCategory: "men's clothing",
          productPrice: 1000000.95,
          isPromotion: isPromotion,
          discount: 0.1,
          isFavorite: isFavorite,
          assetsImage: "assets/test/company_info.png",
          onPressedFavorite: onPressedFavorite,
          onPressedbuy: onPressedbuy,
          onPressedinfo: onPressedinfo,
        ),
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
        final productCategory = find.text("men's clothing");
        final buttonText = find.text("Add to Cart");

        // Assert
        expect(productCategory, findsOneWidget);
        expect(productPrice, findsOneWidget);
        expect(productName, findsOneWidget);
        expect(buttonText, findsOneWidget);
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
        bool navigateTo = false;
        bool isFavorite = false;
        bool addCart = false;

        void onPressedinfo() {
          navigateTo = true;
        }

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
            onPressedinfo: onPressedinfo,
            onPressedbuy: onPressedbuy,
          ),
        );

        // Act
        await tester.tap(find.byType(IconButton));
        await tester.tap(find.byType(TextButton));
        await tester.tap(find.byType(AppNetworkImage));
        await tester.pump();

        // Assert
        expect(navigateTo, isTrue);
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
