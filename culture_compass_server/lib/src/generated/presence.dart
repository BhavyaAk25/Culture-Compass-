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

abstract class Presence
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = PresenceTable();

  static const db = PresenceRepository._();

  @override
  int? id;

  int roomId;

  int userId;

  String status;

  DateTime lastSeenAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'roomId': roomId,
      'userId': userId,
      'status': status,
      'lastSeenAt': lastSeenAt.toJson(),
    };
  }

  static PresenceInclude include() {
    return PresenceInclude._();
  }

  static PresenceIncludeList includeList({
    _i1.WhereExpressionBuilder<PresenceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PresenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PresenceTable>? orderByList,
    PresenceInclude? include,
  }) {
    return PresenceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Presence.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Presence.t),
      include: include,
    );
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

class PresenceTable extends _i1.Table<int?> {
  PresenceTable({super.tableRelation}) : super(tableName: 'presences') {
    roomId = _i1.ColumnInt(
      'roomId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    lastSeenAt = _i1.ColumnDateTime(
      'lastSeenAt',
      this,
    );
  }

  late final _i1.ColumnInt roomId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString status;

  late final _i1.ColumnDateTime lastSeenAt;

  @override
  List<_i1.Column> get columns => [
        id,
        roomId,
        userId,
        status,
        lastSeenAt,
      ];
}

class PresenceInclude extends _i1.IncludeObject {
  PresenceInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Presence.t;
}

class PresenceIncludeList extends _i1.IncludeList {
  PresenceIncludeList._({
    _i1.WhereExpressionBuilder<PresenceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Presence.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Presence.t;
}

class PresenceRepository {
  const PresenceRepository._();

  /// Returns a list of [Presence]s matching the given query parameters.
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
  Future<List<Presence>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PresenceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PresenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PresenceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Presence>(
      where: where?.call(Presence.t),
      orderBy: orderBy?.call(Presence.t),
      orderByList: orderByList?.call(Presence.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Presence] matching the given query parameters.
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
  Future<Presence?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PresenceTable>? where,
    int? offset,
    _i1.OrderByBuilder<PresenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PresenceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Presence>(
      where: where?.call(Presence.t),
      orderBy: orderBy?.call(Presence.t),
      orderByList: orderByList?.call(Presence.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Presence] by its [id] or null if no such row exists.
  Future<Presence?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Presence>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Presence]s in the list and returns the inserted rows.
  ///
  /// The returned [Presence]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Presence>> insert(
    _i1.Session session,
    List<Presence> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Presence>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Presence] and returns the inserted row.
  ///
  /// The returned [Presence] will have its `id` field set.
  Future<Presence> insertRow(
    _i1.Session session,
    Presence row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Presence>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Presence]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Presence>> update(
    _i1.Session session,
    List<Presence> rows, {
    _i1.ColumnSelections<PresenceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Presence>(
      rows,
      columns: columns?.call(Presence.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Presence]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Presence> updateRow(
    _i1.Session session,
    Presence row, {
    _i1.ColumnSelections<PresenceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Presence>(
      row,
      columns: columns?.call(Presence.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Presence]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Presence>> delete(
    _i1.Session session,
    List<Presence> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Presence>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Presence].
  Future<Presence> deleteRow(
    _i1.Session session,
    Presence row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Presence>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Presence>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PresenceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Presence>(
      where: where(Presence.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PresenceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Presence>(
      where: where?.call(Presence.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
