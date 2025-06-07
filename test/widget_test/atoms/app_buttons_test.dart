import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Fill Button', () {
    setUp(() async {
      await AtomicDesignConfig.initializeFromAsset(
        'assets/config/app_config.json',
      );
    });
    testWidgets("primaryFillButton AppColors.primary", (
      WidgetTester tester,
    ) async {
      // Arrenge
      bool wasPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: AppButtons(
            type: ButtonType.primaryFillButton,
            title: "button",
            onPressed: () => wasPressed = true,
          ),
        ),
      );
      // Act
      final buttonType = find.byType(ElevatedButton);
      final buttonText = find.text("button");
      await tester.tap(find.byType(ElevatedButton));
      // Expect
      expect(buttonType, findsOneWidget);
      expect(buttonText, findsOneWidget);
      expect(wasPressed, true);
    });
    testWidgets('primaryFillButton is disabled when onPressed is null', (
      tester,
    ) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: AppButtons(
            type: ButtonType.primaryFillButton,
            title: 'Disabled',
            onPressed: null,
          ),
        ),
      );
      // Act
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      // Assert
      expect(button.onPressed, isNull);
    });
    testWidgets('primaryFillButton has correct horizontal padding', (
      tester,
    ) async {
      // Arrange
      const customWidth = 40.0;

      await tester.pumpWidget(
        MaterialApp(
          home: AppButtons(
            type: ButtonType.primaryFillButton,
            title: 'With Padding',
            buttonWidth: customWidth,
          ),
        ),
      );
      // Act
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final style = button.style!;
      // Assert
      expect(
        style.padding!.resolve({}),
        EdgeInsets.symmetric(horizontal: customWidth),
      );
    });
    testWidgets("secondaryFillButton AppColors.secondary", (
      WidgetTester tester,
    ) async {
      // Arrenge
      await tester.pumpWidget(
        MaterialApp(
          home: AppButtons(
            type: ButtonType.secondaryFillButton,
            title: "secondaryButton",
          ),
        ),
      );
      // Act
      final buttonType = find.byType(ElevatedButton);
      final buttonText = find.text("secondaryButton");
      // Expect
      expect(buttonType, findsOneWidget);
      expect(buttonText, findsOneWidget);
    });
    testWidgets(
      "secundaryFillButton shows CircularProgressIndicator when loading",
      (WidgetTester tester) async {
        //Arrange
        await tester.pumpWidget(
          const MaterialApp(
            home: AppButtons(
              type: ButtonType.secondaryFillButton,
              title: "Loading",
              isLoading: true,
            ),
          ),
        );

        //Assert
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(
          tester
              .widget<ElevatedButton>(find.byType(ElevatedButton))
              .onLongPress,
          isNull,
        );
      },
    );
  });
  group('Text Button', () {
    setUp(() async {
      await AtomicDesignConfig.initializeFromAsset(
        'assets/config/app_config.json',
      );
    });
    testWidgets("primaryTextButton AppColors.primary", (
      WidgetTester tester,
    ) async {
      // Arrange
      bool wasPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: AppButtons(
            type: ButtonType.primaryTextButton,
            title: "Text Button",
            onPressed: () => wasPressed = true,
          ),
        ),
      );
      // Act
      final buttonType = find.byType(TextButton);
      final buttonText = find.text("Text Button");
      final textWidget = tester.widget<Text>(find.text("Text Button"));
      await tester.tap(find.byType(TextButton));
      // Assert
      expect(buttonType, findsOneWidget);
      expect(buttonText, findsOneWidget);
      expect(textWidget.style?.color, AppColors.primary);
      expect(wasPressed, true);
    });
    testWidgets('primaryTextButton is disabled when onPressed is null', (
      tester,
    ) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: AppButtons(
            type: ButtonType.primaryTextButton,
            title: 'Disabled',
            onPressed: null,
          ),
        ),
      );
      // Act
      final button = tester.widget<TextButton>(find.byType(TextButton));
      // Assert
      expect(button.onPressed, isNull);
    });
    testWidgets("secondaryTextButton AppColors.secondary", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        // Arrange
        const MaterialApp(
          home: AppButtons(
            type: ButtonType.secondaryTextButton,
            title: "Text Button",
          ),
        ),
      );
      // Act
      final buttonType = find.byType(TextButton);
      final buttonText = find.text("Text Button");
      final textWidget = tester.widget<Text>(find.text("Text Button"));
      // Assert
      expect(buttonType, findsOneWidget);
      expect(buttonText, findsOneWidget);
      expect(textWidget.style?.color, AppColors.disabledButton);
    });
    testWidgets(
      "secondaryFillButton shows CircularProgressIndicator when loading",
      (WidgetTester tester) async {
        //Arrange
        await tester.pumpWidget(
          const MaterialApp(
            home: AppButtons(
              type: ButtonType.secondaryTextButton,
              title: "Loading",
              isLoading: true,
            ),
          ),
        );

        //Assert
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(
          tester.widget<TextButton>(find.byType(TextButton)).onLongPress,
          isNull,
        );
      },
    );
  });
  group('Icon Button', () {
    setUp(() async {
      await AtomicDesignConfig.initializeFromAsset(
        'assets/config/app_config.json',
      );
    });
    testWidgets("primaryIconButton AppColors.primary", (
      WidgetTester tester,
    ) async {
      // Arrange
      bool wasPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: AppButtons(
            type: ButtonType.primaryIconButton,
            icon: AppIcons.check,
            onPressed: () => wasPressed = true,
          ),
        ),
      );
      // Act
      final buttonType = find.byType(IconButton);
      final buttonIcon = find.byIcon(AppIcons.check);
      await tester.tap(find.byType(IconButton));

      // Assert
      expect(buttonIcon, findsOneWidget);
      expect(buttonType, findsOneWidget);
      expect(wasPressed, true);
    });
    testWidgets('primaryTextButton is disabled when onPressed is null', (
      tester,
    ) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: AppButtons(
            type: ButtonType.primaryIconButton,
            icon: AppIcons.check,
            onPressed: null,
          ),
        ),
      );
      // Act
      final button = tester.widget<IconButton>(find.byType(IconButton));
      // Assert
      expect(button.onPressed, isNull);
    });
    testWidgets('primaryIconButton uses custom iconSize', (tester) async {
      // Arrange
      const customSize = 48.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AppButtons(
            type: ButtonType.primaryIconButton,
            icon: AppIcons.check,
            iconSize: customSize,
          ),
        ),
      );
      // Act
      final icon = tester.widget<Icon>(find.byIcon(AppIcons.check));
      // Assert
      expect(icon.size, customSize);
    });
    testWidgets("secondaryIconButton AppColors.secondary", (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: AppButtons(
            type: ButtonType.secondaryIconButton,
            icon: AppIcons.check,
          ),
        ),
      );
      // Act
      final buttonType = find.byType(IconButton);
      final buttonIcon = find.byIcon(AppIcons.check);
      // Assert
      expect(buttonIcon, findsOneWidget);
      expect(buttonType, findsOneWidget);
    });
  });
}
