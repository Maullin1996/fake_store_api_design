import 'package:fake_store_design/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock/mock_json_config.dart';

void main() {
  group('AtomicDesignConfig', () {
    setUp(() {
      AtomicDesignConfig.reset();
    });

    test('should initialize correctly from JSON string', () async {
      await AtomicDesignConfig.initializeFromJsonString(mockJsonConfig);

      expect(AtomicDesignConfig.isInitialized, isTrue);
      final config = AtomicDesignConfig.instance.config;

      expect(config.colors['primary'], '#FFFFFF');
      expect(config.spacing['small'], 4.0);
      expect(config.typography.fonts['main'], 'Roboto');
      expect(config.typography.sizes['body'], 14.0);
      expect(config.copys.appBartText['title'], 'App Title');
      expect(config.copys.customDialogs.emptyCart, 'Cart is empty');
    });

    test('should throw exception for invalid JSON', () {
      const invalidJson = '{ "invalid": true ';

      expect(
        () => AtomicDesignConfig.initializeFromJsonString(invalidJson),
        throwsException,
      );
    });

    test('should reset singleton', () async {
      await AtomicDesignConfig.initializeFromJsonString(mockJsonConfig);
      expect(AtomicDesignConfig.isInitialized, true);

      AtomicDesignConfig.reset();
      expect(AtomicDesignConfig.isInitialized, false);
    });
  });
}
