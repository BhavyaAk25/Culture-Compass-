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

abstract class Source implements _i1.SerializableModel {
  Source._({
    this.id,
    required this.roomId,
    required this.url,
    this.title,
    this.author,
    this.publishedAt,
    this.snippet,
    this.regionTag,
    this.disciplineTag,
    this.stanceTag,
    required this.addedBy,
    required this.addedAt,
  });

  factory Source({
    int? id,
    required int roomId,
    required String url,
    String? title,
    String? author,
    DateTime? publishedAt,
    String? snippet,
    String? regionTag,
    String? disciplineTag,
    String? stanceTag,
    required int addedBy,
    required DateTime addedAt,
  }) = _SourceImpl;

  factory Source.fromJson(Map<String, dynamic> jsonSerialization) {
    return Source(
      id: jsonSerialization['id'] as int?,
      roomId: jsonSerialization['roomId'] as int,
      url: jsonSerialization['url'] as String,
      title: jsonSerialization['title'] as String?,
      author: jsonSerialization['author'] as String?,
      publishedAt: jsonSerialization['publishedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['publishedAt']),
      snippet: jsonSerialization['snippet'] as String?,
      regionTag: jsonSerialization['regionTag'] as String?,
      disciplineTag: jsonSerialization['disciplineTag'] as String?,
      stanceTag: jsonSerialization['stanceTag'] as String?,
      addedBy: jsonSerialization['addedBy'] as int,
      addedAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['addedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int roomId;

  String url;

  String? title;

  String? author;

  DateTime? publishedAt;

  String? snippet;

  String? regionTag;

  String? disciplineTag;

  String? stanceTag;

  int addedBy;

  DateTime addedAt;

  /// Returns a shallow copy of this [Source]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Source copyWith({
    int? id,
    int? roomId,
    String? url,
    String? title,
    String? author,
    DateTime? publishedAt,
    String? snippet,
    String? regionTag,
    String? disciplineTag,
    String? stanceTag,
    int? addedBy,
    DateTime? addedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'roomId': roomId,
      'url': url,
      if (title != null) 'title': title,
      if (author != null) 'author': author,
      if (publishedAt != null) 'publishedAt': publishedAt?.toJson(),
      if (snippet != null) 'snippet': snippet,
      if (regionTag != null) 'regionTag': regionTag,
      if (disciplineTag != null) 'disciplineTag': disciplineTag,
      if (stanceTag != null) 'stanceTag': stanceTag,
      'addedBy': addedBy,
      'addedAt': addedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SourceImpl extends Source {
  _SourceImpl({
    int? id,
    required int roomId,
    required String url,
    String? title,
    String? author,
    DateTime? publishedAt,
    String? snippet,
    String? regionTag,
    String? disciplineTag,
    String? stanceTag,
    required int addedBy,
    required DateTime addedAt,
  }) : super._(
          id: id,
          roomId: roomId,
          url: url,
          title: title,
          author: author,
          publishedAt: publishedAt,
          snippet: snippet,
          regionTag: regionTag,
          disciplineTag: disciplineTag,
          stanceTag: stanceTag,
          addedBy: addedBy,
          addedAt: addedAt,
        );

  /// Returns a shallow copy of this [Source]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Source copyWith({
    Object? id = _Undefined,
    int? roomId,
    String? url,
    Object? title = _Undefined,
    Object? author = _Undefined,
    Object? publishedAt = _Undefined,
    Object? snippet = _Undefined,
    Object? regionTag = _Undefined,
    Object? disciplineTag = _Undefined,
    Object? stanceTag = _Undefined,
    int? addedBy,
    DateTime? addedAt,
  }) {
    return Source(
      id: id is int? ? id : this.id,
      roomId: roomId ?? this.roomId,
      url: url ?? this.url,
      title: title is String? ? title : this.title,
      author: author is String? ? author : this.author,
      publishedAt: publishedAt is DateTime? ? publishedAt : this.publishedAt,
      snippet: snippet is String? ? snippet : this.snippet,
      regionTag: regionTag is String? ? regionTag : this.regionTag,
      disciplineTag:
          disciplineTag is String? ? disciplineTag : this.disciplineTag,
      stanceTag: stanceTag is String? ? stanceTag : this.stanceTag,
      addedBy: addedBy ?? this.addedBy,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
