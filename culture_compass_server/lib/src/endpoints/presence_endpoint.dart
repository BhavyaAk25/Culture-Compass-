import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class PresenceEndpoint extends Endpoint {
  Future<void> setStatus(
    Session session,
    int roomId,
    int userId,
    String status,
  ) async {
    final now = DateTime.now().toUtc();
    var presence = await Presence.db.findFirstRow(
      session,
      where: (t) => t.roomId.equals(roomId) & t.userId.equals(userId),
    );

    if (presence == null) {
      presence = Presence(
        roomId: roomId,
        userId: userId,
        status: status,
        lastSeenAt: now,
      );
      presence = await Presence.db.insertRow(session, presence);
    } else {
      presence = presence.copyWith(status: status, lastSeenAt: now);
      presence = await Presence.db.updateRow(session, presence);
    }

    await session.messages.postMessage(_channel(roomId), presence);
  }

  Future<void> heartbeat(Session session, int roomId, int userId) async {
    final now = DateTime.now().toUtc();
    var presence = await Presence.db.findFirstRow(
      session,
      where: (t) => t.roomId.equals(roomId) & t.userId.equals(userId),
    );
    if (presence == null) {
      presence = Presence(
        roomId: roomId,
        userId: userId,
        status: 'online',
        lastSeenAt: now,
      );
      presence = await Presence.db.insertRow(session, presence);
    } else {
      presence = presence.copyWith(lastSeenAt: now);
      presence = await Presence.db.updateRow(session, presence);
    }

    await session.messages.postMessage(_channel(roomId), presence);
  }

  Stream<Presence> streamPresence(Session session, int roomId) {
    return session.messages.createStream<Presence>(_channel(roomId));
  }

  String _channel(int roomId) => 'presence:$roomId';
}
