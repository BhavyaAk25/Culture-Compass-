/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Presence implements _i1.SerializableModel {
  Presence._({
    this.id,
    required this.roomId,
    required this.userId,
    required this.status,
    required this.lastSeenAt,
  });

  factory Presence({
    int? id,
    required int roomId,
    required int userId,
    required String status,
    required DateTime lastSeenAt,
  }) = _PresenceImpl;

  factory Presence.fromJson(Map<String, dynamic> jsonSerialization) {
    return Presence(
      id: jsonSerialization['id'] as int?,
      roomId: jsonSerialization['roomId'] as int,
      userId: jsonSerialization['userId'] as int,
      status: jsonSerialization['status'] as String,
      lastSeenAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastSeenAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int roomId;

  int userId;

  String status;

  DateTime lastSeenAt;

  /// Returns a shallow copy of this [Presence]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Presence copyWith({
    int? id,
    int? roomId,
    int? userId,
    String? status,
    DateTime? lastSeenAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'roomId': roomId,
      'userId': userId,
      'status': status,
      'lastSeenAt': lastSeenAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PresenceImpl extends Presence {
  _PresenceImpl({
    int? id,
    required int roomId,
    required int userId,
    required String status,
    required DateTime lastSeenAt,
  }) : super._(
          id: id,
          roomId: roomId,
          userId: userId,
          status: status,
          lastSeenAt: lastSeenAt,
        );

  /// Returns a shallow copy of this [Presence]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Presence copyWith({
    Object? id = _Undefined,
    int? roomId,
    int? userId,
    String? status,
    DateTime? lastSeenAt,
  }) {
    return Presence(
      id: id is int? ? id : this.id,
      roomId: roomId ?? this.roomId,
      userId: userId ?? this.userId,
      status: status ?? this.status,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
    );
  }
}
