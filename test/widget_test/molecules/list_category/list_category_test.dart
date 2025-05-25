import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<String> categories = const ["All", "Men", "Women", "Electronics"];
  testWidgets("Verify the elements on the screen and the selected one", (
    WidgetTester tester,
  ) async {
    // Arrange
    String selectedCategory = "All";
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListCategory(
            selectedCategory: selectedCategory,
            onCategorySelected: (value) => selectedCategory = value,
            categories: categories,
          ),
        ),
      ),
    );
    // Act
    final findCategorie = find.text("Women");
    final findSelectedCategory = tester.widget<AppButtons>(
      find.byKey(ValueKey("0")),
    );
    final findNotSelectedCategory = tester.widget<AppButtons>(
      find.byKey(ValueKey("3")),
    );

    // Assert
    expect(findCategorie, findsOne);
    expect(findSelectedCategory.type, equals(ButtonType.secondaryTextButton));
    expect(findNotSelectedCategory.type, equals(ButtonType.primaryTextButton));
  });
  testWidgets("Verify the selectedCategorie value when press other categorie", (
    WidgetTester tester,
  ) async {
    // Arrange
    String selectedCategory = "All";
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListCategory(
            selectedCategory: selectedCategory,
            onCategorySelected: (value) => selectedCategory = value,
            categories: categories,
          ),
        ),
      ),
    );
    // Act
    await tester.tap(find.byKey(ValueKey("1")));
    await tester.pump();
    // Assert
    expect(selectedCategory, equals("Men"));
  });
  testWidgets("displays all categories from the list", (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListCategory(
            selectedCategory: "All",
            onCategorySelected: (value) {},
            categories: categories,
          ),
        ),
      ),
    );

    // Assert
    //Check that all categories are displayed
    for (String category in categories) {
      expect(find.text(category), findsOneWidget);
    }

    //verify the correct number of AppButtons
    expect(find.byType(AppButtons), findsNWidgets(categories.length));
  });

  testWidgets("ListView scrolls horizontally", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListCategory(
            selectedCategory: "All",
            onCategorySelected: (value) {},
            categories: categories,
          ),
        ),
      ),
    );

    // Act & Assert
    final listView = tester.widget<ListView>(find.byType(ListView));
    expect(listView.scrollDirection, equals(Axis.horizontal));
    expect(listView.shrinkWrap, isTrue);
  });

  testWidgets("handles empty categories list", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListCategory(
            selectedCategory: "",
            onCategorySelected: (value) {},
            categories: [], // Empty list
          ),
        ),
      ),
    );

    // Assert
    expect(find.byType(AppButtons), findsNothing);
    expect(
      find.byType(ListView),
      findsOneWidget,
    ); // ListView should still exist
  });
  testWidgets("updates button styles when selectedCategory changes", (
    WidgetTester tester,
  ) async {
    // Arrange
    String currentSelected = "All";

    Widget buildWidget(String selected) {
      return MaterialApp(
        home: Scaffold(
          body: ListCategory(
            selectedCategory: selected,
            onCategorySelected: (value) {},
            categories: categories,
          ),
        ),
      );
    }

    // Initial build
    await tester.pumpWidget(buildWidget(currentSelected));

    // Assert initial state
    final initialButton = tester.widget<AppButtons>(
      find.byKey(const ValueKey("0")),
    );
    expect(initialButton.type, equals(ButtonType.secondaryTextButton));

    // Rebuild with different selection
    await tester.pumpWidget(buildWidget("Men"));

    // Assert new state
    final firstButton = tester.widget<AppButtons>(
      find.byKey(const ValueKey("0")),
    );
    final secondButton = tester.widget<AppButtons>(
      find.byKey(const ValueKey("1")),
    );

    expect(
      firstButton.type,
      equals(ButtonType.primaryTextButton),
    ); // No longer selected
    expect(
      secondButton.type,
      equals(ButtonType.secondaryTextButton),
    ); // Now selected
  });
}
