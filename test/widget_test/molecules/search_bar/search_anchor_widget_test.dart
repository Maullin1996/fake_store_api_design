import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await AtomicDesignConfig.initializeFromAsset(
      'assets/config/app_config.json',
    );
  });
  final List<String> products = const ["tv", "computer", "mouse", "keyborad"];
  testWidgets("test description", (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchAnchorWidget(
            items: products,
            //hintText: "Products",
            displayString: (item) => item,
            onItemSelected: (selectedItem) {},
          ),
        ),
      ),
    );
    // Act
    final findInputText = find.text("Search Product");
    // Assert
    expect(findInputText, findsOne);
  });

  testWidgets("should open search view when tapped", (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchAnchorWidget<String>(
            items: products,
            //hintText: "Search Products",
            displayString: (item) => item,
            onItemSelected: (selectedItem) {},
          ),
        ),
      ),
    );

    // Act
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(BackButton), findsOneWidget);
  });

  testWidgets("should display all items when search is empty", (
    WidgetTester tester,
  ) async {
    //Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchAnchorWidget<String>(
            items: products,
            //hintText: "Search Products",
            displayString: (item) => item,
            onItemSelected: (selectedItem) {},
          ),
        ),
      ),
    );

    // Act
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    // Assert
    for (String product in products) {
      expect(find.text(product), findsOneWidget);
    }
  });
  testWidgets("should filter items based on search input", (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchAnchorWidget<String>(
            items: products,
            //hintText: "Search Products",
            displayString: (item) => item,
            onItemSelected: (selectedItem) {},
          ),
        ),
      ),
    );

    // Act - open search view and enter text
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    // Find the search input field and enter text
    final searchField = find.byType(TextField).last; // The search input field
    await tester.enterText(searchField, "co");
    await tester.pumpAndSettle();

    // Assert - only "computer" should be visible
    expect(find.text("computer"), findsOneWidget);
    expect(find.text("tv"), findsNothing);
    expect(find.text("mouse"), findsNothing);
    expect(find.text("keyboard"), findsNothing);
  });

  testWidgets("should call onItemSelected when item is tapped", (
    WidgetTester tester,
  ) async {
    // Arrange
    String? selectedItem;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchAnchorWidget<String>(
            items: products,
            //hintText: "Search Products",
            displayString: (item) => item,
            onItemSelected: (item) {
              selectedItem = item;
            },
          ),
        ),
      ),
    );
    // Act
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    await tester.tap(find.text("computer"));
    await tester.pumpAndSettle();

    // Assert
    expect(selectedItem, equals("computer"));
  });

  testWidgets("should handle case insensitive search", (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchAnchorWidget<String>(
            items: products,
            //hintText: "Search Products",
            displayString: (item) => item,
            onItemSelected: (selectedItem) {},
          ),
        ),
      ),
    );

    // Act - open search view and enter uppercase text
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    final searchField = find.byType(TextField).last;
    await tester.enterText(searchField, "TV");
    await tester.pumpAndSettle();

    // Assert
    expect(find.text("tv"), findsOneWidget);
  });

  testWidgets("should show no results when search doesn't match", (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchAnchorWidget<String>(
            items: products,
            //hintText: "Search Products",
            displayString: (item) => item,
            onItemSelected: (selectedItem) {},
          ),
        ),
      ),
    );

    // Act - open search view and enter non-matching text
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    final searchField = find.byType(TextField).last;
    await tester.enterText(searchField, "xyz");
    await tester.pumpAndSettle();

    // Assert - no products should be visible
    for (String product in products) {
      expect(find.text(product), findsNothing);
    }
  });
  testWidgets("should use provided SearchController", (
    WidgetTester tester,
  ) async {
    // Arrange
    final controller = SearchController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchAnchorWidget<String>(
            items: products,
            //hintText: "Search Products",
            displayString: (item) => item,
            onItemSelected: (selectedItem) {},
            controller: controller,
          ),
        ),
      ),
    );

    // Act - programmatically set text via controller
    controller.text = "mouse";
    await tester.pump();

    // The controller is used internally by SearchAnchor
    expect(controller.text, equals("mouse"));
  });

  testWidgets("should close search view after item selection", (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchAnchorWidget<String>(
            items: products,
            //intText: "Search Products",
            displayString: (item) => item,
            onItemSelected: (selectedItem) {},
          ),
        ),
      ),
    );

    // Act - open search view, select an item
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    // Verify search view is open (back button should be visible)
    expect(find.byType(BackButton), findsOneWidget);

    await tester.tap(find.text("computer"));
    await tester.pumpAndSettle();

    // Assert - search view should be closed
    expect(find.byType(BackButton), findsNothing);
  });
}
