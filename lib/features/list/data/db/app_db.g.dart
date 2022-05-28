// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String description;
  final int state;
  final int userId;
  Todo(
      {@required this.id,
      @required this.description,
      @required this.state,
      @required this.userId});
  factory Todo.fromData(Map<String, dynamic> data, {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Todo(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      state: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}state']),
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<int>(state);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    return map;
  }

  TodosEntityCompanion toCompanion(bool nullToAbsent) {
    return TodosEntityCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      state: serializer.fromJson<int>(json['state']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'state': serializer.toJson<int>(state),
      'userId': serializer.toJson<int>(userId),
    };
  }

  Todo copyWith({int id, String description, int state, int userId}) => Todo(
        id: id ?? this.id,
        description: description ?? this.description,
        state: state ?? this.state,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('state: $state, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, state, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.description == this.description &&
          other.state == this.state &&
          other.userId == this.userId);
}

class TodosEntityCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> description;
  final Value<int> state;
  final Value<int> userId;
  const TodosEntityCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.state = const Value.absent(),
    this.userId = const Value.absent(),
  });
  TodosEntityCompanion.insert({
    this.id = const Value.absent(),
    @required String description,
    @required int state,
    @required int userId,
  })  : description = Value(description),
        state = Value(state),
        userId = Value(userId);
  static Insertable<Todo> custom({
    Expression<int> id,
    Expression<String> description,
    Expression<int> state,
    Expression<int> userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (state != null) 'state': state,
      if (userId != null) 'user_id': userId,
    });
  }

  TodosEntityCompanion copyWith(
      {Value<int> id,
      Value<String> description,
      Value<int> state,
      Value<int> userId}) {
    return TodosEntityCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      state: state ?? this.state,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (state.present) {
      map['state'] = Variable<int>(state.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosEntityCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('state: $state, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $TodosEntityTable extends TodosEntity
    with TableInfo<$TodosEntityTable, Todo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String _alias;
  $TodosEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedColumn<String> _description;
  @override
  GeneratedColumn<String> get description => _description ??=
      GeneratedColumn<String>('description', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _stateMeta = const VerificationMeta('state');
  GeneratedColumn<int> _state;
  @override
  GeneratedColumn<int> get state =>
      _state ??= GeneratedColumn<int>('state', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedColumn<int> _userId;
  @override
  GeneratedColumn<int> get userId =>
      _userId ??= GeneratedColumn<int>('user_id', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, description, state, userId];
  @override
  String get aliasedName => _alias ?? 'todos_entity';
  @override
  String get actualTableName => 'todos_entity';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state'], _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String tablePrefix}) {
    return Todo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TodosEntityTable createAlias(String alias) {
    return $TodosEntityTable(attachedDatabase, alias);
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TodosEntityTable _todosEntity;
  $TodosEntityTable get todosEntity => _todosEntity ??= $TodosEntityTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todosEntity];
}
