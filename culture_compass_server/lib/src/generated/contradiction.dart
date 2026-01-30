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

abstract class Contradiction
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = ContradictionTable();

  static const db = ContradictionRepository._();

  @override
  int? id;

  int roomId;

  int claimAId;

  int claimBId;

  String disagreementType;

  String explanation;

  int createdBy;

  DateTime createdAt;

  DateTime? resolvedAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static ContradictionInclude include() {
    return ContradictionInclude._();
  }

  static ContradictionIncludeList includeList({
    _i1.WhereExpressionBuilder<ContradictionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ContradictionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ContradictionTable>? orderByList,
    ContradictionInclude? include,
  }) {
    return ContradictionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Contradiction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Contradiction.t),
      include: include,
    );
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

class ContradictionTable extends _i1.Table<int?> {
  ContradictionTable({super.tableRelation})
      : super(tableName: 'contradictions') {
    roomId = _i1.ColumnInt(
      'roomId',
      this,
    );
    claimAId = _i1.ColumnInt(
      'claimAId',
      this,
    );
    claimBId = _i1.ColumnInt(
      'claimBId',
      this,
    );
    disagreementType = _i1.ColumnString(
      'disagreementType',
      this,
    );
    explanation = _i1.ColumnString(
      'explanation',
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
    resolvedAt = _i1.ColumnDateTime(
      'resolvedAt',
      this,
    );
  }

  late final _i1.ColumnInt roomId;

  late final _i1.ColumnInt claimAId;

  late final _i1.ColumnInt claimBId;

  late final _i1.ColumnString disagreementType;

  late final _i1.ColumnString explanation;

  late final _i1.ColumnInt createdBy;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime resolvedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        roomId,
        claimAId,
        claimBId,
        disagreementType,
        explanation,
        createdBy,
        createdAt,
        resolvedAt,
      ];
}

class ContradictionInclude extends _i1.IncludeObject {
  ContradictionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Contradiction.t;
}

class ContradictionIncludeList extends _i1.IncludeList {
  ContradictionIncludeList._({
    _i1.WhereExpressionBuilder<ContradictionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Contradiction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Contradiction.t;
}

class ContradictionRepository {
  const ContradictionRepository._();

  /// Returns a list of [Contradiction]s matching the given query parameters.
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
  Future<List<Contradiction>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ContradictionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ContradictionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ContradictionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Contradiction>(
      where: where?.call(Contradiction.t),
      orderBy: orderBy?.call(Contradiction.t),
      orderByList: orderByList?.call(Contradiction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Contradiction] matching the given query parameters.
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
  Future<Contradiction?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ContradictionTable>? where,
    int? offset,
    _i1.OrderByBuilder<ContradictionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ContradictionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Contradiction>(
      where: where?.call(Contradiction.t),
      orderBy: orderBy?.call(Contradiction.t),
      orderByList: orderByList?.call(Contradiction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Contradiction] by its [id] or null if no such row exists.
  Future<Contradiction?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Contradiction>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Contradiction]s in the list and returns the inserted rows.
  ///
  /// The returned [Contradiction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Contradiction>> insert(
    _i1.Session session,
    List<Contradiction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Contradiction>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Contradiction] and returns the inserted row.
  ///
  /// The returned [Contradiction] will have its `id` field set.
  Future<Contradiction> insertRow(
    _i1.Session session,
    Contradiction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Contradiction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Contradiction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Contradiction>> update(
    _i1.Session session,
    List<Contradiction> rows, {
    _i1.ColumnSelections<ContradictionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Contradiction>(
      rows,
      columns: columns?.call(Contradiction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Contradiction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Contradiction> updateRow(
    _i1.Session session,
    Contradiction row, {
    _i1.ColumnSelections<ContradictionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Contradiction>(
      row,
      columns: columns?.call(Contradiction.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Contradiction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Contradiction>> delete(
    _i1.Session session,
    List<Contradiction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Contradiction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Contradiction].
  Future<Contradiction> deleteRow(
    _i1.Session session,
    Contradiction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Contradiction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Contradiction>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ContradictionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Contradiction>(
      where: where(Contradiction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ContradictionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Contradiction>(
      where: where?.call(Contradiction.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
