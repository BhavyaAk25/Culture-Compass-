import 'dart:io';

import 'package:serverpod/serverpod.dart';

/// Redirects `/` to the Flutter web app entrypoint.
class RootRedirectRoute extends Route {
  RootRedirectRoute() : super();

  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    request.response.statusCode = HttpStatus.found;
    request.response.headers.set(HttpHeaders.locationHeader, '/app/');
    await request.response.close();
    return true;
  }
}
