// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_repo.dart';

// ignore_for_file: type=lint
class $ProjectModelTable extends ProjectModel
    with TableInfo<$ProjectModelTable, ProjectModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _projectTitleMeta =
      const VerificationMeta('projectTitle');
  @override
  late final GeneratedColumn<String> projectTitle = GeneratedColumn<String>(
      'project_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, projectId, projectTitle];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_model';
  @override
  VerificationContext validateIntegrity(Insertable<ProjectModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('project_title')) {
      context.handle(
          _projectTitleMeta,
          projectTitle.isAcceptableOrUnknown(
              data['project_title']!, _projectTitleMeta));
    } else if (isInserting) {
      context.missing(_projectTitleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      projectTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_title'])!,
    );
  }

  @override
  $ProjectModelTable createAlias(String alias) {
    return $ProjectModelTable(attachedDatabase, alias);
  }
}

class ProjectModelData extends DataClass
    implements Insertable<ProjectModelData> {
  final int id;
  final String projectId;
  final String projectTitle;
  const ProjectModelData(
      {required this.id, required this.projectId, required this.projectTitle});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project_id'] = Variable<String>(projectId);
    map['project_title'] = Variable<String>(projectTitle);
    return map;
  }

  ProjectModelCompanion toCompanion(bool nullToAbsent) {
    return ProjectModelCompanion(
      id: Value(id),
      projectId: Value(projectId),
      projectTitle: Value(projectTitle),
    );
  }

  factory ProjectModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectModelData(
      id: serializer.fromJson<int>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      projectTitle: serializer.fromJson<String>(json['projectTitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'projectId': serializer.toJson<String>(projectId),
      'projectTitle': serializer.toJson<String>(projectTitle),
    };
  }

  ProjectModelData copyWith(
          {int? id, String? projectId, String? projectTitle}) =>
      ProjectModelData(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        projectTitle: projectTitle ?? this.projectTitle,
      );
  ProjectModelData copyWithCompanion(ProjectModelCompanion data) {
    return ProjectModelData(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      projectTitle: data.projectTitle.present
          ? data.projectTitle.value
          : this.projectTitle,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectModelData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('projectTitle: $projectTitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, projectTitle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectModelData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.projectTitle == this.projectTitle);
}

class ProjectModelCompanion extends UpdateCompanion<ProjectModelData> {
  final Value<int> id;
  final Value<String> projectId;
  final Value<String> projectTitle;
  const ProjectModelCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.projectTitle = const Value.absent(),
  });
  ProjectModelCompanion.insert({
    this.id = const Value.absent(),
    required String projectId,
    required String projectTitle,
  })  : projectId = Value(projectId),
        projectTitle = Value(projectTitle);
  static Insertable<ProjectModelData> custom({
    Expression<int>? id,
    Expression<String>? projectId,
    Expression<String>? projectTitle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (projectTitle != null) 'project_title': projectTitle,
    });
  }

  ProjectModelCompanion copyWith(
      {Value<int>? id, Value<String>? projectId, Value<String>? projectTitle}) {
    return ProjectModelCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      projectTitle: projectTitle ?? this.projectTitle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (projectTitle.present) {
      map['project_title'] = Variable<String>(projectTitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectModelCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('projectTitle: $projectTitle')
          ..write(')'))
        .toString();
  }
}

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
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES project_model (project_id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, taskId, taskTitle, taskDesc, dueDate, status, projectId];
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
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
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
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
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
  final String projectId;
  const TaskModelData(
      {required this.id,
      required this.taskId,
      required this.taskTitle,
      required this.taskDesc,
      required this.dueDate,
      required this.status,
      required this.projectId});
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
    map['project_id'] = Variable<String>(projectId);
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
      projectId: Value(projectId),
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
      projectId: serializer.fromJson<String>(json['projectId']),
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
      'projectId': serializer.toJson<String>(projectId),
    };
  }

  TaskModelData copyWith(
          {int? id,
          String? taskId,
          String? taskTitle,
          String? taskDesc,
          DateTime? dueDate,
          Priority? status,
          String? projectId}) =>
      TaskModelData(
        id: id ?? this.id,
        taskId: taskId ?? this.taskId,
        taskTitle: taskTitle ?? this.taskTitle,
        taskDesc: taskDesc ?? this.taskDesc,
        dueDate: dueDate ?? this.dueDate,
        status: status ?? this.status,
        projectId: projectId ?? this.projectId,
      );
  TaskModelData copyWithCompanion(TaskModelCompanion data) {
    return TaskModelData(
      id: data.id.present ? data.id.value : this.id,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      taskTitle: data.taskTitle.present ? data.taskTitle.value : this.taskTitle,
      taskDesc: data.taskDesc.present ? data.taskDesc.value : this.taskDesc,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      status: data.status.present ? data.status.value : this.status,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
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
          ..write('status: $status, ')
          ..write('projectId: $projectId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, taskId, taskTitle, taskDesc, dueDate, status, projectId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskModelData &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.taskTitle == this.taskTitle &&
          other.taskDesc == this.taskDesc &&
          other.dueDate == this.dueDate &&
          other.status == this.status &&
          other.projectId == this.projectId);
}

class TaskModelCompanion extends UpdateCompanion<TaskModelData> {
  final Value<int> id;
  final Value<String> taskId;
  final Value<String> taskTitle;
  final Value<String> taskDesc;
  final Value<DateTime> dueDate;
  final Value<Priority> status;
  final Value<String> projectId;
  const TaskModelCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.taskTitle = const Value.absent(),
    this.taskDesc = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.status = const Value.absent(),
    this.projectId = const Value.absent(),
  });
  TaskModelCompanion.insert({
    this.id = const Value.absent(),
    required String taskId,
    required String taskTitle,
    required String taskDesc,
    required DateTime dueDate,
    required Priority status,
    required String projectId,
  })  : taskId = Value(taskId),
        taskTitle = Value(taskTitle),
        taskDesc = Value(taskDesc),
        dueDate = Value(dueDate),
        status = Value(status),
        projectId = Value(projectId);
  static Insertable<TaskModelData> custom({
    Expression<int>? id,
    Expression<String>? taskId,
    Expression<String>? taskTitle,
    Expression<String>? taskDesc,
    Expression<DateTime>? dueDate,
    Expression<int>? status,
    Expression<String>? projectId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (taskTitle != null) 'task_title': taskTitle,
      if (taskDesc != null) 'task_desc': taskDesc,
      if (dueDate != null) 'due_date': dueDate,
      if (status != null) 'status': status,
      if (projectId != null) 'project_id': projectId,
    });
  }

  TaskModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? taskId,
      Value<String>? taskTitle,
      Value<String>? taskDesc,
      Value<DateTime>? dueDate,
      Value<Priority>? status,
      Value<String>? projectId}) {
    return TaskModelCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      taskTitle: taskTitle ?? this.taskTitle,
      taskDesc: taskDesc ?? this.taskDesc,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      projectId: projectId ?? this.projectId,
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
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
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
          ..write('status: $status, ')
          ..write('projectId: $projectId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProjectModelTable projectModel = $ProjectModelTable(this);
  late final $TaskModelTable taskModel = $TaskModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [projectModel, taskModel];
}

typedef $$ProjectModelTableCreateCompanionBuilder = ProjectModelCompanion
    Function({
  Value<int> id,
  required String projectId,
  required String projectTitle,
});
typedef $$ProjectModelTableUpdateCompanionBuilder = ProjectModelCompanion
    Function({
  Value<int> id,
  Value<String> projectId,
  Value<String> projectTitle,
});

final class $$ProjectModelTableReferences extends BaseReferences<_$AppDatabase,
    $ProjectModelTable, ProjectModelData> {
  $$ProjectModelTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TaskModelTable, List<TaskModelData>>
      _taskModelRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.taskModel,
              aliasName: $_aliasNameGenerator(
                  db.projectModel.projectId, db.taskModel.projectId));

  $$TaskModelTableProcessedTableManager get taskModelRefs {
    final manager = $$TaskModelTableTableManager($_db, $_db.taskModel)
        .filter((f) => f.projectId.projectId($_item.projectId));

    final cache = $_typedResult.readTableOrNull(_taskModelRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProjectModelTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectModelTable> {
  $$ProjectModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectTitle => $composableBuilder(
      column: $table.projectTitle, builder: (column) => ColumnFilters(column));

  Expression<bool> taskModelRefs(
      Expression<bool> Function($$TaskModelTableFilterComposer f) f) {
    final $$TaskModelTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.taskModel,
        getReferencedColumn: (t) => t.projectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskModelTableFilterComposer(
              $db: $db,
              $table: $db.taskModel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProjectModelTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectModelTable> {
  $$ProjectModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectTitle => $composableBuilder(
      column: $table.projectTitle,
      builder: (column) => ColumnOrderings(column));
}

class $$ProjectModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectModelTable> {
  $$ProjectModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get projectTitle => $composableBuilder(
      column: $table.projectTitle, builder: (column) => column);

  Expression<T> taskModelRefs<T extends Object>(
      Expression<T> Function($$TaskModelTableAnnotationComposer a) f) {
    final $$TaskModelTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.taskModel,
        getReferencedColumn: (t) => t.projectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskModelTableAnnotationComposer(
              $db: $db,
              $table: $db.taskModel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProjectModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProjectModelTable,
    ProjectModelData,
    $$ProjectModelTableFilterComposer,
    $$ProjectModelTableOrderingComposer,
    $$ProjectModelTableAnnotationComposer,
    $$ProjectModelTableCreateCompanionBuilder,
    $$ProjectModelTableUpdateCompanionBuilder,
    (ProjectModelData, $$ProjectModelTableReferences),
    ProjectModelData,
    PrefetchHooks Function({bool taskModelRefs})> {
  $$ProjectModelTableTableManager(_$AppDatabase db, $ProjectModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> projectId = const Value.absent(),
            Value<String> projectTitle = const Value.absent(),
          }) =>
              ProjectModelCompanion(
            id: id,
            projectId: projectId,
            projectTitle: projectTitle,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String projectId,
            required String projectTitle,
          }) =>
              ProjectModelCompanion.insert(
            id: id,
            projectId: projectId,
            projectTitle: projectTitle,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProjectModelTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({taskModelRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (taskModelRefs) db.taskModel],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (taskModelRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProjectModelTableReferences
                            ._taskModelRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProjectModelTableReferences(db, table, p0)
                                .taskModelRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.projectId == item.projectId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProjectModelTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProjectModelTable,
    ProjectModelData,
    $$ProjectModelTableFilterComposer,
    $$ProjectModelTableOrderingComposer,
    $$ProjectModelTableAnnotationComposer,
    $$ProjectModelTableCreateCompanionBuilder,
    $$ProjectModelTableUpdateCompanionBuilder,
    (ProjectModelData, $$ProjectModelTableReferences),
    ProjectModelData,
    PrefetchHooks Function({bool taskModelRefs})>;
typedef $$TaskModelTableCreateCompanionBuilder = TaskModelCompanion Function({
  Value<int> id,
  required String taskId,
  required String taskTitle,
  required String taskDesc,
  required DateTime dueDate,
  required Priority status,
  required String projectId,
});
typedef $$TaskModelTableUpdateCompanionBuilder = TaskModelCompanion Function({
  Value<int> id,
  Value<String> taskId,
  Value<String> taskTitle,
  Value<String> taskDesc,
  Value<DateTime> dueDate,
  Value<Priority> status,
  Value<String> projectId,
});

final class $$TaskModelTableReferences
    extends BaseReferences<_$AppDatabase, $TaskModelTable, TaskModelData> {
  $$TaskModelTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectModelTable _projectIdTable(_$AppDatabase db) =>
      db.projectModel.createAlias($_aliasNameGenerator(
          db.taskModel.projectId, db.projectModel.projectId));

  $$ProjectModelTableProcessedTableManager get projectId {
    final manager = $$ProjectModelTableTableManager($_db, $_db.projectModel)
        .filter((f) => f.projectId($_item.projectId!));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

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

  $$ProjectModelTableFilterComposer get projectId {
    final $$ProjectModelTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projectModel,
        getReferencedColumn: (t) => t.projectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectModelTableFilterComposer(
              $db: $db,
              $table: $db.projectModel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
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

  $$ProjectModelTableOrderingComposer get projectId {
    final $$ProjectModelTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projectModel,
        getReferencedColumn: (t) => t.projectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectModelTableOrderingComposer(
              $db: $db,
              $table: $db.projectModel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
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

  $$ProjectModelTableAnnotationComposer get projectId {
    final $$ProjectModelTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projectModel,
        getReferencedColumn: (t) => t.projectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectModelTableAnnotationComposer(
              $db: $db,
              $table: $db.projectModel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
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
    (TaskModelData, $$TaskModelTableReferences),
    TaskModelData,
    PrefetchHooks Function({bool projectId})> {
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
            Value<String> projectId = const Value.absent(),
          }) =>
              TaskModelCompanion(
            id: id,
            taskId: taskId,
            taskTitle: taskTitle,
            taskDesc: taskDesc,
            dueDate: dueDate,
            status: status,
            projectId: projectId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String taskId,
            required String taskTitle,
            required String taskDesc,
            required DateTime dueDate,
            required Priority status,
            required String projectId,
          }) =>
              TaskModelCompanion.insert(
            id: id,
            taskId: taskId,
            taskTitle: taskTitle,
            taskDesc: taskDesc,
            dueDate: dueDate,
            status: status,
            projectId: projectId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TaskModelTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (projectId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.projectId,
                    referencedTable:
                        $$TaskModelTableReferences._projectIdTable(db),
                    referencedColumn: $$TaskModelTableReferences
                        ._projectIdTable(db)
                        .projectId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
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
    (TaskModelData, $$TaskModelTableReferences),
    TaskModelData,
    PrefetchHooks Function({bool projectId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProjectModelTableTableManager get projectModel =>
      $$ProjectModelTableTableManager(_db, _db.projectModel);
  $$TaskModelTableTableManager get taskModel =>
      $$TaskModelTableTableManager(_db, _db.taskModel);
}
