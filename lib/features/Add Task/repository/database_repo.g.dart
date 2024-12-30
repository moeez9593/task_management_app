// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_repo.dart';

// ignore_for_file: type=lint
class $TaskModelTable extends TaskModel
    with TableInfo<$TaskModelTable, TaskModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
      'task_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _taskTitleMeta =
      const VerificationMeta('taskTitle');
  @override
  late final GeneratedColumn<String> taskTitle = GeneratedColumn<String>(
      'task_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _taskDescMeta =
      const VerificationMeta('taskDesc');
  @override
  late final GeneratedColumn<String> taskDesc = GeneratedColumn<String>(
      'task_desc', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<Priority, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Priority>($TaskModelTable.$converterstatus);
  @override
  List<GeneratedColumn> get $columns =>
      [id, taskId, taskTitle, taskDesc, dueDate, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_model';
  @override
  VerificationContext validateIntegrity(Insertable<TaskModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('task_title')) {
      context.handle(_taskTitleMeta,
          taskTitle.isAcceptableOrUnknown(data['task_title']!, _taskTitleMeta));
    } else if (isInserting) {
      context.missing(_taskTitleMeta);
    }
    if (data.containsKey('task_desc')) {
      context.handle(_taskDescMeta,
          taskDesc.isAcceptableOrUnknown(data['task_desc']!, _taskDescMeta));
    } else if (isInserting) {
      context.missing(_taskDescMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    context.handle(_statusMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_id'])!,
      taskTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_title'])!,
      taskDesc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_desc'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date'])!,
      status: $TaskModelTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
    );
  }

  @override
  $TaskModelTable createAlias(String alias) {
    return $TaskModelTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Priority, int, int> $converterstatus =
      const EnumIndexConverter<Priority>(Priority.values);
}

class TaskModelData extends DataClass implements Insertable<TaskModelData> {
  final int id;
  final String taskId;
  final String taskTitle;
  final String taskDesc;
  final DateTime dueDate;
  final Priority status;
  const TaskModelData(
      {required this.id,
      required this.taskId,
      required this.taskTitle,
      required this.taskDesc,
      required this.dueDate,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task_id'] = Variable<String>(taskId);
    map['task_title'] = Variable<String>(taskTitle);
    map['task_desc'] = Variable<String>(taskDesc);
    map['due_date'] = Variable<DateTime>(dueDate);
    {
      map['status'] =
          Variable<int>($TaskModelTable.$converterstatus.toSql(status));
    }
    return map;
  }

  TaskModelCompanion toCompanion(bool nullToAbsent) {
    return TaskModelCompanion(
      id: Value(id),
      taskId: Value(taskId),
      taskTitle: Value(taskTitle),
      taskDesc: Value(taskDesc),
      dueDate: Value(dueDate),
      status: Value(status),
    );
  }

  factory TaskModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskModelData(
      id: serializer.fromJson<int>(json['id']),
      taskId: serializer.fromJson<String>(json['taskId']),
      taskTitle: serializer.fromJson<String>(json['taskTitle']),
      taskDesc: serializer.fromJson<String>(json['taskDesc']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      status: $TaskModelTable.$converterstatus
          .fromJson(serializer.fromJson<int>(json['status'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskId': serializer.toJson<String>(taskId),
      'taskTitle': serializer.toJson<String>(taskTitle),
      'taskDesc': serializer.toJson<String>(taskDesc),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'status': serializer
          .toJson<int>($TaskModelTable.$converterstatus.toJson(status)),
    };
  }

  TaskModelData copyWith(
          {int? id,
          String? taskId,
          String? taskTitle,
          String? taskDesc,
          DateTime? dueDate,
          Priority? status}) =>
      TaskModelData(
        id: id ?? this.id,
        taskId: taskId ?? this.taskId,
        taskTitle: taskTitle ?? this.taskTitle,
        taskDesc: taskDesc ?? this.taskDesc,
        dueDate: dueDate ?? this.dueDate,
        status: status ?? this.status,
      );
  TaskModelData copyWithCompanion(TaskModelCompanion data) {
    return TaskModelData(
      id: data.id.present ? data.id.value : this.id,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      taskTitle: data.taskTitle.present ? data.taskTitle.value : this.taskTitle,
      taskDesc: data.taskDesc.present ? data.taskDesc.value : this.taskDesc,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskModelData(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('taskTitle: $taskTitle, ')
          ..write('taskDesc: $taskDesc, ')
          ..write('dueDate: $dueDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, taskId, taskTitle, taskDesc, dueDate, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskModelData &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.taskTitle == this.taskTitle &&
          other.taskDesc == this.taskDesc &&
          other.dueDate == this.dueDate &&
          other.status == this.status);
}

class TaskModelCompanion extends UpdateCompanion<TaskModelData> {
  final Value<int> id;
  final Value<String> taskId;
  final Value<String> taskTitle;
  final Value<String> taskDesc;
  final Value<DateTime> dueDate;
  final Value<Priority> status;
  const TaskModelCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.taskTitle = const Value.absent(),
    this.taskDesc = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.status = const Value.absent(),
  });
  TaskModelCompanion.insert({
    this.id = const Value.absent(),
    required String taskId,
    required String taskTitle,
    required String taskDesc,
    required DateTime dueDate,
    required Priority status,
  })  : taskId = Value(taskId),
        taskTitle = Value(taskTitle),
        taskDesc = Value(taskDesc),
        dueDate = Value(dueDate),
        status = Value(status);
  static Insertable<TaskModelData> custom({
    Expression<int>? id,
    Expression<String>? taskId,
    Expression<String>? taskTitle,
    Expression<String>? taskDesc,
    Expression<DateTime>? dueDate,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (taskTitle != null) 'task_title': taskTitle,
      if (taskDesc != null) 'task_desc': taskDesc,
      if (dueDate != null) 'due_date': dueDate,
      if (status != null) 'status': status,
    });
  }

  TaskModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? taskId,
      Value<String>? taskTitle,
      Value<String>? taskDesc,
      Value<DateTime>? dueDate,
      Value<Priority>? status}) {
    return TaskModelCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      taskTitle: taskTitle ?? this.taskTitle,
      taskDesc: taskDesc ?? this.taskDesc,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (taskTitle.present) {
      map['task_title'] = Variable<String>(taskTitle.value);
    }
    if (taskDesc.present) {
      map['task_desc'] = Variable<String>(taskDesc.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (status.present) {
      map['status'] =
          Variable<int>($TaskModelTable.$converterstatus.toSql(status.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskModelCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('taskTitle: $taskTitle, ')
          ..write('taskDesc: $taskDesc, ')
          ..write('dueDate: $dueDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TaskModelTable taskModel = $TaskModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskModel];
}

typedef $$TaskModelTableCreateCompanionBuilder = TaskModelCompanion Function({
  Value<int> id,
  required String taskId,
  required String taskTitle,
  required String taskDesc,
  required DateTime dueDate,
  required Priority status,
});
typedef $$TaskModelTableUpdateCompanionBuilder = TaskModelCompanion Function({
  Value<int> id,
  Value<String> taskId,
  Value<String> taskTitle,
  Value<String> taskDesc,
  Value<DateTime> dueDate,
  Value<Priority> status,
});

class $$TaskModelTableFilterComposer
    extends Composer<_$AppDatabase, $TaskModelTable> {
  $$TaskModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taskTitle => $composableBuilder(
      column: $table.taskTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taskDesc => $composableBuilder(
      column: $table.taskDesc, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Priority, Priority, int> get status =>
      $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$TaskModelTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskModelTable> {
  $$TaskModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taskTitle => $composableBuilder(
      column: $table.taskTitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taskDesc => $composableBuilder(
      column: $table.taskDesc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$TaskModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskModelTable> {
  $$TaskModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);

  GeneratedColumn<String> get taskTitle =>
      $composableBuilder(column: $table.taskTitle, builder: (column) => column);

  GeneratedColumn<String> get taskDesc =>
      $composableBuilder(column: $table.taskDesc, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Priority, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$TaskModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskModelTable,
    TaskModelData,
    $$TaskModelTableFilterComposer,
    $$TaskModelTableOrderingComposer,
    $$TaskModelTableAnnotationComposer,
    $$TaskModelTableCreateCompanionBuilder,
    $$TaskModelTableUpdateCompanionBuilder,
    (
      TaskModelData,
      BaseReferences<_$AppDatabase, $TaskModelTable, TaskModelData>
    ),
    TaskModelData,
    PrefetchHooks Function()> {
  $$TaskModelTableTableManager(_$AppDatabase db, $TaskModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> taskId = const Value.absent(),
            Value<String> taskTitle = const Value.absent(),
            Value<String> taskDesc = const Value.absent(),
            Value<DateTime> dueDate = const Value.absent(),
            Value<Priority> status = const Value.absent(),
          }) =>
              TaskModelCompanion(
            id: id,
            taskId: taskId,
            taskTitle: taskTitle,
            taskDesc: taskDesc,
            dueDate: dueDate,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String taskId,
            required String taskTitle,
            required String taskDesc,
            required DateTime dueDate,
            required Priority status,
          }) =>
              TaskModelCompanion.insert(
            id: id,
            taskId: taskId,
            taskTitle: taskTitle,
            taskDesc: taskDesc,
            dueDate: dueDate,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TaskModelTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskModelTable,
    TaskModelData,
    $$TaskModelTableFilterComposer,
    $$TaskModelTableOrderingComposer,
    $$TaskModelTableAnnotationComposer,
    $$TaskModelTableCreateCompanionBuilder,
    $$TaskModelTableUpdateCompanionBuilder,
    (
      TaskModelData,
      BaseReferences<_$AppDatabase, $TaskModelTable, TaskModelData>
    ),
    TaskModelData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TaskModelTableTableManager get taskModel =>
      $$TaskModelTableTableManager(_db, _db.taskModel);
}
