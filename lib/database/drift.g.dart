// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift.dart';

// ignore_for_file: type=lint
class $ScheduleTableTable extends ScheduleTable
    with TableInfo<$ScheduleTableTable, ScheduleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _scheduleIdMeta =
      const VerificationMeta('scheduleId');
  @override
  late final GeneratedColumn<int> scheduleId = GeneratedColumn<int>(
      'schedule_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
      'start_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
      'end_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now().toUtc());
  @override
  List<GeneratedColumn> get $columns =>
      [scheduleId, startTime, endTime, content, date, category, createTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_table';
  @override
  VerificationContext validateIntegrity(Insertable<ScheduleTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('schedule_id')) {
      context.handle(
          _scheduleIdMeta,
          scheduleId.isAcceptableOrUnknown(
              data['schedule_id']!, _scheduleIdMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {scheduleId};
  @override
  ScheduleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleTableData(
      scheduleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}schedule_id'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_time'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
    );
  }

  @override
  $ScheduleTableTable createAlias(String alias) {
    return $ScheduleTableTable(attachedDatabase, alias);
  }
}

class ScheduleTableData extends DataClass
    implements Insertable<ScheduleTableData> {
  final int scheduleId;
  final int startTime;
  final int endTime;
  final String content;
  final DateTime date;
  final String category;
  final DateTime createTime;
  const ScheduleTableData(
      {required this.scheduleId,
      required this.startTime,
      required this.endTime,
      required this.content,
      required this.date,
      required this.category,
      required this.createTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['schedule_id'] = Variable<int>(scheduleId);
    map['start_time'] = Variable<int>(startTime);
    map['end_time'] = Variable<int>(endTime);
    map['content'] = Variable<String>(content);
    map['date'] = Variable<DateTime>(date);
    map['category'] = Variable<String>(category);
    map['create_time'] = Variable<DateTime>(createTime);
    return map;
  }

  ScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return ScheduleTableCompanion(
      scheduleId: Value(scheduleId),
      startTime: Value(startTime),
      endTime: Value(endTime),
      content: Value(content),
      date: Value(date),
      category: Value(category),
      createTime: Value(createTime),
    );
  }

  factory ScheduleTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleTableData(
      scheduleId: serializer.fromJson<int>(json['scheduleId']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int>(json['endTime']),
      content: serializer.fromJson<String>(json['content']),
      date: serializer.fromJson<DateTime>(json['date']),
      category: serializer.fromJson<String>(json['category']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'scheduleId': serializer.toJson<int>(scheduleId),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int>(endTime),
      'content': serializer.toJson<String>(content),
      'date': serializer.toJson<DateTime>(date),
      'category': serializer.toJson<String>(category),
      'createTime': serializer.toJson<DateTime>(createTime),
    };
  }

  ScheduleTableData copyWith(
          {int? scheduleId,
          int? startTime,
          int? endTime,
          String? content,
          DateTime? date,
          String? category,
          DateTime? createTime}) =>
      ScheduleTableData(
        scheduleId: scheduleId ?? this.scheduleId,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        content: content ?? this.content,
        date: date ?? this.date,
        category: category ?? this.category,
        createTime: createTime ?? this.createTime,
      );
  ScheduleTableData copyWithCompanion(ScheduleTableCompanion data) {
    return ScheduleTableData(
      scheduleId:
          data.scheduleId.present ? data.scheduleId.value : this.scheduleId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      content: data.content.present ? data.content.value : this.content,
      date: data.date.present ? data.date.value : this.date,
      category: data.category.present ? data.category.value : this.category,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTableData(')
          ..write('scheduleId: $scheduleId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      scheduleId, startTime, endTime, content, date, category, createTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleTableData &&
          other.scheduleId == this.scheduleId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.content == this.content &&
          other.date == this.date &&
          other.category == this.category &&
          other.createTime == this.createTime);
}

class ScheduleTableCompanion extends UpdateCompanion<ScheduleTableData> {
  final Value<int> scheduleId;
  final Value<int> startTime;
  final Value<int> endTime;
  final Value<String> content;
  final Value<DateTime> date;
  final Value<String> category;
  final Value<DateTime> createTime;
  const ScheduleTableCompanion({
    this.scheduleId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
    this.category = const Value.absent(),
    this.createTime = const Value.absent(),
  });
  ScheduleTableCompanion.insert({
    this.scheduleId = const Value.absent(),
    required int startTime,
    required int endTime,
    required String content,
    required DateTime date,
    required String category,
    this.createTime = const Value.absent(),
  })  : startTime = Value(startTime),
        endTime = Value(endTime),
        content = Value(content),
        date = Value(date),
        category = Value(category);
  static Insertable<ScheduleTableData> custom({
    Expression<int>? scheduleId,
    Expression<int>? startTime,
    Expression<int>? endTime,
    Expression<String>? content,
    Expression<DateTime>? date,
    Expression<String>? category,
    Expression<DateTime>? createTime,
  }) {
    return RawValuesInsertable({
      if (scheduleId != null) 'schedule_id': scheduleId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (content != null) 'content': content,
      if (date != null) 'date': date,
      if (category != null) 'category': category,
      if (createTime != null) 'create_time': createTime,
    });
  }

  ScheduleTableCompanion copyWith(
      {Value<int>? scheduleId,
      Value<int>? startTime,
      Value<int>? endTime,
      Value<String>? content,
      Value<DateTime>? date,
      Value<String>? category,
      Value<DateTime>? createTime}) {
    return ScheduleTableCompanion(
      scheduleId: scheduleId ?? this.scheduleId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      content: content ?? this.content,
      date: date ?? this.date,
      category: category ?? this.category,
      createTime: createTime ?? this.createTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (scheduleId.present) {
      map['schedule_id'] = Variable<int>(scheduleId.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTableCompanion(')
          ..write('scheduleId: $scheduleId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ScheduleTableTable scheduleTable = $ScheduleTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [scheduleTable];
}

typedef $$ScheduleTableTableCreateCompanionBuilder = ScheduleTableCompanion
    Function({
  Value<int> scheduleId,
  required int startTime,
  required int endTime,
  required String content,
  required DateTime date,
  required String category,
  Value<DateTime> createTime,
});
typedef $$ScheduleTableTableUpdateCompanionBuilder = ScheduleTableCompanion
    Function({
  Value<int> scheduleId,
  Value<int> startTime,
  Value<int> endTime,
  Value<String> content,
  Value<DateTime> date,
  Value<String> category,
  Value<DateTime> createTime,
});

class $$ScheduleTableTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduleTableTable> {
  $$ScheduleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get scheduleId => $composableBuilder(
      column: $table.scheduleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createTime => $composableBuilder(
      column: $table.createTime, builder: (column) => ColumnFilters(column));
}

class $$ScheduleTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduleTableTable> {
  $$ScheduleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get scheduleId => $composableBuilder(
      column: $table.scheduleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createTime => $composableBuilder(
      column: $table.createTime, builder: (column) => ColumnOrderings(column));
}

class $$ScheduleTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduleTableTable> {
  $$ScheduleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get scheduleId => $composableBuilder(
      column: $table.scheduleId, builder: (column) => column);

  GeneratedColumn<int> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<int> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<DateTime> get createTime => $composableBuilder(
      column: $table.createTime, builder: (column) => column);
}

class $$ScheduleTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ScheduleTableTable,
    ScheduleTableData,
    $$ScheduleTableTableFilterComposer,
    $$ScheduleTableTableOrderingComposer,
    $$ScheduleTableTableAnnotationComposer,
    $$ScheduleTableTableCreateCompanionBuilder,
    $$ScheduleTableTableUpdateCompanionBuilder,
    (
      ScheduleTableData,
      BaseReferences<_$AppDatabase, $ScheduleTableTable, ScheduleTableData>
    ),
    ScheduleTableData,
    PrefetchHooks Function()> {
  $$ScheduleTableTableTableManager(_$AppDatabase db, $ScheduleTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduleTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> scheduleId = const Value.absent(),
            Value<int> startTime = const Value.absent(),
            Value<int> endTime = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<DateTime> createTime = const Value.absent(),
          }) =>
              ScheduleTableCompanion(
            scheduleId: scheduleId,
            startTime: startTime,
            endTime: endTime,
            content: content,
            date: date,
            category: category,
            createTime: createTime,
          ),
          createCompanionCallback: ({
            Value<int> scheduleId = const Value.absent(),
            required int startTime,
            required int endTime,
            required String content,
            required DateTime date,
            required String category,
            Value<DateTime> createTime = const Value.absent(),
          }) =>
              ScheduleTableCompanion.insert(
            scheduleId: scheduleId,
            startTime: startTime,
            endTime: endTime,
            content: content,
            date: date,
            category: category,
            createTime: createTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ScheduleTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ScheduleTableTable,
    ScheduleTableData,
    $$ScheduleTableTableFilterComposer,
    $$ScheduleTableTableOrderingComposer,
    $$ScheduleTableTableAnnotationComposer,
    $$ScheduleTableTableCreateCompanionBuilder,
    $$ScheduleTableTableUpdateCompanionBuilder,
    (
      ScheduleTableData,
      BaseReferences<_$AppDatabase, $ScheduleTableTable, ScheduleTableData>
    ),
    ScheduleTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ScheduleTableTableTableManager get scheduleTable =>
      $$ScheduleTableTableTableManager(_db, _db.scheduleTable);
}
