import 'package:culture_compass_server/src/birthday_reminder.dart';
import 'package:serverpod/serverpod.dart';

import 'package:culture_compass_server/src/web/routes/flutter_app_route.dart';
import 'package:culture_compass_server/src/web/routes/report_api.dart';
import 'package:culture_compass_server/src/web/routes/report_route.dart';
import 'package:culture_compass_server/src/web/routes/root_redirect_route.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(args, Protocol(), Endpoints());

  // Friendly entrypoint for the web domain.
  pod.webServer.addRoute(RootRedirectRoute(), '/');

  // Flutter web app at `/app/*` (assets) with SPA fallback.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'flutter', basePath: '/'),
    '/app/*',
  );
  pod.webServer.addRoute(FlutterAppRoute(), '/app/*');

  // Public report JSON API and report route.
  pod.webServer.addRoute(ReportApiRoute(), '/api/report/*');
  pod.webServer.addRoute(ReportRoute(), '/report/*');

  // Serve built web report assets.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'app', basePath: '/'),
    '/*',
  );

  // Start the server.
  await pod.start();

  // After starting the server, you can register future calls. Future calls are
  // tasks that need to happen in the future, or independently of the request/
  // response cycle. For example, you can use future calls to send emails, or to
  // schedule tasks to be executed at a later time. Future calls are executed in
  // the background. Their schedule is persisted to the database, so you will
  // not lose them if the server is restarted.

  pod.registerFutureCall(
    BirthdayReminder(),
    FutureCallNames.birthdayReminder.name,
  );

  // You can schedule future calls for a later time during startup. But you can
  // also schedule them in any endpoint or webroute through the session object.
  // there is also [futureCallAtTime] if you want to schedule a future call at a
  // specific time.
  await pod.futureCallWithDelay(
    FutureCallNames.birthdayReminder.name,
    Greeting(
      message: 'Hello!',
      author: 'Serverpod Server',
      timestamp: DateTime.now(),
    ),
    Duration(seconds: 5),
  );
}

/// Names of all future calls in the server.
///
/// This is better than using a string literal, as it will reduce the risk of
/// typos and make it easier to refactor the code.
enum FutureCallNames { birthdayReminder }
