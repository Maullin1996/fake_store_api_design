import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildWidget({
  required bool obscureText,
  bool isLoadingButton = false,
  VoidCallback? onPressed,
  VoidCallback? cartonPressed,
  String? Function(String?)? validatorUsername,
  String? Function(String?)? validatorPassword,
  TextEditingController? usernameController,
  GlobalKey<FormState>? formKey,
}) {
  return MaterialApp(
    home: LoginTemplate(
      // loginTitle: "Login",
      // subtitle: "Sign in to continue",
      // labelUsername: "Username",
      // labelPassword: "Password",
      // titleButtonLogin: "Enter",
      formKey: formKey,
      obscureText: obscureText,
      path: 'assets/test/company_info.png',
      isLoadingButton: isLoadingButton,
      cartonPressed: cartonPressed,
      backonPressed: () {},
      iconOnPressed: () {},
      onPressed: onPressed,
      validatorPassword: validatorPassword,
      validatorUsername: validatorUsername,
      usernameController: usernameController,
    ),
  );
}

void main() {
  setUp(() async {
    await AtomicDesignConfig.initializeFromAsset(
      'assets/config/app_config.json',
    );
  });
  testWidgets("Find assetImage Widget", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(buildWidget(obscureText: false));
    // Act
    final findLogo = find.byType(AppAssetsImage);
    // Assert
    expect(findLogo, findsOneWidget);
  });

  testWidgets(
    "should render the widget CircularProgressIndicator when isLoadingButton is true",
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        buildWidget(obscureText: false, isLoadingButton: true),
      );
      // Act
      final progressIndicator = find.byType(CircularProgressIndicator);
      final buttonEnter = find.text('Enter');
      // Assert
      expect(progressIndicator, findsOneWidget);
      expect(buttonEnter, findsNothing);
    },
  );
  testWidgets("check the validator test when the testbutton is pressed", (
    WidgetTester tester,
  ) async {
    final formKey = GlobalKey<FormState>();

    String? validator(value) {
      if (value == null || value.isEmpty) {
        return "Empty field";
      }

      return null;
    }

    void textButton() {
      formKey.currentState!.validate();
    }

    await tester.pumpWidget(
      buildWidget(
        obscureText: false,
        isLoadingButton: false,
        formKey: formKey,
        validatorUsername: validator,
        validatorPassword: validator,
        onPressed: textButton,
      ),
    );

    await tester.ensureVisible(find.byType(TextButton));
    await tester.tap(find.byType(TextButton));
    await tester.pump();

    expect(find.text("Empty field"), findsWidgets);
  });
}
