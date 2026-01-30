/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class RoomEvent
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  RoomEvent._({
    required this.type,
    required this.roomId,
    required this.payload,
    required this.createdAt,
  });

  factory RoomEvent({
    required String type,
    required int roomId,
    required String payload,
    required DateTime createdAt,
  }) = _RoomEventImpl;

  factory RoomEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return RoomEvent(
      type: jsonSerialization['type'] as String,
      roomId: jsonSerialization['roomId'] as int,
      payload: jsonSerialization['payload'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  String type;

  int roomId;

  String payload;

  DateTime createdAt;

  /// Returns a shallow copy of this [RoomEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RoomEvent copyWith({
    String? type,
    int? roomId,
    String? payload,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'roomId': roomId,
      'payload': payload,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'type': type,
      'roomId': roomId,
      'payload': payload,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RoomEventImpl extends RoomEvent {
  _RoomEventImpl({
    required String type,
    required int roomId,
    required String payload,
    required DateTime createdAt,
  }) : super._(
          type: type,
          roomId: roomId,
          payload: payload,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [RoomEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RoomEvent copyWith({
    String? type,
    int? roomId,
    String? payload,
    DateTime? createdAt,
  }) {
    return RoomEvent(
      type: type ?? this.type,
      roomId: roomId ?? this.roomId,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
