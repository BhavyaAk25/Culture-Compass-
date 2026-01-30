import 'dart:io';

import 'package:html/parser.dart' as html_parser;
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/room_event_bus.dart';

class SourceEndpoint extends Endpoint {
  Future<Source> addSource(
    Session session,
    int roomId,
    String url,
    String? snippet,
    int userId,
    String? regionTag,
    String? disciplineTag,
    String? stanceTag,
  ) async {
    final metadata = await _fetchMetadata(url);

    final source = Source(
      roomId: roomId,
      url: url.trim(),
      title: metadata.title,
      author: metadata.author,
      publishedAt: metadata.publishedAt,
      snippet: snippet?.trim().isNotEmpty == true
          ? snippet!.trim()
          : metadata.description,
      regionTag: regionTag,
      disciplineTag: disciplineTag,
      stanceTag: stanceTag,
      addedBy: userId,
      addedAt: DateTime.now().toUtc(),
    );

    final inserted = await Source.db.insertRow(session, source);
    await RoomEventBus.sourceAdded(session, roomId, inserted.id!);
    return inserted;
  }

  Future<List<Source>> listSources(Session session, int roomId) async {
    return Source.db.find(
      session,
      where: (t) => t.roomId.equals(roomId),
      orderBy: (t) => t.addedAt,
      orderDescending: true,
    );
  }

  Stream<RoomEvent> streamRoomEvents(Session session, int roomId) {
    return session.messages.createStream<RoomEvent>(
      RoomEventBus.channel(roomId),
    );
  }

  Future<_SourceMetadata> _fetchMetadata(String url) async {
    try {
      final response = await http.get(Uri.parse(url)).timeout(
            const Duration(seconds: 6),
          );
      if (response.statusCode < 200 || response.statusCode >= 400) {
        return _SourceMetadata();
      }

      final document = html_parser.parse(response.body);
      String? title = document
              .querySelector('meta[property="og:title"]')
              ?.attributes['content'] ??
          document.querySelector('title')?.text;

      String? description = document
              .querySelector('meta[name="description"]')
              ?.attributes['content'] ??
          document
              .querySelector('meta[property="og:description"]')
              ?.attributes['content'];

      String? author = document
              .querySelector('meta[name="author"]')
              ?.attributes['content'] ??
          document
              .querySelector('meta[property="article:author"]')
              ?.attributes['content'];

      DateTime? publishedAt;
      final publishedRaw = document
              .querySelector('meta[property="article:published_time"]')
              ?.attributes['content'] ??
          document.querySelector('meta[name="pubdate"]')?.attributes['content'];
      if (publishedRaw != null) {
        publishedAt = DateTime.tryParse(publishedRaw);
      }

      return _SourceMetadata(
        title: _cleanText(title),
        description: _cleanText(description),
        author: _cleanText(author),
        publishedAt: publishedAt,
      );
    } on SocketException {
      return _SourceMetadata();
    } catch (_) {
      return _SourceMetadata();
    }
  }

  String? _cleanText(String? input) {
    if (input == null) return null;
    final normalized = input.replaceAll(RegExp(r'\s+'), ' ').trim();
    return normalized.isEmpty ? null : normalized;
  }
}

class _SourceMetadata {
  final String? title;
  final String? description;
  final String? author;
  final DateTime? publishedAt;

  _SourceMetadata({
    this.title,
    this.description,
    this.author,
    this.publishedAt,
  });
}
