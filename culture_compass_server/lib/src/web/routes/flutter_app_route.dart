import 'dart:io';

import 'package:serverpod/serverpod.dart';

/// Serves the Flutter web app shell for any `/app/*` route that isn't a static
/// asset.
///
/// Static assets are served by [RouteStaticDirectory] in `server.dart`. This
/// route is a fallback that enables client-side routing (GoRouter).
class FlutterAppRoute extends Route {
  FlutterAppRoute() : super();

  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    final file = File('web/flutter/app/index.html');
    if (!await file.exists()) {
      request.response.statusCode = HttpStatus.notFound;
      await request.response.close();
      return true;
    }

    request.response.headers.contentType =
        ContentType('text', 'html', charset: 'utf-8');
    request.response.write(await file.readAsString());
    await request.response.close();
    return true;
  }
}
