import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate_flutter/app.dart';
import 'package:boilerplate_flutter/core/di/injector.dart';
import 'package:boilerplate_flutter/core/storage/hive-storage/hive_storage.dart';
import 'package:boilerplate_flutter/core/storage/hive-storage/hive_storage_service.dart';
import 'package:boilerplate_flutter/core/third-party/environment.dart';
import 'package:boilerplate_flutter/core/utils/logger.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

EventBus eventBus = EventBus();

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // Read the environment from the ENVIRONMENT variable
    const environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev');
    const env = environment == 'prod' ? Environmentx.prod : Environmentx.staging;

    await initializeCore(environment: env);

    // Initialize the .env Environments
    await dotenv.load(fileName: ".env");

    final HiveStorageBase initializeStorageService = HiveStorageService();
    await initializeStorageService.init();

    eventBus.on().listen((event) {});

    final container = ProviderContainer(
      overrides: [
        hiveStorageService.overrideWithValue(initializeStorageService),
      ],
    );

    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const MyApp(
          env: environment,
        ),
      ),
    );
  }, (error, stack) {
    logger.error(error.toString());
  });
}
