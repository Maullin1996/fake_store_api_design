import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fake_store_design/design_system.dart';

class InputTextScreen extends StatefulWidget {
  const InputTextScreen({super.key});

  @override
  State<InputTextScreen> createState() => _InputTextScreenState();
}

class _InputTextScreenState extends State<InputTextScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryVariant,
        title: Text(
          'Input Text',
          style: textTheme.displayMedium?.copyWith(
            color: AppColors.onPrimary,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.onPrimary,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.onPrimary),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: AppInputText(
          label: 'Title',
          inputTextSize: InputTextSize.medium,
        ),
      ),
    );
  }
}
