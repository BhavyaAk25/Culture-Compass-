import 'dart:math';

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/room_event_bus.dart';

class RoomEndpoint extends Endpoint {
  Future<Room> createRoom(
    Session session,
    String title,
    String? description,
    int userId,
  ) async {
    final now = DateTime.now().toUtc();
    final room = Room(
      code: _generateInviteCode(),
      title: title.trim().isEmpty ? 'Untitled Room' : title.trim(),
      description: description?.trim(),
      createdBy: userId,
      createdAt: now,
      publicSlug: null,
      publishedAt: null,
    );

    final inserted = await Room.db.insertRow(session, room);
    await _ensureMember(session, inserted.id!, userId, role: 'owner');
    await RoomEventBus.memberJoined(session, inserted.id!, userId);
    return inserted;
  }

  Future<Room?> joinByCode(Session session, String code, int userId) async {
    final room = await Room.db.findFirstRow(
      session,
      where: (t) => t.code.equals(code.trim()),
    );
    if (room == null) return null;

    await _ensureMember(session, room.id!, userId, role: 'member');
    await RoomEventBus.memberJoined(session, room.id!, userId);
    return room;
  }

  Future<List<Room>> listUserRooms(Session session, int userId) async {
    final memberships = await RoomMember.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );
    if (memberships.isEmpty) return [];

    final roomIds = memberships.map((m) => m.roomId).toSet();
    return Room.db.find(
      session,
      where: (t) => t.id.inSet(roomIds),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  Future<Room?> getRoom(Session session, int roomId) async {
    return Room.db.findById(session, roomId);
  }

  Future<List<UserProfile>> listRoomMembers(
    Session session,
    int roomId,
  ) async {
    final memberships = await RoomMember.db.find(
      session,
      where: (t) => t.roomId.equals(roomId),
    );
    if (memberships.isEmpty) return [];

    final userIds = memberships.map((m) => m.userId).toSet();
    return UserProfile.db.find(
      session,
      where: (t) => t.id.inSet(userIds),
    );
  }

  Future<Room?> publishRoom(Session session, int roomId) async {
    var room = await Room.db.findById(session, roomId);
    if (room == null) return null;

    final slug = room.publicSlug ?? _generateSlug(room.title);
    room = room.copyWith(
      publicSlug: slug,
      publishedAt: DateTime.now().toUtc(),
    );
    await Room.db.updateRow(session, room);
    await RoomEventBus.briefUpdated(session, roomId);
    return room;
  }

  Future<void> _ensureMember(
    Session session,
    int roomId,
    int userId, {
    required String role,
  }) async {
    final existing = await RoomMember.db.findFirstRow(
      session,
      where: (t) => t.roomId.equals(roomId) & t.userId.equals(userId),
    );
    if (existing != null) return;

    await RoomMember.db.insertRow(
      session,
      RoomMember(
        roomId: roomId,
        userId: userId,
        role: role,
        joinedAt: DateTime.now().toUtc(),
      ),
    );
  }

  String _generateInviteCode() {
    const chars = 'ABCDEFGHJKMNPQRSTUVWXYZ23456789';
    final rand = Random();
    return List.generate(6, (_) => chars[rand.nextInt(chars.length)]).join();
  }

  String _generateSlug(String title) {
    final sanitized = title
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s-]'), '')
        .replaceAll(RegExp(r'\s+'), '-')
        .replaceAll(RegExp(r'-+'), '-')
        .trim();
    final suffix = Random().nextInt(9999).toString().padLeft(4, '0');
    return '${sanitized.isEmpty ? 'report' : sanitized}-$suffix';
  }
}
