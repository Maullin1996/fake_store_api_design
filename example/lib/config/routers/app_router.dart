import 'package:example/domain/models/product_entity.dart';
import 'package:example/presentation/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),

    //Atoms
    GoRoute(path: '/atoms', builder: (context, state) => const AtomsScreens()),
    GoRoute(path: '/colors', builder: (context, state) => const ColorScreen()),
    GoRoute(
      path: '/typography',
      builder: (context, state) => const TypographyScreen(),
    ),
    GoRoute(path: '/icons', builder: (context, state) => const IconsScreen()),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/inputText',
      builder: (context, state) => const InputTextScreen(),
    ),
    GoRoute(
      path: '/spacing-radius',
      builder: (context, state) => const SpacingRadiusScreen(),
    ),

    //molecules
    GoRoute(
      path: '/molecules',
      builder: (context, state) => const MoleculesScreens(),
    ),
    GoRoute(
      path: '/customsappbars',
      builder: (context, state) => const CustomAppbar(),
    ),
    GoRoute(path: '/user_info', builder: (context, state) => const UserInfo()),
    GoRoute(
      path: '/authentication_message',
      builder: (context, state) => const AuthenticationMessage(),
    ),
    GoRoute(
      path: '/product_complements',
      builder: (context, state) => const ProductComplements(),
    ),

    //organismz
    GoRoute(
      path: '/organisms',
      builder: (context, state) => const OrganismsScreens(),
    ),
    GoRoute(
      path: '/login_form',
      builder: (context, state) => const LoginFormScreen(),
    ),
    GoRoute(
      path: '/custom_dialogs',
      builder: (context, state) => const CustomDialogs(),
    ),
    GoRoute(
      path: '/product_cart',
      builder: (context, state) => const ProductCart(),
    ),
    GoRoute(
      path: '/product_home',
      builder: (context, state) => const ProductHome(),
    ),
    GoRoute(
      path: '/product_info_holder',
      builder: (context, state) => const ProductInfoHolder(),
    ),

    //tamplates
    GoRoute(
      path: '/templates',
      builder: (context, state) => const TemplateScreens(),
    ),
    GoRoute(
      path: '/home_template',
      builder: (context, state) => const HomeTemplateScreen(),
    ),
    GoRoute(
      path: '/user_template',
      builder: (context, state) => const UserTemplateScreen(),
    ),
    GoRoute(
      path: '/product_template',
      builder: (context, state) => const ProductTemplateScreen(),
    ),
    GoRoute(
      path: '/cart_template',
      builder: (context, state) => const CartTemplateScreen(),
    ),
    GoRoute(
      path: '/login_template',
      builder: (context, state) => const LoginTemplateScreen(),
    ),

    //Pages
    GoRoute(path: '/pages', builder: (context, state) => const PagesScreens()),
    GoRoute(
      path: '/login_page',
      builder: (context, state) => const LoginPageScreen(),
      pageBuilder: (context, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: LoginPageScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      path: '/cart_page',
      builder: (context, state) => const CartPageScreen(),
      pageBuilder: (context, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: CartPageScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      path: '/home_page',
      builder: (context, state) => const HomePageScreen(),
      pageBuilder: (context, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: HomePageScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      path: '/user_page',
      builder: (context, state) => const UserPageScreen(),
      pageBuilder: (context, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: UserPageScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      path: '/product_page',
      builder: (context, state) {
        final Product product = state.extra as Product;
        return ProductPageScreen(product: product);
      },
      pageBuilder: (context, state) {
        final Product product = state.extra as Product;
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: ProductPageScreen(product: product),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
  ],
);
