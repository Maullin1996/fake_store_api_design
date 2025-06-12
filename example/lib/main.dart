import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:example/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AtomicDesignConfig.initializeFromAsset('assets/config/app_config.json');
  await SemanticsConfig.initializeFromAsset(
    'assets/locale/en/semantics_json.json',
  );
  runApp(ProviderScope(child: const MyApp()));
}
