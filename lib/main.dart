import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:football_commentary_app/app.dart' show MainApp;
import 'package:football_commentary_app/core/di/dependency_injection.dart';
import 'package:football_commentary_app/core/env/environment_variables.dart';
import 'package:football_commentary_app/core/utils/notifications/notification_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ** Note : must be at the top
  await EnvironmentVariables.init();

  // Initialize Firebase with duplicate app handling
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    if (e.toString().contains('duplicate-app')) {
      // Firebase is already initialized, continue
      print('Firebase already initialized, continuing...');
    } else {
      // Re-throw other Firebase errors
      rethrow;
    }
  }

  // Setup dependency injection
  await setupGetIt();

  await FirebaseNotificationService().initNotifications();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  runApp(const MainApp());
}
