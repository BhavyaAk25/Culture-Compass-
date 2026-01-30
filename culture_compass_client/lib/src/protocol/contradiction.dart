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

abstract class Contradiction implements _i1.SerializableModel {
  Contradiction._({
    this.id,
    required this.roomId,
    required this.claimAId,
    required this.claimBId,
    required this.disagreementType,
    required this.explanation,
    required this.createdBy,
    required this.createdAt,
    this.resolvedAt,
  });

  factory Contradiction({
    int? id,
    required int roomId,
    required int claimAId,
    required int claimBId,
    required String disagreementType,
    required String explanation,
    required int createdBy,
    required DateTime createdAt,
    DateTime? resolvedAt,
  }) = _ContradictionImpl;

  factory Contradiction.fromJson(Map<String, dynamic> jsonSerialization) {
    return Contradiction(
      id: jsonSerialization['id'] as int?,
      roomId: jsonSerialization['roomId'] as int,
      claimAId: jsonSerialization['claimAId'] as int,
      claimBId: jsonSerialization['claimBId'] as int,
      disagreementType: jsonSerialization['disagreementType'] as String,
      explanation: jsonSerialization['explanation'] as String,
      createdBy: jsonSerialization['createdBy'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int roomId;

  int claimAId;

  int claimBId;

  String disagreementType;

  String explanation;

  int createdBy;

  DateTime createdAt;

  DateTime? resolvedAt;

  /// Returns a shallow copy of this [Contradiction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Contradiction copyWith({
    int? id,
    int? roomId,
    int? claimAId,
    int? claimBId,
    String? disagreementType,
    String? explanation,
    int? createdBy,
    DateTime? createdAt,
    DateTime? resolvedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'roomId': roomId,
      'claimAId': claimAId,
      'claimBId': claimBId,
      'disagreementType': disagreementType,
      'explanation': explanation,
      'createdBy': createdBy,
      'createdAt': createdAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ContradictionImpl extends Contradiction {
  _ContradictionImpl({
    int? id,
    required int roomId,
    required int claimAId,
    required int claimBId,
    required String disagreementType,
    required String explanation,
    required int createdBy,
    required DateTime createdAt,
    DateTime? resolvedAt,
  }) : super._(
          id: id,
          roomId: roomId,
          claimAId: claimAId,
          claimBId: claimBId,
          disagreementType: disagreementType,
          explanation: explanation,
          createdBy: createdBy,
          createdAt: createdAt,
          resolvedAt: resolvedAt,
        );

  /// Returns a shallow copy of this [Contradiction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Contradiction copyWith({
    Object? id = _Undefined,
    int? roomId,
    int? claimAId,
    int? claimBId,
    String? disagreementType,
    String? explanation,
    int? createdBy,
    DateTime? createdAt,
    Object? resolvedAt = _Undefined,
  }) {
    return Contradiction(
      id: id is int? ? id : this.id,
      roomId: roomId ?? this.roomId,
      claimAId: claimAId ?? this.claimAId,
      claimBId: claimBId ?? this.claimBId,
      disagreementType: disagreementType ?? this.disagreementType,
      explanation: explanation ?? this.explanation,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
    );
  }
}
