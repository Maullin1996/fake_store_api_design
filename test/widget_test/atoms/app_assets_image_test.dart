import 'package:fake_store_design/atoms/tokens.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets("renders an Image.asset with only path", (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AppAssetsImage(path: 'assets/test/company_info.png'),
      ),
    );

    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final image = tester.widget<Image>(imageFinder);
    expect(image.image, isA<AssetImage>());
    expect(
      (image.image as AssetImage).assetName,
      'assets/test/company_info.png',
    );
  });

  testWidgets("applies custom width and height", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AppAssetsImage(
          path: 'assets/test/company_info.png',
          widthImage: 400,
          heightImage: 200,
        ),
      ),
    );

    final image = tester.widget<Image>(find.byType(Image));
    expect(image.width, 400);
    expect(image.height, 200);
  });
}
