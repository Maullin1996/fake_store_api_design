import 'package:example/config/mock/user_mock.dart';
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
  bool isLoading = false;

  void _handleLogIn(String username, String password) async {
    if (username == userMock.username && password == userMock.password) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(milliseconds: 1400));
      setState(() {
        isLoading = false;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.pop('/home_page');
        }
      });
    } else {
      CustomFloatingNotifications(
        errorMessage: 'Invalid credentials',
      ).customNotification(TypeVerification.errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: LoginTemplate(
        isLoadingButton: isLoading,
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
        cartonPressed: () {},
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _handleLogIn(_usernameController.text, _passwordController.text);
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
