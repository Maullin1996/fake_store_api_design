import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await AtomicDesignConfig.initializeFromAsset(
      'assets/config/app_config.json',
    );
  });
  testWidgets("Verify the texts on screen", (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginForm(
            // loginTitle: "Login",
            // subtitle: "Sign in to continue",
            // labelUsername: "Username",
            // labelPassword: "Password",
            // titleButtonLogin: "Enter",
            obscureText: true,
            onPressed: () {},
            isLoadingButton: false,
            iconOnPressed: () {},
          ),
        ),
      ),
    );
    // Act
    final titleText = find.text('Login');
    final usernameText = find.byKey(ValueKey("username"));
    final passwordText = find.byKey(ValueKey("password"));
    final enterText = find.text('Enter');

    // Assert
    expect(titleText, findsOneWidget);
    expect(usernameText, findsOne);
    expect(passwordText, findsOne);
    expect(enterText, findsOneWidget);
  });

  testWidgets("check state change of the onPressed and iconOnPressed", (
    WidgetTester tester,
  ) async {
    //Arrange
    bool enterButtonNavigation = false;
    bool obscurePassword = true;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginForm(
            // loginTitle: "Login",
            // subtitle: "Sign in to continue",
            // labelUsername: "Username",
            // labelPassword: "Password",
            // titleButtonLogin: "Enter",
            obscureText: true,
            onPressed: () => enterButtonNavigation = true,
            isLoadingButton: false,
            iconOnPressed: () => obscurePassword = false,
          ),
        ),
      ),
    );
    // Act
    await tester.tap(find.byKey(ValueKey("enter button")));
    await tester.tap(find.byKey(ValueKey("Icon button")));
    await tester.pump();
    // obscure false
    final iconRedEyeRounded = find.byIcon(Icons.remove_red_eye_rounded);
    // obscure true
    final iconRedEyeOutlined = find.byIcon(Icons.remove_red_eye_outlined);
    // Assert
    expect(enterButtonNavigation, isTrue);
    expect(obscurePassword, isFalse);
    expect(iconRedEyeRounded, findsNothing);
    expect(iconRedEyeOutlined, findsOneWidget);
  });

  testWidgets("check the input text", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginForm(
            // loginTitle: "Login",
            // subtitle: "Sign in to continue",
            // labelUsername: "Username",
            // labelPassword: "Password",
            // titleButtonLogin: "Enter",
            obscureText: true,
            onPressed: () {},
            isLoadingButton: false,
            iconOnPressed: () {},
          ),
        ),
      ),
    );
    // Act
    await tester.enterText(find.byKey(ValueKey("username")), "allStoreHouse");
    await tester.enterText(find.byKey(ValueKey("password")), "allStore");
    await tester.pump();

    final findUserInput = find.text("allStoreHouse");
    final findPasswordInput = find.text("allStore");
    //
    // Assert
    expect(findUserInput, findsOneWidget);
    expect(findPasswordInput, findsOneWidget);
  });
}
