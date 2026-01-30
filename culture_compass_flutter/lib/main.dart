import 'package:culture_compass_client/culture_compass_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'core/providers/router_provider.dart';
import 'core/theme/app_theme.dart';

/// Global client object for server communication
late final Client client;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Server URL configuration
  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  final serverUrl =
      serverUrlFromEnv.isEmpty ? 'http://$localhost:8080/' : serverUrlFromEnv;

  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor();

  runApp(
    const ProviderScope(
      child: CultureCompassApp(),
    ),
  );
}

class CultureCompassApp extends StatelessWidget {
  const CultureCompassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final router = ref.watch(routerProvider);
        return MaterialApp.router(
          title: 'Culture Compass',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          routerConfig: router,
        );
      },
    );
  }
}
