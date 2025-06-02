import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_design/atoms/app_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets("renders a Image.asset with bad conection", (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AppNetworkImage(
          url: 'w',
          assetsImage: 'assets/test/company_info.png',
        ),
      ),
    );
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final image = tester.widget<Image>(imageFinder);
    expect(image.image, isA<CachedNetworkImageProvider>());
  });
  testWidgets("renders a NetworkImage with internet conection", (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AppNetworkImage(
          url:
              'https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
          assetsImage: 'assets/test/company_info.png',
        ),
      ),
    );
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final image = tester.widget<Image>(imageFinder);
    expect(image.image, isA<CachedNetworkImageProvider>());
  });

  testWidgets("applies custom width and height", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AppNetworkImage(
          url:
              'https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
          assetsImage: 'assets/test/company_info.png',
          widthImage: 400,
          heightImage: 200,
        ),
      ),
    );

    final image = tester.widget<Image>(find.byType(Image));
    expect(image.width, 400);
    expect(image.height, 200);
  });

  testWidgets("shows CircularProgressIndicator while loading", (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AppNetworkImage(
          url: 'https://example.com/loading-image.jpg',
          assetsImage: 'assets/test/company_info.png',
        ),
      ),
    );

    // The image should be loading
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
  });
  testWidgets("creates CachedNetworkImage with correct URL", (
    WidgetTester tester,
  ) async {
    const testUrl = 'https://example.com/test-image.jpg';

    await tester.pumpWidget(
      const MaterialApp(
        home: AppNetworkImage(
          url: testUrl,
          assetsImage: 'assets/test/company_info.png',
        ),
      ),
    );

    final cachedNetworkImage = tester.widget<CachedNetworkImage>(
      find.byType(CachedNetworkImage),
    );

    expect(cachedNetworkImage.imageUrl, equals(testUrl));
  });

  testWidgets("handles null width and height correctly", (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AppNetworkImage(
          url: 'https://example.com/test-image.jpg',
          assetsImage: 'assets/test/company_info.png',
        ),
      ),
    );

    final cachedNetworkImage = tester.widget<CachedNetworkImage>(
      find.byType(CachedNetworkImage),
    );

    expect(cachedNetworkImage.width, isNull);
    expect(cachedNetworkImage.height, isNull);
  });
}
