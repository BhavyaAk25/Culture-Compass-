import 'dart:io';

import 'package:serverpod/serverpod.dart';

class ReportRoute extends Route {
  ReportRoute() : super();

  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    final file = File('web/app/index.html');
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
