import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_design/design_system.dart';

class InputTextScreen extends StatefulWidget {
  const InputTextScreen({super.key});

  @override
  State<InputTextScreen> createState() => _InputTextScreenState();
}

class _InputTextScreenState extends State<InputTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Input Text',
        colorType: ColorType.primary,
      ),
      backgroundColor: Colors.white,
      body: Center(child: AppInputText(label: 'Title')),
    );
  }
}
