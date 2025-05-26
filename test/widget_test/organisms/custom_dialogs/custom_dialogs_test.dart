import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildWidget(String totalToPay) {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: CustomDialog(
          dialogType: DialogType.unauthenticated,
          totalToPay: totalToPay,
          onDialogButtonPressed: () {},
        ),
      ),
    ),
  );
}

void main() {
  group("Verify that the button show the correct text", () {
    testWidgets("case 1: Empty cart", (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(buildWidget("0.00"));
      await tester.pumpAndSettle();
      final findTextCartEmpty = find.text('Add Products');

      // Assert
      expect(findTextCartEmpty, findsOneWidget);
    });

    testWidgets("case 2: Cart has products", (WidgetTester tester) async {
      //Act
      await tester.pumpWidget(buildWidget("10.80"));
      await tester.pumpAndSettle();
      final findTextCart = find.text('Go To Pay : 10.80');

      // Assert
      expect(findTextCart, findsOneWidget);
    });
  });

  group(
    'Verify that the Unauthenticated showDialog shows the correct text, icon and button',
    () {
      bool navigaTo = false;
      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: CustomDialog(
                dialogType: DialogType.unauthenticated,
                totalToPay: "10.08",
                onDialogButtonPressed: () => navigaTo = true,
              ),
            ),
          ),
        );
      }

      testWidgets("Text on screen", (WidgetTester tester) async {
        // Assert
        await tester.pumpWidget(buildWidget());
        // Act
        await tester.tap(find.byKey(ValueKey("EnterDialogButton")));
        await tester.pumpAndSettle();
        final findText = find.text("Unauthenticated user");
        final findTextButton = find.text("Login");
        // Assert
        expect(findText, findsOneWidget);
        expect(findTextButton, findsOneWidget);
      });
      testWidgets("Icon on screen", (WidgetTester tester) async {
        // Assert
        await tester.pumpWidget(buildWidget());
        // Act
        await tester.tap(find.byKey(ValueKey("EnterDialogButton")));
        await tester.pumpAndSettle();
        final findIcon = find.byIcon(AppIcons.error);
        // Assert
        expect(findIcon, findsOneWidget);
      });
      testWidgets("Check the NavigaTo state when onPressed", (
        WidgetTester tester,
      ) async {
        // Assert
        await tester.pumpWidget(buildWidget());
        // Act
        await tester.tap(find.byKey(ValueKey("EnterDialogButton")));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(ValueKey("ButtonDialogNavigation")));
        await tester.pump();
        // Assert
        expect(navigaTo, isTrue);
      });
    },
  );

  group(
    'Verify that the Authenticated showDialog shows the correct text, icon and button',
    () {
      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: CustomDialog(
                dialogType: DialogType.authenticated,
                totalToPay: "10.08",
                onDialogButtonPressed: () {},
              ),
            ),
          ),
        );
      }

      testWidgets("Text on screen", (WidgetTester tester) async {
        // Assert
        await tester.pumpWidget(buildWidget());
        // Act
        await tester.tap(find.byKey(ValueKey("EnterDialogButton")));
        await tester.pumpAndSettle();
        final findText = find.text("Successful Purchase");
        final findTextButton = find.text("Continue Shopping");
        // Assert
        expect(findText, findsOneWidget);
        expect(findTextButton, findsOneWidget);
      });
      testWidgets("Icon on screen", (WidgetTester tester) async {
        // Assert
        await tester.pumpWidget(buildWidget());
        // Act
        await tester.tap(find.byKey(ValueKey("EnterDialogButton")));
        await tester.pumpAndSettle();
        final findIcon = find.byIcon(AppIcons.check);
        // Assert
        expect(findIcon, findsOneWidget);
      });
    },
  );
}
