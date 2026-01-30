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

abstract class Brief implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = BriefTable();

  static const db = BriefRepository._();

  @override
  int? id;

  int roomId;

  String markdown;

  int version;

  int createdBy;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'roomId': roomId,
      'markdown': markdown,
      'version': version,
      'createdBy': createdBy,
      'createdAt': createdAt.toJson(),
    };
  }

  static BriefInclude include() {
    return BriefInclude._();
  }

  static BriefIncludeList includeList({
    _i1.WhereExpressionBuilder<BriefTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BriefTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BriefTable>? orderByList,
    BriefInclude? include,
  }) {
    return BriefIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Brief.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Brief.t),
      include: include,
    );
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

class BriefTable extends _i1.Table<int?> {
  BriefTable({super.tableRelation}) : super(tableName: 'briefs') {
    roomId = _i1.ColumnInt(
      'roomId',
      this,
    );
    markdown = _i1.ColumnString(
      'markdown',
      this,
    );
    version = _i1.ColumnInt(
      'version',
      this,
    );
    createdBy = _i1.ColumnInt(
      'createdBy',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnInt roomId;

  late final _i1.ColumnString markdown;

  late final _i1.ColumnInt version;

  late final _i1.ColumnInt createdBy;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        roomId,
        markdown,
        version,
        createdBy,
        createdAt,
      ];
}

class BriefInclude extends _i1.IncludeObject {
  BriefInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Brief.t;
}

class BriefIncludeList extends _i1.IncludeList {
  BriefIncludeList._({
    _i1.WhereExpressionBuilder<BriefTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Brief.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Brief.t;
}

class BriefRepository {
  const BriefRepository._();

  /// Returns a list of [Brief]s matching the given query parameters.
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
  Future<List<Brief>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BriefTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BriefTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BriefTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Brief>(
      where: where?.call(Brief.t),
      orderBy: orderBy?.call(Brief.t),
      orderByList: orderByList?.call(Brief.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Brief] matching the given query parameters.
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
  Future<Brief?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BriefTable>? where,
    int? offset,
    _i1.OrderByBuilder<BriefTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BriefTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Brief>(
      where: where?.call(Brief.t),
      orderBy: orderBy?.call(Brief.t),
      orderByList: orderByList?.call(Brief.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Brief] by its [id] or null if no such row exists.
  Future<Brief?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Brief>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Brief]s in the list and returns the inserted rows.
  ///
  /// The returned [Brief]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Brief>> insert(
    _i1.Session session,
    List<Brief> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Brief>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Brief] and returns the inserted row.
  ///
  /// The returned [Brief] will have its `id` field set.
  Future<Brief> insertRow(
    _i1.Session session,
    Brief row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Brief>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Brief]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Brief>> update(
    _i1.Session session,
    List<Brief> rows, {
    _i1.ColumnSelections<BriefTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Brief>(
      rows,
      columns: columns?.call(Brief.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Brief]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Brief> updateRow(
    _i1.Session session,
    Brief row, {
    _i1.ColumnSelections<BriefTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Brief>(
      row,
      columns: columns?.call(Brief.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Brief]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Brief>> delete(
    _i1.Session session,
    List<Brief> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Brief>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Brief].
  Future<Brief> deleteRow(
    _i1.Session session,
    Brief row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Brief>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Brief>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BriefTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Brief>(
      where: where(Brief.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BriefTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Brief>(
      where: where?.call(Brief.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
