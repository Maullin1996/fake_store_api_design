import 'package:fake_store_design/atoms/app_input_text.dart';
import 'package:fake_store_design/atoms/break_points.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets("check the label text and type", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: AppInputText(label: "title"))),
      ),
    );

    // Act
    final labelText = find.text("title");
    final inputType = find.byType(TextFormField);

    //Assert
    expect(labelText, findsOneWidget);
    expect(inputType, findsOneWidget);
  });
  testWidgets("check the input text", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: AppInputText(label: "title"))),
      ),
    );

    await tester.enterText(find.byType(TextFormField), "allStoreHouse");
    await tester.pump();
    // Act
    final inputText = find.text("allStoreHouse");
    //Assert
    expect(inputText, findsOneWidget);
  });

  testWidgets("should obscure text when obscureText is true", (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: AppInputText(label: "Password", obscureText: true),
          ),
        ),
      ),
    );

    // Act
    await tester.enterText(find.byType(TextFormField), "password123");
    await tester.pump();

    // Find the EditableText
    final editableText = tester.widget<EditableText>(
      find.descendant(
        of: find.byType(TextFormField),
        matching: find.byType(EditableText),
      ),
    );

    // Assert
    expect(editableText.obscureText, true);
  });

  testWidgets("label does not float when floatingLabelBehavior is false", (
    WidgetTester tester,
  ) async {
    // Arrange
    String changedText = "";
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AppInputText(
              label: 'Name',
              onChange: (value) => changedText = value,
            ),
          ),
        ),
      ),
    );

    //Act
    await tester.enterText(find.byType(TextFormField), "allStoreHouse");
    await tester.pump();

    // Assert
    expect(changedText, equals("allStoreHouse"));
  });

  testWidgets("should display error message when validation fails", (
    WidgetTester tester,
  ) async {
    // Arrange
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Form(
            key: formKey,
            child: Center(
              child: AppInputText(
                label: "Email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }

                  return null;
                },
              ),
            ),
          ),
        ),
      ),
    );
    // Act
    formKey.currentState!.validate();
    await tester.pump();
    // Assert
    expect(find.text("Email is required"), findsOneWidget);
  });

  testWidgets("should not float label when floatingLabelBehavior is false", (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: AppInputText(label: "Name", floatingLabelBehavior: false),
          ),
        ),
      ),
    );
    //Act
    final inputDecorator = tester.widget<InputDecorator>(
      find.descendant(
        of: find.byType(TextFormField),
        matching: find.byType(InputDecorator),
      ),
    );
    // Assert
    expect(
      inputDecorator.decoration.floatingLabelBehavior,
      equals(FloatingLabelBehavior.never),
    );
  });
  testWidgets("should use provided TextEditingController", (
    WidgetTester tester,
  ) async {
    // Arrange
    final controller = TextEditingController(text: "Initial Text");

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AppInputText(
              label: "Name",
              textEditingController: controller,
            ),
          ),
        ),
      ),
    );

    // Assert
    expect(find.text("Initial Text"), findsOneWidget);

    // Act
    controller.text = "Updated Text";
    await tester.pump();

    // Assert
    expect(find.text("Updated Text"), findsOneWidget);
  });

  testWidgets("should display suffix icon when provided", (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AppInputText(
              label: "Search",
              suffixIcon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
    // Assert
    expect(find.byIcon(Icons.search), findsOneWidget);
  });

  testWidgets("should have responsive width based on screen size", (
    WidgetTester tester,
  ) async {
    // Arrange
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: AppInputText(label: "Name"))),
      ),
    );

    //Act
    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);

    // Assert
    final expectedWidth = ResponsiveDesign(width: 1080).appInputTextWidth;
    expect(sizedBox.width, expectedWidth);

    // Reset the screen size
    addTearDown(tester.view.resetPhysicalSize);
  });
}
