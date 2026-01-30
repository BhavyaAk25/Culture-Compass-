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

abstract class RoomMember
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  RoomMember._({
    this.id,
    required this.roomId,
    required this.userId,
    required this.role,
    required this.joinedAt,
  });

  factory RoomMember({
    int? id,
    required int roomId,
    required int userId,
    required String role,
    required DateTime joinedAt,
  }) = _RoomMemberImpl;

  factory RoomMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return RoomMember(
      id: jsonSerialization['id'] as int?,
      roomId: jsonSerialization['roomId'] as int,
      userId: jsonSerialization['userId'] as int,
      role: jsonSerialization['role'] as String,
      joinedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['joinedAt']),
    );
  }

  static final t = RoomMemberTable();

  static const db = RoomMemberRepository._();

  @override
  int? id;

  int roomId;

  int userId;

  String role;

  DateTime joinedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [RoomMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RoomMember copyWith({
    int? id,
    int? roomId,
    int? userId,
    String? role,
    DateTime? joinedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'roomId': roomId,
      'userId': userId,
      'role': role,
      'joinedAt': joinedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'roomId': roomId,
      'userId': userId,
      'role': role,
      'joinedAt': joinedAt.toJson(),
    };
  }

  static RoomMemberInclude include() {
    return RoomMemberInclude._();
  }

  static RoomMemberIncludeList includeList({
    _i1.WhereExpressionBuilder<RoomMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoomMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoomMemberTable>? orderByList,
    RoomMemberInclude? include,
  }) {
    return RoomMemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RoomMember.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RoomMember.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoomMemberImpl extends RoomMember {
  _RoomMemberImpl({
    int? id,
    required int roomId,
    required int userId,
    required String role,
    required DateTime joinedAt,
  }) : super._(
          id: id,
          roomId: roomId,
          userId: userId,
          role: role,
          joinedAt: joinedAt,
        );

  /// Returns a shallow copy of this [RoomMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RoomMember copyWith({
    Object? id = _Undefined,
    int? roomId,
    int? userId,
    String? role,
    DateTime? joinedAt,
  }) {
    return RoomMember(
      id: id is int? ? id : this.id,
      roomId: roomId ?? this.roomId,
      userId: userId ?? this.userId,
      role: role ?? this.role,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }
}

class RoomMemberTable extends _i1.Table<int?> {
  RoomMemberTable({super.tableRelation}) : super(tableName: 'room_members') {
    roomId = _i1.ColumnInt(
      'roomId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    role = _i1.ColumnString(
      'role',
      this,
    );
    joinedAt = _i1.ColumnDateTime(
      'joinedAt',
      this,
    );
  }

  late final _i1.ColumnInt roomId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString role;

  late final _i1.ColumnDateTime joinedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        roomId,
        userId,
        role,
        joinedAt,
      ];
}

class RoomMemberInclude extends _i1.IncludeObject {
  RoomMemberInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => RoomMember.t;
}

class RoomMemberIncludeList extends _i1.IncludeList {
  RoomMemberIncludeList._({
    _i1.WhereExpressionBuilder<RoomMemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RoomMember.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RoomMember.t;
}

class RoomMemberRepository {
  const RoomMemberRepository._();

  /// Returns a list of [RoomMember]s matching the given query parameters.
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
  Future<List<RoomMember>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoomMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoomMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoomMemberTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<RoomMember>(
      where: where?.call(RoomMember.t),
      orderBy: orderBy?.call(RoomMember.t),
      orderByList: orderByList?.call(RoomMember.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [RoomMember] matching the given query parameters.
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
  Future<RoomMember?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoomMemberTable>? where,
    int? offset,
    _i1.OrderByBuilder<RoomMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoomMemberTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<RoomMember>(
      where: where?.call(RoomMember.t),
      orderBy: orderBy?.call(RoomMember.t),
      orderByList: orderByList?.call(RoomMember.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [RoomMember] by its [id] or null if no such row exists.
  Future<RoomMember?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<RoomMember>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [RoomMember]s in the list and returns the inserted rows.
  ///
  /// The returned [RoomMember]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RoomMember>> insert(
    _i1.Session session,
    List<RoomMember> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RoomMember>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RoomMember] and returns the inserted row.
  ///
  /// The returned [RoomMember] will have its `id` field set.
  Future<RoomMember> insertRow(
    _i1.Session session,
    RoomMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RoomMember>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RoomMember]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RoomMember>> update(
    _i1.Session session,
    List<RoomMember> rows, {
    _i1.ColumnSelections<RoomMemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RoomMember>(
      rows,
      columns: columns?.call(RoomMember.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RoomMember]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RoomMember> updateRow(
    _i1.Session session,
    RoomMember row, {
    _i1.ColumnSelections<RoomMemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RoomMember>(
      row,
      columns: columns?.call(RoomMember.t),
      transaction: transaction,
    );
  }

  /// Deletes all [RoomMember]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RoomMember>> delete(
    _i1.Session session,
    List<RoomMember> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RoomMember>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RoomMember].
  Future<RoomMember> deleteRow(
    _i1.Session session,
    RoomMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RoomMember>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RoomMember>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RoomMemberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RoomMember>(
      where: where(RoomMember.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoomMemberTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RoomMember>(
      where: where?.call(RoomMember.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
