import 'dart:convert';

import 'package:fake_store_design/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AtomicDesignConfig {
  static AtomicDesignConfig? _instance;
  static AtomicDesignConfig get instance => _instance!;

  late AppConfig _config;
  AppConfig get config => _config;

  AtomicDesignConfig._();

  static Future<void> initializeFromJsonString(String jsonString) async {
    _instance = AtomicDesignConfig._();

    try {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      _instance!._config = AppConfig.fromJson(jsonMap);
    } catch (error) {
      throw Exception('Error parsing JSON configuration: $error');
    }
  }

  static Future<void> initializeFromAsset(String assetPath) async {
    _instance = AtomicDesignConfig._();

    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      _instance!._config = AppConfig.fromJson(jsonMap);
    } catch (error) {
      throw Exception('Error loading configuration from asset: $error');
    }
  }

  // Solo para testing
  @visibleForTesting
  static void reset() {
    _instance = null;
  }

  static bool get isInitialized => _instance != null;
}
