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

abstract class Claim implements _i1.SerializableModel {
  Claim._({
    this.id,
    required this.roomId,
    required this.sourceId,
    required this.claimText,
    required this.quote,
    required this.createdBy,
    required this.createdAt,
  });

  factory Claim({
    int? id,
    required int roomId,
    required int sourceId,
    required String claimText,
    required String quote,
    required int createdBy,
    required DateTime createdAt,
  }) = _ClaimImpl;

  factory Claim.fromJson(Map<String, dynamic> jsonSerialization) {
    return Claim(
      id: jsonSerialization['id'] as int?,
      roomId: jsonSerialization['roomId'] as int,
      sourceId: jsonSerialization['sourceId'] as int,
      claimText: jsonSerialization['claimText'] as String,
      quote: jsonSerialization['quote'] as String,
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

  int sourceId;

  String claimText;

  String quote;

  int createdBy;

  DateTime createdAt;

  /// Returns a shallow copy of this [Claim]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Claim copyWith({
    int? id,
    int? roomId,
    int? sourceId,
    String? claimText,
    String? quote,
    int? createdBy,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'roomId': roomId,
      'sourceId': sourceId,
      'claimText': claimText,
      'quote': quote,
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

class _ClaimImpl extends Claim {
  _ClaimImpl({
    int? id,
    required int roomId,
    required int sourceId,
    required String claimText,
    required String quote,
    required int createdBy,
    required DateTime createdAt,
  }) : super._(
          id: id,
          roomId: roomId,
          sourceId: sourceId,
          claimText: claimText,
          quote: quote,
          createdBy: createdBy,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Claim]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Claim copyWith({
    Object? id = _Undefined,
    int? roomId,
    int? sourceId,
    String? claimText,
    String? quote,
    int? createdBy,
    DateTime? createdAt,
  }) {
    return Claim(
      id: id is int? ? id : this.id,
      roomId: roomId ?? this.roomId,
      sourceId: sourceId ?? this.sourceId,
      claimText: claimText ?? this.claimText,
      quote: quote ?? this.quote,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
