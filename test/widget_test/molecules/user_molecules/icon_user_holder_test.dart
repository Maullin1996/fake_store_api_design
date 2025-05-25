import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Vefiry the icon user", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: Center(child: IconUserHolder()))),
    );
    // Act
    final findIcon = find.byIcon(AppIcons.user);
    // Assert
    expect(findIcon, findsOne);
  });
}
