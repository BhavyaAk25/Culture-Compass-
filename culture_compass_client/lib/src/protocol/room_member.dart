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

abstract class RoomMember implements _i1.SerializableModel {
  RoomMember._({
    this.id,
    required this.roomId,
    required this.userId,
    required this.role,
    required this.joinedAt,
  });

  factory RoomMember({
    int? id,
    required int roomId,
    required int userId,
    required String role,
    required DateTime joinedAt,
  }) = _RoomMemberImpl;

  factory RoomMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return RoomMember(
      id: jsonSerialization['id'] as int?,
      roomId: jsonSerialization['roomId'] as int,
      userId: jsonSerialization['userId'] as int,
      role: jsonSerialization['role'] as String,
      joinedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['joinedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int roomId;

  int userId;

  String role;

  DateTime joinedAt;

  /// Returns a shallow copy of this [RoomMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RoomMember copyWith({
    int? id,
    int? roomId,
    int? userId,
    String? role,
    DateTime? joinedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'roomId': roomId,
      'userId': userId,
      'role': role,
      'joinedAt': joinedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoomMemberImpl extends RoomMember {
  _RoomMemberImpl({
    int? id,
    required int roomId,
    required int userId,
    required String role,
    required DateTime joinedAt,
  }) : super._(
          id: id,
          roomId: roomId,
          userId: userId,
          role: role,
          joinedAt: joinedAt,
        );

  /// Returns a shallow copy of this [RoomMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RoomMember copyWith({
    Object? id = _Undefined,
    int? roomId,
    int? userId,
    String? role,
    DateTime? joinedAt,
  }) {
    return RoomMember(
      id: id is int? ? id : this.id,
      roomId: roomId ?? this.roomId,
      userId: userId ?? this.userId,
      role: role ?? this.role,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }
}
