import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/room_event_bus.dart';

class ClaimEndpoint extends Endpoint {
  Future<Claim> addClaim(
    Session session,
    int roomId,
    int sourceId,
    String claimText,
    String quote,
    int userId,
  ) async {
    final claim = Claim(
      roomId: roomId,
      sourceId: sourceId,
      claimText: claimText.trim(),
      quote: quote.trim(),
      createdBy: userId,
      createdAt: DateTime.now().toUtc(),
    );

    final inserted = await Claim.db.insertRow(session, claim);
    await RoomEventBus.claimAdded(session, roomId, inserted.id!);
    return inserted;
  }

  Future<List<Claim>> listClaims(Session session, int roomId) async {
    return Claim.db.find(
      session,
      where: (t) => t.roomId.equals(roomId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }
}
