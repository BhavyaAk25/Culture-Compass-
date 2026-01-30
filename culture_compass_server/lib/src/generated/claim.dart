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

abstract class Claim implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = ClaimTable();

  static const db = ClaimRepository._();

  @override
  int? id;

  int roomId;

  int sourceId;

  String claimText;

  String quote;

  int createdBy;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static ClaimInclude include() {
    return ClaimInclude._();
  }

  static ClaimIncludeList includeList({
    _i1.WhereExpressionBuilder<ClaimTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ClaimTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ClaimTable>? orderByList,
    ClaimInclude? include,
  }) {
    return ClaimIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Claim.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Claim.t),
      include: include,
    );
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

class ClaimTable extends _i1.Table<int?> {
  ClaimTable({super.tableRelation}) : super(tableName: 'claims') {
    roomId = _i1.ColumnInt(
      'roomId',
      this,
    );
    sourceId = _i1.ColumnInt(
      'sourceId',
      this,
    );
    claimText = _i1.ColumnString(
      'claimText',
      this,
    );
    quote = _i1.ColumnString(
      'quote',
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

  late final _i1.ColumnInt sourceId;

  late final _i1.ColumnString claimText;

  late final _i1.ColumnString quote;

  late final _i1.ColumnInt createdBy;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        roomId,
        sourceId,
        claimText,
        quote,
        createdBy,
        createdAt,
      ];
}

class ClaimInclude extends _i1.IncludeObject {
  ClaimInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Claim.t;
}

class ClaimIncludeList extends _i1.IncludeList {
  ClaimIncludeList._({
    _i1.WhereExpressionBuilder<ClaimTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Claim.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Claim.t;
}

class ClaimRepository {
  const ClaimRepository._();

  /// Returns a list of [Claim]s matching the given query parameters.
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
  Future<List<Claim>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ClaimTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ClaimTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ClaimTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Claim>(
      where: where?.call(Claim.t),
      orderBy: orderBy?.call(Claim.t),
      orderByList: orderByList?.call(Claim.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Claim] matching the given query parameters.
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
  Future<Claim?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ClaimTable>? where,
    int? offset,
    _i1.OrderByBuilder<ClaimTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ClaimTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Claim>(
      where: where?.call(Claim.t),
      orderBy: orderBy?.call(Claim.t),
      orderByList: orderByList?.call(Claim.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Claim] by its [id] or null if no such row exists.
  Future<Claim?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Claim>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Claim]s in the list and returns the inserted rows.
  ///
  /// The returned [Claim]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Claim>> insert(
    _i1.Session session,
    List<Claim> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Claim>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Claim] and returns the inserted row.
  ///
  /// The returned [Claim] will have its `id` field set.
  Future<Claim> insertRow(
    _i1.Session session,
    Claim row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Claim>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Claim]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Claim>> update(
    _i1.Session session,
    List<Claim> rows, {
    _i1.ColumnSelections<ClaimTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Claim>(
      rows,
      columns: columns?.call(Claim.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Claim]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Claim> updateRow(
    _i1.Session session,
    Claim row, {
    _i1.ColumnSelections<ClaimTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Claim>(
      row,
      columns: columns?.call(Claim.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Claim]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Claim>> delete(
    _i1.Session session,
    List<Claim> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Claim>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Claim].
  Future<Claim> deleteRow(
    _i1.Session session,
    Claim row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Claim>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Claim>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ClaimTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Claim>(
      where: where(Claim.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ClaimTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Claim>(
      where: where?.call(Claim.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
