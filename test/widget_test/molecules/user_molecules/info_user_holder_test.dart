import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Vefiry the structure user information", (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: InfoUserHolder(
              username: "username",
              email: "tester_google@google.com.co",
              phone: "312254541225",
              city: "Bello",
              street: "street",
              number: "number",
              zipcode: "zipcode",
            ),
          ),
        ),
      ),
    );
    // Act
    final findEmail = find.text("tester_google@google.com.co");
    final findNumber = find.text("number");
    final findIconPhone = find.byIcon(AppIcons.phone);
    final findIconCity = find.byIcon(AppIcons.city);
    // Asser
    expect(findEmail, findsOne);
    expect(findNumber, findsOne);
    expect(findIconPhone, findsOne);
    expect(findIconCity, findsOne);
  });
}
