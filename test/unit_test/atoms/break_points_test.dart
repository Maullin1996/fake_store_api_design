import 'package:fake_store_design/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResponsiveDesign', () {
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await AtomicDesignConfig.initializeFromAsset(
        'assets/config/app_config.json',
      );
    });
    test('should set correct properties for xsmall width', () {
      final design = ResponsiveDesign(width: 350);

      expect(design.columnAmount, 2);
      expect(design.childAspectRatio, 0.47);
      expect(design.appInputTextWidth, 310); // 350 - 40
      expect(design.descriptionCartContainer, false);
      expect(design.iconZise, 25);
      expect(design.cartHorizontalPadding, AppSpacing.small);
    });

    test('should set correct properties for small-xsmedium width', () {
      final design = ResponsiveDesign(width: 600);

      expect(design.columnAmount, 3);
      expect(design.childAspectRatio, 0.5);
      expect(design.descriptionCartContainer, false);
      expect(design.cartHorizontalPadding, AppSpacing.medium);
    });

    test('should set correct properties for medium', () {
      final design = ResponsiveDesign(width: 800);

      expect(design.columnAmount, 3);
      expect(design.childAspectRatio, 0.55);
      expect(design.imageHomeContainerWidth, 130);
      expect(design.iconZise, 28);
    });

    test('should set correct properties for large widths', () {
      final design = ResponsiveDesign(width: 1600);

      expect(design.columnAmount, 6);
      expect(design.imageinfoContainerWidth, 450);
      expect(design.iconZise, 35);
      expect(design.descriptionCartContainer, true);
    });

    test('should fallback to default values for very small width', () {
      final design = ResponsiveDesign(width: 300);

      expect(design.columnAmount, 1);
      expect(design.descriptionCartContainer, false);
    });
  });
}
