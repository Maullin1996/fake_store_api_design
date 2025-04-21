import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_design/molecules/molecules.dart';

class AuthenticationMessage extends StatelessWidget {
  const AuthenticationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Authentication message',
        colorType: ColorType.primary,
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [AuthenticationWelcome()],
      ),
    );
  }
}
