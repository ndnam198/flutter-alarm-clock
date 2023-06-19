import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'navigation/router_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Handle errors that are not caught by FlutterError.onError and PlatformDispatcher.onError
  ErrorWidget.builder = (FlutterErrorDetails details) => Container(
        alignment: Alignment.center,
        child: Text(
          'Error!\n${details.exception}',
          style: const TextStyle(color: Colors.orange),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
      );

  // Handle errors that are not caught by FlutterError.onError and PlatformDispatcher.onError
  runZonedGuarded(
    () {
      runApp(const ProviderScope(
        child: AlarmApp(),
      ));
    },
    (
      error,
      stackTrace,
    ) {
      //TODO FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    },
  );
}

class AlarmApp extends ConsumerWidget {
  const AlarmApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
