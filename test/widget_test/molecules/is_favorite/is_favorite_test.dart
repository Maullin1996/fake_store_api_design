import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await AtomicDesignConfig.initializeFromAsset(
      'assets/config/app_config.json',
    );
  });
  testWidgets("check the initial state of the isFavoriteWidget", (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: IsFavorite(
          productName: "T-shirt",
          textStyle: TextStyle(fontSize: AppTypography.h2),
          isFavorite: false,
          onPressedFavorite: () {},
        ),
      ),
    );
    // Act
    final nameText = find.text("T-shirt");
    final iconHeart = find.byIcon(AppIcons.unLike);
    final iconHeartFill = find.byIcon(AppIcons.favorite);

    // Assert
    expect(nameText, findsOneWidget);
    expect(iconHeart, findsOneWidget);
    expect(iconHeartFill, findsNothing);
  });
  testWidgets("isFavorite should would change when button is pressed", (
    WidgetTester tester,
  ) async {
    // Arrange
    bool isFavorite = true;
    await tester.pumpWidget(
      MaterialApp(
        home: IsFavorite(
          productName: "T-shirt",
          textStyle: TextStyle(fontSize: AppTypography.h2),
          isFavorite: isFavorite,
          onPressedFavorite: () => isFavorite = false,
        ),
      ),
    );
    // Act
    await tester.tap(find.byType(AppButtons));
    await tester.pump();
    final iconHeartFill = find.byIcon(AppIcons.favorite);

    // Assert
    expect(isFavorite, isFalse);
    expect(iconHeartFill, findsOneWidget);
  });
  testWidgets("updates button styles when selectedCategory changes", (
    WidgetTester tester,
  ) async {
    // Arrange
    bool isFavorite = false;

    Widget buildWidget(bool favorite) {
      return MaterialApp(
        home: IsFavorite(
          productName: "T-shirt",
          textStyle: TextStyle(fontSize: AppTypography.h2),
          isFavorite: favorite,
          onPressedFavorite: () {},
        ),
      );
    }

    // Initial build
    await tester.pumpWidget(buildWidget(isFavorite));

    // Assert initial state
    final iconHeart = find.byIcon(AppIcons.unLike);
    expect(iconHeart, findsOneWidget);

    // Rebuild with different selection
    await tester.pumpWidget(buildWidget(true));
    await tester.pump();
    // Act new state
    final firtsHeart = find.byIcon(AppIcons.unLike);
    final seconIcon = find.byIcon(AppIcons.favorite);

    //Assert
    expect(firtsHeart, findsNothing);
    expect(seconIcon, findsOneWidget);
  });
}
