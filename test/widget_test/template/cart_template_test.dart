import 'package:fake_store_design/atoms/app_icons.dart';
import 'package:fake_store_design/template/cart_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock/mock_product.dart';

Widget buildWidget({
  required bool authentication,
  String totalToPay = "0.00",
  void Function(dynamic)? onPressedplus,
  void Function(dynamic)? onPressedminus,
}) {
  return MaterialApp(
    home: CartTemplate(
      authentication: authentication,
      listCart: mockCartItems,
      assetsImage: 'assets/test/company_info.png',
      lastName: "Perez",
      name: "Pepito",
      totalToPay: totalToPay,
      backonPressed: () {},
      logInonPressed: () {},
      logOutonPressed: () {},
      onDialogButtonPressed: () {},
      onPressedinfo: (p0) {},
      onPressedminus: onPressedminus,
      onPressedplus: onPressedplus,
    ),
  );
}

void main() {
  group('User is not login', () {
    testWidgets(
      "Verify that the last element of the screen shows on the screen",
      (WidgetTester tester) async {
        //Arrange
        await tester.pumpWidget(buildWidget(authentication: false));
        await tester.pump(const Duration(milliseconds: 900));
        // Act
        // Scroll down to make the text button visible
        await tester.scrollUntilVisible(
          find.byKey(ValueKey("Product-9")),
          500.0,
        );
        await tester.pump();
        final productName = find.text('Sunglasses');
        // Assert
        expect(productName, findsOneWidget);
      },
    );

    testWidgets(
      "should not render the name on screen because is not authenticated",
      (WidgetTester tester) async {
        //Arrange
        await tester.pumpWidget(buildWidget(authentication: false));
        await tester.pump(const Duration(milliseconds: 900));

        // Act
        final userName = find.text("Pepito Perez");

        // Assert
        expect(userName, findsNothing);
      },
    );

    testWidgets("should show the total to pay on the screen", (
      WidgetTester tester,
    ) async {
      //Arrange
      // Initial total amount set to 0
      double totalToPay = 0;

      // Calculate initial total based on mock cart items
      for (var product in mockCartItems) {
        // If discount is 100%, just add price
        (product.discount == 1.0)
            ? totalToPay = totalToPay + product.price
            // Otherwise, apply the discount
            : totalToPay =
                totalToPay + (product.price * (1.0 - product.discount));
      }
      await tester.pumpWidget(
        buildWidget(
          authentication: false,
          totalToPay: totalToPay.toStringAsFixed(2),
        ),
      );
      await tester.pump(const Duration(milliseconds: 900));
      // Act
      final totalToPayText = find.text(
        'Go To Pay : ${totalToPay.toStringAsFixed(2)}',
      );
      // Assert
      expect(totalToPayText, findsOneWidget);
    });

    testWidgets(
      "should not render the  DialogType.authenticated on screen because is not authenticated",
      (WidgetTester tester) async {
        //Arrange
        await tester.pumpWidget(
          buildWidget(authentication: false, totalToPay: "100.00"),
        );
        await tester.pump(const Duration(milliseconds: 900));
        // Act
        await tester.tap(find.byType(TextButton));
        await tester.pump();
        final iconUnauthenticated = find.byIcon(AppIcons.error);

        // Assert
        expect(iconUnauthenticated, findsOneWidget);
      },
    );

    testWidgets("check the onPressedplus action", (WidgetTester tester) async {
      // Initial total amount set to 0
      double totalToPay = 0;

      // Calculate initial total based on mock cart items
      for (var product in mockCartItems) {
        // If discount is 100%, just add price
        (product.discount == 1.0)
            ? totalToPay = totalToPay + product.price
            // Otherwise, apply the discount
            : totalToPay =
                totalToPay + (product.price * (1.0 - product.discount));
      }

      // Mock function to simulate tapping the plus (+) button on a product
      void plusButton(product) {
        // For simplicity, simulate the price increase of the second product
        totalToPay = totalToPay + product.price;
      }

      // Build the widget tree with the mock callback and initial total
      await tester.pumpWidget(
        buildWidget(
          authentication: false,
          totalToPay: totalToPay.toStringAsFixed(2),
          onPressedplus: plusButton,
        ),
      );

      // Act: simulate tapping the plus icon on the product with id=1
      await tester.tap(
        find.descendant(
          of: find.byKey(ValueKey('Product-1')), // Widget key for the product
          matching: find.byIcon(AppIcons.plus), // Plus icon inside the product
        ),
      );

      // Allow the tap to process
      await tester.pump();

      // Rebuild the widget with updated total price to reflect changes
      await tester.pumpWidget(
        buildWidget(
          authentication: false,
          totalToPay: totalToPay.toStringAsFixed(2),
          onPressedplus: plusButton,
        ),
      );

      // Assert: Look for the updated total price text
      final totalToPayText = find.text(
        'Go To Pay : ${totalToPay.toStringAsFixed(2)}',
      );

      // Verify the text appears exactly once in the widget tree total expected = 370.65
      expect(totalToPayText, findsOneWidget);
    });
  });

  group('User is login', () {
    testWidgets("should render the user name", (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(buildWidget(authentication: true));
      await tester.pump(const Duration(milliseconds: 900));

      // Act
      final findUsername = find.text("Pepito Perez");

      //  Assert
      expect(findUsername, findsOneWidget);
    });
  });
}
