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

abstract class Brief implements _i1.SerializableModel {
  Brief._({
    this.id,
    required this.roomId,
    required this.markdown,
    required this.version,
    required this.createdBy,
    required this.createdAt,
  });

  factory Brief({
    int? id,
    required int roomId,
    required String markdown,
    required int version,
    required int createdBy,
    required DateTime createdAt,
  }) = _BriefImpl;

  factory Brief.fromJson(Map<String, dynamic> jsonSerialization) {
    return Brief(
      id: jsonSerialization['id'] as int?,
      roomId: jsonSerialization['roomId'] as int,
      markdown: jsonSerialization['markdown'] as String,
      version: jsonSerialization['version'] as int,
      createdBy: jsonSerialization['createdBy'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int roomId;

  String markdown;

  int version;

  int createdBy;

  DateTime createdAt;

  /// Returns a shallow copy of this [Brief]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Brief copyWith({
    int? id,
    int? roomId,
    String? markdown,
    int? version,
    int? createdBy,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'roomId': roomId,
      'markdown': markdown,
      'version': version,
      'createdBy': createdBy,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BriefImpl extends Brief {
  _BriefImpl({
    int? id,
    required int roomId,
    required String markdown,
    required int version,
    required int createdBy,
    required DateTime createdAt,
  }) : super._(
          id: id,
          roomId: roomId,
          markdown: markdown,
          version: version,
          createdBy: createdBy,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Brief]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Brief copyWith({
    Object? id = _Undefined,
    int? roomId,
    String? markdown,
    int? version,
    int? createdBy,
    DateTime? createdAt,
  }) {
    return Brief(
      id: id is int? ? id : this.id,
      roomId: roomId ?? this.roomId,
      markdown: markdown ?? this.markdown,
      version: version ?? this.version,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
