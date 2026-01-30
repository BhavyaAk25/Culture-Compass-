import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/room_event_bus.dart';

class ContradictionEndpoint extends Endpoint {
  Future<Contradiction> addContradiction(
    Session session,
    int roomId,
    int claimAId,
    int claimBId,
    String type,
    String explanation,
    int userId,
  ) async {
    final contradiction = Contradiction(
      roomId: roomId,
      claimAId: claimAId,
      claimBId: claimBId,
      disagreementType: type,
      explanation: explanation.trim(),
      createdBy: userId,
      createdAt: DateTime.now().toUtc(),
      resolvedAt: null,
    );

    final inserted = await Contradiction.db.insertRow(session, contradiction);
    await RoomEventBus.contradictionAdded(session, roomId, inserted.id!);
    return inserted;
  }

  Future<List<Contradiction>> listContradictions(
    Session session,
    int roomId,
  ) async {
    return Contradiction.db.find(
      session,
      where: (t) => t.roomId.equals(roomId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }
}
