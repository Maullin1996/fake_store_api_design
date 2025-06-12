import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildWidget() {
  return MaterialApp(
    home: UserTemplate(
      lastName: "Perez",
      name: "Pepito",
      username: "username",
      email: "tester_google@google.com.co",
      phone: "312254541225",
      city: "Bello",
      street: "street",
      number: "number",
      zipcode: "zipcode",
    ),
  );
}

void main() {
  setUp(() async {
    await AtomicDesignConfig.initializeFromAsset(
      'assets/config/app_config.json',
    );
    await SemanticsConfig.initializeFromAsset(
      'assets/locale/en/semantics_json.json',
    );
  });
  testWidgets("Find the text on the screen", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(buildWidget());
    // Act
    final userNameAppbar = find.text("Pepito Perez");
    final userPhone = find.text("312254541225");
    final userZipcode = find.text("zipcode");
    // Assert
    expect(userNameAppbar, findsOneWidget);
    expect(userPhone, findsOneWidget);
    expect(userZipcode, findsOneWidget);
  });

  testWidgets("Find the icon on the screen", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(buildWidget());
    // Act
    final emailIcon = find.byIcon(AppIcons.mail);
    final cityIcon = find.byIcon(AppIcons.city);
    final numberIcon = find.byIcon(AppIcons.direction);
    // Assert
    expect(emailIcon, findsOneWidget);
    expect(cityIcon, findsOneWidget);
    expect(numberIcon, findsOneWidget);
  });
}
