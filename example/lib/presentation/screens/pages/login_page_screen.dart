import 'package:example/presentation/providers/api_response/sign_in_provider.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPageScreen extends ConsumerStatefulWidget {
  const LoginPageScreen({super.key});

  @override
  ConsumerState<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends ConsumerState<LoginPageScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginProvider = ref.watch(authenticationProvider);

    ref.listen<SignInApiResponse>(authenticationProvider, (previous, current) {
      if (current.errorMessage != null &&
          previous?.errorMessage != current.errorMessage) {
        CustomFloatingNotifications(
          errorMessage: current.errorMessage,
        ).productVerification(TypeVerification.errorMessage);
      }
      if (current.token != null) {
        context.go('/home_page');
      }
    });

    return Form(
      key: _formKey,
      child: LoginTemplate(
        isLoadingButton: loginProvider.isLoading,
        passwordController: _passwordController,
        usernameController: _usernameController,
        validatorUsername: (username) {
          if (username == null || username.isEmpty) {
            return 'Empty Field';
          }
          return null;
        },
        validatorPassword: (password) {
          if (password == null || password.isEmpty) {
            return 'Empty Field';
          }
          return null;
        },
        backonPressed: () {
          context.pop();
        },
        cartonPressed: () {
          context.go('/cart_page');
        },
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ref
                .read(authenticationProvider.notifier)
                .fetchAuthentication(
                  _usernameController.text,
                  _passwordController.text,
                );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
