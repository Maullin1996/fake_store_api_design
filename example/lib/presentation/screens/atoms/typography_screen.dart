import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final List<String> typographyFonts = [
      AppTypography.familyRoboto,
      AppTypography.familyOpenSans,
      AppTypography.familyKarla,
    ];

    final Map<double, String> typographySizes = {
      AppTypography.body: "Font-size 18px 'body'",
      AppTypography.h5: "Font-size 12px 'h5'",
      AppTypography.h4: "Font-size 16px 'h4'",
      AppTypography.h3: "Font-size 22px 'h3'",
      AppTypography.h2: "Font-size 28px 'h2'",
      AppTypography.h1: "Font-size 36px 'h1'",
    };

    final Map<String, Map<double, String>> typographys = {
      "Family Roboto used to headings:": typographySizes,
      "Family OpenSans used to body text:": typographySizes,
      "Family OpenSans used to product prices:": typographySizes,
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryVariant,
        title: Text(
          'Typography',
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
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        itemCount: typographyFonts.length,
        itemBuilder: (BuildContext context, int index) {
          final typographyfont = typographyFonts[index];
          final typographyText = typographys.keys.elementAt(index);
          final typographydescription = typographys.values.elementAt(index);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                typographyText,
                style: TextStyle(
                  color: AppColors.onSurface,
                  fontFamily: typographyfont,
                  fontSize: AppTypography.h3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: typographydescription.length,
                itemBuilder: (BuildContext context, int sizes) {
                  final description = typographydescription.values.elementAt(
                    sizes,
                  );
                  final size = typographydescription.keys.elementAt(sizes);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                          color: AppColors.onSurface,
                          fontFamily: typographyfont,
                          fontSize: AppTypography.h4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Fake App Store App Fonts Sizes',
                        style: TextStyle(
                          color: AppColors.onSurface,
                          fontFamily: typographyfont,
                          fontSize: size,
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  );
                },
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: Divider(thickness: 5, color: Colors.black),
          );
        },
      ),
    );
  }
}
