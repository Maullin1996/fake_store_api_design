import 'package:example/presentation/home_screen.dart';
import 'package:example/presentation/screens/pages/cart_page_screen.dart';
import 'package:example/presentation/screens/pages/home_page_screen.dart';
import 'package:example/presentation/screens/pages/login_page_screen.dart';
import 'package:example/presentation/screens/pages/user_page_screen.dart';
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
      path: '/product_info',
      builder: (context, state) => const ProductInfo(),
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
      path: '/product_holders',
      builder: (context, state) => const ProductHolders(),
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
    ),
    GoRoute(
      path: '/cart_page',
      builder: (context, state) => const CartPageScreen(),
    ),
    GoRoute(
      path: '/home_page',
      builder: (context, state) => const HomePageScreen(),
    ),
    GoRoute(
      path: '/user_page',
      builder: (context, state) => const UserPageScreen(),
    ),
  ],
);
