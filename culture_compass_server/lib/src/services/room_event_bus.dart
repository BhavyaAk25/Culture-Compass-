import 'dart:convert';

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class RoomEventBus {
  RoomEventBus._();

  static String channel(int roomId) => 'room:$roomId';

  static Future<void> sourceAdded(Session session, int roomId, int sourceId) {
    return _emit(
      session,
      RoomEvent(
        type: 'source_added',
        roomId: roomId,
        payload: jsonEncode({'sourceId': sourceId}),
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  static Future<void> claimAdded(Session session, int roomId, int claimId) {
    return _emit(
      session,
      RoomEvent(
        type: 'claim_added',
        roomId: roomId,
        payload: jsonEncode({'claimId': claimId}),
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  static Future<void> contradictionAdded(
    Session session,
    int roomId,
    int contradictionId,
  ) {
    return _emit(
      session,
      RoomEvent(
        type: 'contradiction_added',
        roomId: roomId,
        payload: jsonEncode({'contradictionId': contradictionId}),
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  static Future<void> briefUpdated(Session session, int roomId) {
    return _emit(
      session,
      RoomEvent(
        type: 'brief_updated',
        roomId: roomId,
        payload: jsonEncode({}),
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  static Future<void> memberJoined(Session session, int roomId, int userId) {
    return _emit(
      session,
      RoomEvent(
        type: 'member_joined',
        roomId: roomId,
        payload: jsonEncode({'userId': userId}),
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  static Future<void> _emit(Session session, RoomEvent event) async {
    await session.messages.postMessage(channel(event.roomId), event);
  }
}
