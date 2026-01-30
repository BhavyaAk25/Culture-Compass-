import 'dart:convert';
import 'dart:io';

import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

class ReportApiRoute extends Route {
  ReportApiRoute() : super();

  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    final slug = _extractSlug(request.uri.pathSegments);
    if (slug == null) {
      request.response.statusCode = HttpStatus.badRequest;
      await request.response.close();
      return true;
    }

    final room = await Room.db.findFirstRow(
      session,
      where: (t) => t.publicSlug.equals(slug),
    );
    if (room == null) {
      request.response.statusCode = HttpStatus.notFound;
      await request.response.close();
      return true;
    }

    final sources = await Source.db.find(
      session,
      where: (t) => t.roomId.equals(room.id!),
    );
    final claims = await Claim.db.find(
      session,
      where: (t) => t.roomId.equals(room.id!),
    );
    final contradictions = await Contradiction.db.find(
      session,
      where: (t) => t.roomId.equals(room.id!),
    );
    final brief = await Brief.db.findFirstRow(
      session,
      where: (t) => t.roomId.equals(room.id!),
      orderBy: (t) => t.version,
      orderDescending: true,
    );

    final payload = {
      'room': room.toJson(),
      'brief': brief?.toJson(),
      'sources': sources.map((s) => s.toJson()).toList(),
      'claims': claims.map((c) => c.toJson()).toList(),
      'contradictions': contradictions.map((c) => c.toJson()).toList(),
    };

    request.response.headers.contentType = ContentType.json;
    request.response.write(jsonEncode(payload));
    await request.response.close();
    return true;
  }

  String? _extractSlug(List<String> segments) {
    final reportIndex = segments.indexOf('report');
    if (reportIndex == -1 || reportIndex + 1 >= segments.length) {
      return null;
    }
    return segments[reportIndex + 1];
  }
}
