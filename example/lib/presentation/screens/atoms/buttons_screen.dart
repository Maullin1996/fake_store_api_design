import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final Map<String, ButtonType> buttonsType = {
      'Primary Fill Button ': ButtonType.primaryFillButton,
      'Secondary Fill Button ': ButtonType.secondaryFillButton,
      'Primary Text Button': ButtonType.primaryTextButton,
      'Secondary Text Button': ButtonType.secondaryTextButton,
    };
    final Map<String, ButtonType> iconButtonType = {
      'Primary Icon Button ': ButtonType.primaryIconButton,
      'Secondary Icon Button ': ButtonType.secondaryIconButton,
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Buttons',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: buttonsType.length,
              itemBuilder: (BuildContext context, int index) {
                final text = buttonsType.keys.elementAt(index);
                final type = buttonsType.values.elementAt(index);
                return Center(
                  child: Column(
                    children: [
                      Text(text, style: textTheme.displayLarge),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: AppButtons(
                          title: 'Button',
                          type: type,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: AppButtons(
                          title: 'Button',
                          type: type,
                          onPressed: null,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(thickness: 5);
              },
            ),
            Divider(thickness: 5),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: iconButtonType.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(thickness: 5);
              },
              itemBuilder: (BuildContext context, int index) {
                final text = iconButtonType.keys.elementAt(index);
                final type = iconButtonType.values.elementAt(index);
                return Center(
                  child: Column(
                    children: [
                      Text(text, style: textTheme.displayLarge),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: AppButtons(
                          icon: AppIcons.home,
                          iconSize: 40,
                          type: type,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: AppButtons(
                          icon: AppIcons.city,
                          iconSize: 40,
                          type: type,
                          onPressed: null,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
