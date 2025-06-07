import 'package:fake_store_design/atoms/app_icons.dart';
import 'package:fake_store_design/config/atomic_design_config.dart';
import 'package:fake_store_design/molecules/company_info/company_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  setUp(() async {
    await AtomicDesignConfig.initializeFromAsset(
      'assets/config/app_config.json',
    );
  });
  //
  testWidgets("Check the Icons and texts on Screen", (
    WidgetTester tester,
  ) async {
    //Arrange
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: Center(child: CompanyInfo()))),
    );
    // Act
    final emailIcon = find.byIcon(AppIcons.mail);
    final instagramIcon = find.byIcon(AppIcons.instagram);
    final addressText = find.text("CRA 88A # 55W - 44 Sur Medellin");
    final whatsappText = find.text("(+57) 3354425145");
    // Assert
    expect(emailIcon, findsOneWidget);
    expect(instagramIcon, findsOneWidget);
    expect(addressText, findsOne);
    expect(whatsappText, findsOne);
  });

  testWidgets("large width screen", (WidgetTester tester) async {
    //Arrange
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: Center(child: CompanyInfo()))),
    );
    // Act
    final twoColumn = find.byKey(ValueKey("2 column"));
    // Arrange
    expect(twoColumn, findsOneWidget);
  });

  testWidgets("small width screen", (WidgetTester tester) async {
    //Arrange
    tester.view.physicalSize = const Size(280, 653);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: Center(child: CompanyInfo()))),
    );
    // Act
    final oneColumn = find.byKey(ValueKey("1 column"));

    // Arrange
    expect(oneColumn, findsOneWidget);
  });
}
