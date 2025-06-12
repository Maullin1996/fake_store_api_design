import 'dart:convert';

import 'package:fake_store_design/config/semantics_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SemanticsConfig {
  static SemanticsConfig? _instance;
  static SemanticsConfig get instance => _instance!;

  late SemanticsData _data;
  SemanticsData get data => _data;

  SemanticsConfig._();

  /// Initialize from a raw JSON string
  static Future<void> initializeFromJsonString(String jsonString) async {
    _instance = SemanticsConfig._();

    try {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      _instance!._data = SemanticsData.fromJson(jsonMap);
    } catch (error) {
      throw Exception('Error parsing semantics JSON: $error');
    }
  }

  /// Initialize from an asset path (e.g., 'assets/semantics.json')
  static Future<void> initializeFromAsset(String assetPath) async {
    _instance = SemanticsConfig._();

    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      _instance!._data = SemanticsData.fromJson(jsonMap);
    } catch (error) {
      throw Exception('Error loading semantics from asset: $error');
    }
  }

  /// For testing purposes
  @visibleForTesting
  static void reset() {
    _instance = null;
  }

  static bool get isInitialized => _instance != null;
}
