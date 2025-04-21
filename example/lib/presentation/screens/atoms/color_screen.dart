import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter/material.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final Map<String, Color> colors = {
      "Primary color": AppColors.primary,
      "Primary Variant ": AppColors.primaryVariant,
      "Secondary": AppColors.secondary,
      "Secondary Variant": AppColors.secondaryVariant,
      "Background": AppColors.background,
      "surface": AppColors.surface,
      "Error": AppColors.error,
      "onPrimary": AppColors.onPrimary,
      "onSecondary": AppColors.onSecondary,
      "onBackground": AppColors.onBackground,
      "onSurface": AppColors.onSurface,
      "onError": AppColors.onError,
      "background Text": AppColors.backgroundText,
      "disabled Button": AppColors.disabledButton,
      "background TextFormField": AppColors.backgroundTextFormField,
      "background Flutter Toast": AppColors.backgroundFlutterToast,
      "text Flutter Toast": AppColors.textFlutterToast,
      "background Flutter Toast Error": AppColors.backgroundFlutterToastError,
      "text Flutter Toast Error": AppColors.textFlutterToastError,
    };
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Colors',
        colorType: ColorType.primary,
      ),
      backgroundColor: Colors.white,
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
        ),
        itemCount: colors.length,
        itemBuilder: (BuildContext context, int index) {
          final colorKeys = colors.keys.elementAt(index);
          final colorValues = colors.values.elementAt(index);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                colorKeys,
                textAlign: TextAlign.center,
                style: textTheme.displaySmall,
              ),
              SizedBox(height: 10),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(5, 5),
                      color: Colors.black54,
                      blurRadius: 8,
                      spreadRadius: 3,
                    ),
                  ],
                  color: colorValues,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
