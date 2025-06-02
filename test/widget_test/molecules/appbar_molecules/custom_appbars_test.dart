import 'package:fake_store_design/atoms/app_icons.dart';
import 'package:fake_store_design/molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Home Appbars', () {
    testWidgets("user is not login", (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppbars(
              appbarType: AppbarType.homeLogInAppbar,
              logInonPressed: () {},
              cartonPressed: () {},
            ),
          ),
        ),
      );

      //act
      final findTitle = find.text("Home");
      final findLoginIcon = find.byIcon(AppIcons.login);
      final findCartIcon = find.byIcon(AppIcons.cart);

      //assert
      expect(findTitle, findsOneWidget);
      expect(findLoginIcon, findsOneWidget);
      expect(findCartIcon, findsOneWidget);
    });

    testWidgets("check the buttons actions for not login user", (
      WidgetTester tester,
    ) async {
      //Arrange
      bool isLogin = false;
      bool goToTheCart = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppbars(
              appbarType: AppbarType.homeLogInAppbar,
              logInonPressed: () => isLogin = true,
              cartonPressed: () => goToTheCart = true,
            ),
          ),
        ),
      );

      //act
      await tester.tap(find.byIcon(AppIcons.login));
      await tester.tap(find.byIcon(AppIcons.cart));
      await tester.pump();

      //assert
      expect(isLogin, isTrue);
      expect(goToTheCart, isTrue);
    });

    testWidgets("user is login", (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppbars(
              appbarType: AppbarType.homeLogOutAppbar,
              cartonPressed: () {},
              useronPressed: () {},
              logOutonPressed: () {},
              name: "Pepe",
              lastName: "Perez",
            ),
          ),
        ),
      );

      //act
      final findUserName = find.text("Pepe Perez");
      final findLogoutIcon = find.byIcon(AppIcons.logout);
      final findCartIcon = find.byIcon(AppIcons.cart);
      final findUserIcon = find.byIcon(AppIcons.user);

      //assert
      expect(findUserName, findsOneWidget);
      expect(findLogoutIcon, findsOneWidget);
      expect(findCartIcon, findsOneWidget);
      expect(findUserIcon, findsWidgets);
    });

    testWidgets("check the buttons actions for login user", (
      WidgetTester tester,
    ) async {
      //Arrange
      bool isLogin = true;
      bool goToTheCart = false;
      bool goToTheUserInfo = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppbars(
              appbarType: AppbarType.homeLogOutAppbar,
              cartonPressed: () => goToTheCart = true,
              useronPressed: () => goToTheUserInfo = true,
              logOutonPressed: () => isLogin = false,
              name: "Pepe",
              lastName: "Perez",
            ),
          ),
        ),
      );

      //act
      await tester.tap(find.byIcon(AppIcons.logout));
      await tester.tap(find.byIcon(AppIcons.cart));
      await tester.tap(find.byIcon(AppIcons.user));
      await tester.pump();

      //assert
      expect(isLogin, isFalse);
      expect(goToTheCart, isTrue);
      expect(goToTheUserInfo, isTrue);
    });
  });

  group('User Appbar', () {
    testWidgets("Check the texts and Icons on screen for user Appbar", (
      WidgetTester tester,
    ) async {
      //Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: CustomAppbars(
            appbarType: AppbarType.userAppbar,
            backonPressed: () {},
            cartonPressed: () {},
            logOutonPressed: () {},
            name: "Pepe",
            lastName: "Perez",
          ),
        ),
      );
      // Act
      final findUserName = find.text("Pepe Perez");
      final findLogoutIcon = find.byIcon(AppIcons.logout);
      final findCartIcon = find.byIcon(AppIcons.cart);
      final findBackIcon = find.byIcon(AppIcons.back);

      //assert
      expect(findUserName, findsOneWidget);
      expect(findLogoutIcon, findsOneWidget);
      expect(findCartIcon, findsOneWidget);
      expect(findBackIcon, findsOneWidget);
    });
    testWidgets("check the buttons actions for user appbar", (
      WidgetTester tester,
    ) async {
      //Arrange
      bool isLogin = true;
      bool goToTheCart = false;
      bool backToTheHome = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppbars(
              appbarType: AppbarType.userAppbar,
              cartonPressed: () => goToTheCart = true,
              backonPressed: () => backToTheHome = true,
              logOutonPressed: () => isLogin = false,
              name: "Pepe",
              lastName: "Perez",
            ),
          ),
        ),
      );

      //act
      await tester.tap(find.byIcon(AppIcons.logout));
      await tester.tap(find.byIcon(AppIcons.cart));
      await tester.tap(find.byIcon(AppIcons.back));
      await tester.pump();

      //assert
      expect(isLogin, isFalse);
      expect(goToTheCart, isTrue);
      expect(backToTheHome, isTrue);
    });
  });

  group('Products Appbar', () {
    testWidgets("Check the texts and Icons on screen for products Appbar", (
      WidgetTester tester,
    ) async {
      //Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: CustomAppbars(
            appbarType: AppbarType.productAppbar,
            backonPressed: () {},
            cartonPressed: () {},
            name: "Pepe",
            lastName: "Perez",
          ),
        ),
      );
      // Act
      final findUserName = find.text("Pepe Perez");
      final findCartIcon = find.byIcon(AppIcons.cart);
      final findBackIcon = find.byIcon(AppIcons.back);

      //assert
      expect(findUserName, findsNothing);
      expect(findCartIcon, findsOneWidget);
      expect(findBackIcon, findsOneWidget);
    });

    testWidgets("check the buttons actions for produts appbar", (
      WidgetTester tester,
    ) async {
      //Arrange
      bool goToTheCart = false;
      bool backToTheHome = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppbars(
              appbarType: AppbarType.productAppbar,
              cartonPressed: () => goToTheCart = true,
              backonPressed: () => backToTheHome = true,
            ),
          ),
        ),
      );

      //act
      await tester.tap(find.byIcon(AppIcons.cart));
      await tester.tap(find.byIcon(AppIcons.back));
      await tester.pump();

      //assert
      expect(goToTheCart, isTrue);
      expect(backToTheHome, isTrue);
    });
  });

  group('Cart Appbar', () {
    testWidgets("user is not login", (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppbars(
              appbarType: AppbarType.cartAppbarlogin,
              logInonPressed: () {},
              backonPressed: () {},
            ),
          ),
        ),
      );

      //act
      final findLoginIcon = find.byIcon(AppIcons.login);
      final findBackIcon = find.byIcon(AppIcons.back);

      //assert
      expect(findLoginIcon, findsOneWidget);
      expect(findBackIcon, findsOneWidget);
    });

    testWidgets("check the buttons actions for not login user", (
      WidgetTester tester,
    ) async {
      //Arrange
      bool isLogin = false;
      bool goBackHome = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppbars(
              appbarType: AppbarType.cartAppbarlogin,
              logInonPressed: () => isLogin = true,
              backonPressed: () => goBackHome = true,
            ),
          ),
        ),
      );

      //act
      await tester.tap(find.byIcon(AppIcons.login));
      await tester.tap(find.byIcon(AppIcons.back));
      await tester.pump();

      //assert
      expect(isLogin, isTrue);
      expect(goBackHome, isTrue);
    });

    testWidgets("user is login", (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppbars(
              appbarType: AppbarType.cartAppbarlogout,
              backonPressed: () {},
              logOutonPressed: () {},
              name: "Pepe",
              lastName: "Perez",
            ),
          ),
        ),
      );

      //act
      final findUserName = find.text("Pepe Perez");
      final findLogoutIcon = find.byIcon(AppIcons.logout);
      final findBackIcon = find.byIcon(AppIcons.back);

      //assert
      expect(findUserName, findsOneWidget);
      expect(findLogoutIcon, findsOneWidget);
      expect(findBackIcon, findsWidgets);
    });

    testWidgets("check the buttons actions for login user", (
      WidgetTester tester,
    ) async {
      //Arrange
      bool isLogin = true;
      bool goBackHome = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppbars(
              appbarType: AppbarType.cartAppbarlogout,
              backonPressed: () => goBackHome = true,
              logOutonPressed: () => isLogin = false,
              name: "Pepe",
              lastName: "Perez",
            ),
          ),
        ),
      );

      //act
      //act
      await tester.tap(find.byIcon(AppIcons.logout));
      await tester.tap(find.byIcon(AppIcons.back));

      await tester.pump();

      //assert
      expect(isLogin, isFalse);
      expect(goBackHome, isTrue);
    });
  });
}
