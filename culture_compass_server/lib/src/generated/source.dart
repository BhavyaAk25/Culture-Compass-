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

abstract class Source implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = SourceTable();

  static const db = SourceRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static SourceInclude include() {
    return SourceInclude._();
  }

  static SourceIncludeList includeList({
    _i1.WhereExpressionBuilder<SourceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SourceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SourceTable>? orderByList,
    SourceInclude? include,
  }) {
    return SourceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Source.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Source.t),
      include: include,
    );
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

class SourceTable extends _i1.Table<int?> {
  SourceTable({super.tableRelation}) : super(tableName: 'sources') {
    roomId = _i1.ColumnInt(
      'roomId',
      this,
    );
    url = _i1.ColumnString(
      'url',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    author = _i1.ColumnString(
      'author',
      this,
    );
    publishedAt = _i1.ColumnDateTime(
      'publishedAt',
      this,
    );
    snippet = _i1.ColumnString(
      'snippet',
      this,
    );
    regionTag = _i1.ColumnString(
      'regionTag',
      this,
    );
    disciplineTag = _i1.ColumnString(
      'disciplineTag',
      this,
    );
    stanceTag = _i1.ColumnString(
      'stanceTag',
      this,
    );
    addedBy = _i1.ColumnInt(
      'addedBy',
      this,
    );
    addedAt = _i1.ColumnDateTime(
      'addedAt',
      this,
    );
  }

  late final _i1.ColumnInt roomId;

  late final _i1.ColumnString url;

  late final _i1.ColumnString title;

  late final _i1.ColumnString author;

  late final _i1.ColumnDateTime publishedAt;

  late final _i1.ColumnString snippet;

  late final _i1.ColumnString regionTag;

  late final _i1.ColumnString disciplineTag;

  late final _i1.ColumnString stanceTag;

  late final _i1.ColumnInt addedBy;

  late final _i1.ColumnDateTime addedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        roomId,
        url,
        title,
        author,
        publishedAt,
        snippet,
        regionTag,
        disciplineTag,
        stanceTag,
        addedBy,
        addedAt,
      ];
}

class SourceInclude extends _i1.IncludeObject {
  SourceInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Source.t;
}

class SourceIncludeList extends _i1.IncludeList {
  SourceIncludeList._({
    _i1.WhereExpressionBuilder<SourceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Source.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Source.t;
}

class SourceRepository {
  const SourceRepository._();

  /// Returns a list of [Source]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Source>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SourceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SourceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SourceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Source>(
      where: where?.call(Source.t),
      orderBy: orderBy?.call(Source.t),
      orderByList: orderByList?.call(Source.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Source] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Source?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SourceTable>? where,
    int? offset,
    _i1.OrderByBuilder<SourceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SourceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Source>(
      where: where?.call(Source.t),
      orderBy: orderBy?.call(Source.t),
      orderByList: orderByList?.call(Source.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Source] by its [id] or null if no such row exists.
  Future<Source?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Source>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Source]s in the list and returns the inserted rows.
  ///
  /// The returned [Source]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Source>> insert(
    _i1.Session session,
    List<Source> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Source>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Source] and returns the inserted row.
  ///
  /// The returned [Source] will have its `id` field set.
  Future<Source> insertRow(
    _i1.Session session,
    Source row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Source>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Source]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Source>> update(
    _i1.Session session,
    List<Source> rows, {
    _i1.ColumnSelections<SourceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Source>(
      rows,
      columns: columns?.call(Source.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Source]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Source> updateRow(
    _i1.Session session,
    Source row, {
    _i1.ColumnSelections<SourceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Source>(
      row,
      columns: columns?.call(Source.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Source]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Source>> delete(
    _i1.Session session,
    List<Source> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Source>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Source].
  Future<Source> deleteRow(
    _i1.Session session,
    Source row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Source>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Source>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SourceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Source>(
      where: where(Source.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SourceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Source>(
      where: where?.call(Source.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
