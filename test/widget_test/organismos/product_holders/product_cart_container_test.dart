import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildWidget({
    required bool isPromotion,
    Function()? onPressedplus,
    Function()? onPressedminus,
    Function()? onPressedinfo,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ProductCartContainer(
            url: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
            productName: "Fjallraven",
            amount: "2",
            productPrice: 1000000.95,
            isPromotion: isPromotion,
            discount: 0.1,
            description:
                "Your perfect pack for everyday use and walks in the forest.",
            assetsImage: "assets/test/company_info.png",
            onPressedinfo: onPressedinfo,
            onPressedminus: onPressedminus,
            onPressedplus: onPressedplus,
          ),
        ),
      ),
    );
  }

  group(
    'Verify the product cart container when the product is not in	promotion',
    () {
      testWidgets("Text in the cart", (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(buildWidget(isPromotion: false));

        // Act
        final productName = find.text("Fjallraven");
        final productPrice = find.text("\$ 1000000.95");
        final productAmount = find.text("2");

        // Assert
        expect(productAmount, findsOneWidget);
        expect(productPrice, findsOneWidget);
        expect(productName, findsOneWidget);
      });
      testWidgets("Should shows the description on Large screens", (
        WidgetTester tester,
      ) async {
        // Arrange
        tester.view.physicalSize = const Size(1080, 1920);
        tester.view.devicePixelRatio = 1.0;
        await tester.pumpWidget(buildWidget(isPromotion: false));

        // Act
        final productDescription = find.text(
          "Your perfect pack for everyday use and walks in the forest.",
        );

        // Assert
        expect(productDescription, findsOneWidget);
      });
      testWidgets("Check if the image is displayed", (
        WidgetTester tester,
      ) async {
        // Arrange
        await tester.pumpWidget(buildWidget(isPromotion: false));
        // Act
        final productImage = find.byType(AppNetworkImage);
        // Assert
        expect(productImage, findsOneWidget);
      });
      testWidgets("Check the button actions", (WidgetTester tester) async {
        // Arrange
        int increaseProduct = 1;
        int decreaseProduct = 2;
        bool navigateTo = false;

        void onPressedplus() {
          increaseProduct = increaseProduct + 1;
        }

        void onPressedminus() {
          decreaseProduct = decreaseProduct - 1;
        }

        void onPressedinfo() {
          navigateTo = true;
        }

        await tester.pumpWidget(
          buildWidget(
            isPromotion: false,
            onPressedinfo: onPressedinfo,
            onPressedplus: onPressedplus,
            onPressedminus: onPressedminus,
          ),
        );

        // Act
        await tester.tap(find.byIcon(AppIcons.plus));
        await tester.tap(find.byIcon(AppIcons.minus));
        await tester.tap(find.byKey(ValueKey('info_gesture')));
        await tester.pump();

        // Assert
        expect(increaseProduct, equals(2));
        expect(decreaseProduct, equals(1));
        expect(navigateTo, isTrue);
      });
    },
  );
  group(
    'Verify the product cart container when the product is in	promotion',
    () {
      testWidgets(
        "Should displaye the two priceses with discount and withou discount",
        (WidgetTester tester) async {
          // Arrange
          await tester.pumpWidget(buildWidget(isPromotion: true));
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
