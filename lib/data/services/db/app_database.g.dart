// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SessionsTable extends Sessions
    with TableInfo<$SessionsTable, SessionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _plannedMinMeta = const VerificationMeta(
    'plannedMin',
  );
  @override
  late final GeneratedColumn<int> plannedMin = GeneratedColumn<int>(
    'planned_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _focusMinMeta = const VerificationMeta(
    'focusMin',
  );
  @override
  late final GeneratedColumn<int> focusMin = GeneratedColumn<int>(
    'focus_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breakMinMeta = const VerificationMeta(
    'breakMin',
  );
  @override
  late final GeneratedColumn<int> breakMin = GeneratedColumn<int>(
    'break_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cyclesMeta = const VerificationMeta('cycles');
  @override
  late final GeneratedColumn<int> cycles = GeneratedColumn<int>(
    'cycles',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longBreakMinMeta = const VerificationMeta(
    'longBreakMin',
  );
  @override
  late final GeneratedColumn<int> longBreakMin = GeneratedColumn<int>(
    'long_break_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _focusedMinMeta = const VerificationMeta(
    'focusedMin',
  );
  @override
  late final GeneratedColumn<int> focusedMin = GeneratedColumn<int>(
    'focused_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _outcomeMeta = const VerificationMeta(
    'outcome',
  );
  @override
  late final GeneratedColumn<int> outcome = GeneratedColumn<int>(
    'outcome',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _earlyExitMeta = const VerificationMeta(
    'earlyExit',
  );
  @override
  late final GeneratedColumn<bool> earlyExit = GeneratedColumn<bool>(
    'early_exit',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("early_exit" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _exitLevelMeta = const VerificationMeta(
    'exitLevel',
  );
  @override
  late final GeneratedColumn<int> exitLevel = GeneratedColumn<int>(
    'exit_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _exitReasonMeta = const VerificationMeta(
    'exitReason',
  );
  @override
  late final GeneratedColumn<String> exitReason = GeneratedColumn<String>(
    'exit_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _distractionCountMeta = const VerificationMeta(
    'distractionCount',
  );
  @override
  late final GeneratedColumn<int> distractionCount = GeneratedColumn<int>(
    'distraction_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
    'subject_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
    'room_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startedAt,
    endedAt,
    plannedMin,
    focusMin,
    breakMin,
    cycles,
    longBreakMin,
    focusedMin,
    outcome,
    earlyExit,
    exitLevel,
    exitReason,
    distractionCount,
    subjectId,
    roomId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    if (data.containsKey('planned_min')) {
      context.handle(
        _plannedMinMeta,
        plannedMin.isAcceptableOrUnknown(data['planned_min']!, _plannedMinMeta),
      );
    } else if (isInserting) {
      context.missing(_plannedMinMeta);
    }
    if (data.containsKey('focus_min')) {
      context.handle(
        _focusMinMeta,
        focusMin.isAcceptableOrUnknown(data['focus_min']!, _focusMinMeta),
      );
    } else if (isInserting) {
      context.missing(_focusMinMeta);
    }
    if (data.containsKey('break_min')) {
      context.handle(
        _breakMinMeta,
        breakMin.isAcceptableOrUnknown(data['break_min']!, _breakMinMeta),
      );
    } else if (isInserting) {
      context.missing(_breakMinMeta);
    }
    if (data.containsKey('cycles')) {
      context.handle(
        _cyclesMeta,
        cycles.isAcceptableOrUnknown(data['cycles']!, _cyclesMeta),
      );
    } else if (isInserting) {
      context.missing(_cyclesMeta);
    }
    if (data.containsKey('long_break_min')) {
      context.handle(
        _longBreakMinMeta,
        longBreakMin.isAcceptableOrUnknown(
          data['long_break_min']!,
          _longBreakMinMeta,
        ),
      );
    }
    if (data.containsKey('focused_min')) {
      context.handle(
        _focusedMinMeta,
        focusedMin.isAcceptableOrUnknown(data['focused_min']!, _focusedMinMeta),
      );
    }
    if (data.containsKey('outcome')) {
      context.handle(
        _outcomeMeta,
        outcome.isAcceptableOrUnknown(data['outcome']!, _outcomeMeta),
      );
    } else if (isInserting) {
      context.missing(_outcomeMeta);
    }
    if (data.containsKey('early_exit')) {
      context.handle(
        _earlyExitMeta,
        earlyExit.isAcceptableOrUnknown(data['early_exit']!, _earlyExitMeta),
      );
    }
    if (data.containsKey('exit_level')) {
      context.handle(
        _exitLevelMeta,
        exitLevel.isAcceptableOrUnknown(data['exit_level']!, _exitLevelMeta),
      );
    }
    if (data.containsKey('exit_reason')) {
      context.handle(
        _exitReasonMeta,
        exitReason.isAcceptableOrUnknown(data['exit_reason']!, _exitReasonMeta),
      );
    }
    if (data.containsKey('distraction_count')) {
      context.handle(
        _distractionCountMeta,
        distractionCount.isAcceptableOrUnknown(
          data['distraction_count']!,
          _distractionCountMeta,
        ),
      );
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    }
    if (data.containsKey('room_id')) {
      context.handle(
        _roomIdMeta,
        roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ended_at'],
      ),
      plannedMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}planned_min'],
      )!,
      focusMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}focus_min'],
      )!,
      breakMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}break_min'],
      )!,
      cycles: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycles'],
      )!,
      longBreakMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}long_break_min'],
      )!,
      focusedMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}focused_min'],
      )!,
      outcome: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}outcome'],
      )!,
      earlyExit: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}early_exit'],
      )!,
      exitLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exit_level'],
      )!,
      exitReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exit_reason'],
      ),
      distractionCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}distraction_count'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subject_id'],
      ),
      roomId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_id'],
      ),
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class SessionRow extends DataClass implements Insertable<SessionRow> {
  final int id;
  final DateTime startedAt;
  final DateTime? endedAt;
  final int plannedMin;
  final int focusMin;
  final int breakMin;
  final int cycles;

  /// Desde la versión 2 del esquema.
  final int longBreakMin;
  final int focusedMin;
  final int outcome;
  final bool earlyExit;
  final int exitLevel;
  final String? exitReason;
  final int distractionCount;
  final int? subjectId;
  final String? roomId;
  const SessionRow({
    required this.id,
    required this.startedAt,
    this.endedAt,
    required this.plannedMin,
    required this.focusMin,
    required this.breakMin,
    required this.cycles,
    required this.longBreakMin,
    required this.focusedMin,
    required this.outcome,
    required this.earlyExit,
    required this.exitLevel,
    this.exitReason,
    required this.distractionCount,
    this.subjectId,
    this.roomId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    map['planned_min'] = Variable<int>(plannedMin);
    map['focus_min'] = Variable<int>(focusMin);
    map['break_min'] = Variable<int>(breakMin);
    map['cycles'] = Variable<int>(cycles);
    map['long_break_min'] = Variable<int>(longBreakMin);
    map['focused_min'] = Variable<int>(focusedMin);
    map['outcome'] = Variable<int>(outcome);
    map['early_exit'] = Variable<bool>(earlyExit);
    map['exit_level'] = Variable<int>(exitLevel);
    if (!nullToAbsent || exitReason != null) {
      map['exit_reason'] = Variable<String>(exitReason);
    }
    map['distraction_count'] = Variable<int>(distractionCount);
    if (!nullToAbsent || subjectId != null) {
      map['subject_id'] = Variable<int>(subjectId);
    }
    if (!nullToAbsent || roomId != null) {
      map['room_id'] = Variable<String>(roomId);
    }
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      plannedMin: Value(plannedMin),
      focusMin: Value(focusMin),
      breakMin: Value(breakMin),
      cycles: Value(cycles),
      longBreakMin: Value(longBreakMin),
      focusedMin: Value(focusedMin),
      outcome: Value(outcome),
      earlyExit: Value(earlyExit),
      exitLevel: Value(exitLevel),
      exitReason: exitReason == null && nullToAbsent
          ? const Value.absent()
          : Value(exitReason),
      distractionCount: Value(distractionCount),
      subjectId: subjectId == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectId),
      roomId: roomId == null && nullToAbsent
          ? const Value.absent()
          : Value(roomId),
    );
  }

  factory SessionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionRow(
      id: serializer.fromJson<int>(json['id']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      plannedMin: serializer.fromJson<int>(json['plannedMin']),
      focusMin: serializer.fromJson<int>(json['focusMin']),
      breakMin: serializer.fromJson<int>(json['breakMin']),
      cycles: serializer.fromJson<int>(json['cycles']),
      longBreakMin: serializer.fromJson<int>(json['longBreakMin']),
      focusedMin: serializer.fromJson<int>(json['focusedMin']),
      outcome: serializer.fromJson<int>(json['outcome']),
      earlyExit: serializer.fromJson<bool>(json['earlyExit']),
      exitLevel: serializer.fromJson<int>(json['exitLevel']),
      exitReason: serializer.fromJson<String?>(json['exitReason']),
      distractionCount: serializer.fromJson<int>(json['distractionCount']),
      subjectId: serializer.fromJson<int?>(json['subjectId']),
      roomId: serializer.fromJson<String?>(json['roomId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'plannedMin': serializer.toJson<int>(plannedMin),
      'focusMin': serializer.toJson<int>(focusMin),
      'breakMin': serializer.toJson<int>(breakMin),
      'cycles': serializer.toJson<int>(cycles),
      'longBreakMin': serializer.toJson<int>(longBreakMin),
      'focusedMin': serializer.toJson<int>(focusedMin),
      'outcome': serializer.toJson<int>(outcome),
      'earlyExit': serializer.toJson<bool>(earlyExit),
      'exitLevel': serializer.toJson<int>(exitLevel),
      'exitReason': serializer.toJson<String?>(exitReason),
      'distractionCount': serializer.toJson<int>(distractionCount),
      'subjectId': serializer.toJson<int?>(subjectId),
      'roomId': serializer.toJson<String?>(roomId),
    };
  }

  SessionRow copyWith({
    int? id,
    DateTime? startedAt,
    Value<DateTime?> endedAt = const Value.absent(),
    int? plannedMin,
    int? focusMin,
    int? breakMin,
    int? cycles,
    int? longBreakMin,
    int? focusedMin,
    int? outcome,
    bool? earlyExit,
    int? exitLevel,
    Value<String?> exitReason = const Value.absent(),
    int? distractionCount,
    Value<int?> subjectId = const Value.absent(),
    Value<String?> roomId = const Value.absent(),
  }) => SessionRow(
    id: id ?? this.id,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    plannedMin: plannedMin ?? this.plannedMin,
    focusMin: focusMin ?? this.focusMin,
    breakMin: breakMin ?? this.breakMin,
    cycles: cycles ?? this.cycles,
    longBreakMin: longBreakMin ?? this.longBreakMin,
    focusedMin: focusedMin ?? this.focusedMin,
    outcome: outcome ?? this.outcome,
    earlyExit: earlyExit ?? this.earlyExit,
    exitLevel: exitLevel ?? this.exitLevel,
    exitReason: exitReason.present ? exitReason.value : this.exitReason,
    distractionCount: distractionCount ?? this.distractionCount,
    subjectId: subjectId.present ? subjectId.value : this.subjectId,
    roomId: roomId.present ? roomId.value : this.roomId,
  );
  SessionRow copyWithCompanion(SessionsCompanion data) {
    return SessionRow(
      id: data.id.present ? data.id.value : this.id,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      plannedMin: data.plannedMin.present
          ? data.plannedMin.value
          : this.plannedMin,
      focusMin: data.focusMin.present ? data.focusMin.value : this.focusMin,
      breakMin: data.breakMin.present ? data.breakMin.value : this.breakMin,
      cycles: data.cycles.present ? data.cycles.value : this.cycles,
      longBreakMin: data.longBreakMin.present
          ? data.longBreakMin.value
          : this.longBreakMin,
      focusedMin: data.focusedMin.present
          ? data.focusedMin.value
          : this.focusedMin,
      outcome: data.outcome.present ? data.outcome.value : this.outcome,
      earlyExit: data.earlyExit.present ? data.earlyExit.value : this.earlyExit,
      exitLevel: data.exitLevel.present ? data.exitLevel.value : this.exitLevel,
      exitReason: data.exitReason.present
          ? data.exitReason.value
          : this.exitReason,
      distractionCount: data.distractionCount.present
          ? data.distractionCount.value
          : this.distractionCount,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionRow(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('plannedMin: $plannedMin, ')
          ..write('focusMin: $focusMin, ')
          ..write('breakMin: $breakMin, ')
          ..write('cycles: $cycles, ')
          ..write('longBreakMin: $longBreakMin, ')
          ..write('focusedMin: $focusedMin, ')
          ..write('outcome: $outcome, ')
          ..write('earlyExit: $earlyExit, ')
          ..write('exitLevel: $exitLevel, ')
          ..write('exitReason: $exitReason, ')
          ..write('distractionCount: $distractionCount, ')
          ..write('subjectId: $subjectId, ')
          ..write('roomId: $roomId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    startedAt,
    endedAt,
    plannedMin,
    focusMin,
    breakMin,
    cycles,
    longBreakMin,
    focusedMin,
    outcome,
    earlyExit,
    exitLevel,
    exitReason,
    distractionCount,
    subjectId,
    roomId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionRow &&
          other.id == this.id &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.plannedMin == this.plannedMin &&
          other.focusMin == this.focusMin &&
          other.breakMin == this.breakMin &&
          other.cycles == this.cycles &&
          other.longBreakMin == this.longBreakMin &&
          other.focusedMin == this.focusedMin &&
          other.outcome == this.outcome &&
          other.earlyExit == this.earlyExit &&
          other.exitLevel == this.exitLevel &&
          other.exitReason == this.exitReason &&
          other.distractionCount == this.distractionCount &&
          other.subjectId == this.subjectId &&
          other.roomId == this.roomId);
}

class SessionsCompanion extends UpdateCompanion<SessionRow> {
  final Value<int> id;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<int> plannedMin;
  final Value<int> focusMin;
  final Value<int> breakMin;
  final Value<int> cycles;
  final Value<int> longBreakMin;
  final Value<int> focusedMin;
  final Value<int> outcome;
  final Value<bool> earlyExit;
  final Value<int> exitLevel;
  final Value<String?> exitReason;
  final Value<int> distractionCount;
  final Value<int?> subjectId;
  final Value<String?> roomId;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.plannedMin = const Value.absent(),
    this.focusMin = const Value.absent(),
    this.breakMin = const Value.absent(),
    this.cycles = const Value.absent(),
    this.longBreakMin = const Value.absent(),
    this.focusedMin = const Value.absent(),
    this.outcome = const Value.absent(),
    this.earlyExit = const Value.absent(),
    this.exitLevel = const Value.absent(),
    this.exitReason = const Value.absent(),
    this.distractionCount = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.roomId = const Value.absent(),
  });
  SessionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime startedAt,
    this.endedAt = const Value.absent(),
    required int plannedMin,
    required int focusMin,
    required int breakMin,
    required int cycles,
    this.longBreakMin = const Value.absent(),
    this.focusedMin = const Value.absent(),
    required int outcome,
    this.earlyExit = const Value.absent(),
    this.exitLevel = const Value.absent(),
    this.exitReason = const Value.absent(),
    this.distractionCount = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.roomId = const Value.absent(),
  }) : startedAt = Value(startedAt),
       plannedMin = Value(plannedMin),
       focusMin = Value(focusMin),
       breakMin = Value(breakMin),
       cycles = Value(cycles),
       outcome = Value(outcome);
  static Insertable<SessionRow> custom({
    Expression<int>? id,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<int>? plannedMin,
    Expression<int>? focusMin,
    Expression<int>? breakMin,
    Expression<int>? cycles,
    Expression<int>? longBreakMin,
    Expression<int>? focusedMin,
    Expression<int>? outcome,
    Expression<bool>? earlyExit,
    Expression<int>? exitLevel,
    Expression<String>? exitReason,
    Expression<int>? distractionCount,
    Expression<int>? subjectId,
    Expression<String>? roomId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (plannedMin != null) 'planned_min': plannedMin,
      if (focusMin != null) 'focus_min': focusMin,
      if (breakMin != null) 'break_min': breakMin,
      if (cycles != null) 'cycles': cycles,
      if (longBreakMin != null) 'long_break_min': longBreakMin,
      if (focusedMin != null) 'focused_min': focusedMin,
      if (outcome != null) 'outcome': outcome,
      if (earlyExit != null) 'early_exit': earlyExit,
      if (exitLevel != null) 'exit_level': exitLevel,
      if (exitReason != null) 'exit_reason': exitReason,
      if (distractionCount != null) 'distraction_count': distractionCount,
      if (subjectId != null) 'subject_id': subjectId,
      if (roomId != null) 'room_id': roomId,
    });
  }

  SessionsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? startedAt,
    Value<DateTime?>? endedAt,
    Value<int>? plannedMin,
    Value<int>? focusMin,
    Value<int>? breakMin,
    Value<int>? cycles,
    Value<int>? longBreakMin,
    Value<int>? focusedMin,
    Value<int>? outcome,
    Value<bool>? earlyExit,
    Value<int>? exitLevel,
    Value<String?>? exitReason,
    Value<int>? distractionCount,
    Value<int?>? subjectId,
    Value<String?>? roomId,
  }) {
    return SessionsCompanion(
      id: id ?? this.id,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      plannedMin: plannedMin ?? this.plannedMin,
      focusMin: focusMin ?? this.focusMin,
      breakMin: breakMin ?? this.breakMin,
      cycles: cycles ?? this.cycles,
      longBreakMin: longBreakMin ?? this.longBreakMin,
      focusedMin: focusedMin ?? this.focusedMin,
      outcome: outcome ?? this.outcome,
      earlyExit: earlyExit ?? this.earlyExit,
      exitLevel: exitLevel ?? this.exitLevel,
      exitReason: exitReason ?? this.exitReason,
      distractionCount: distractionCount ?? this.distractionCount,
      subjectId: subjectId ?? this.subjectId,
      roomId: roomId ?? this.roomId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (plannedMin.present) {
      map['planned_min'] = Variable<int>(plannedMin.value);
    }
    if (focusMin.present) {
      map['focus_min'] = Variable<int>(focusMin.value);
    }
    if (breakMin.present) {
      map['break_min'] = Variable<int>(breakMin.value);
    }
    if (cycles.present) {
      map['cycles'] = Variable<int>(cycles.value);
    }
    if (longBreakMin.present) {
      map['long_break_min'] = Variable<int>(longBreakMin.value);
    }
    if (focusedMin.present) {
      map['focused_min'] = Variable<int>(focusedMin.value);
    }
    if (outcome.present) {
      map['outcome'] = Variable<int>(outcome.value);
    }
    if (earlyExit.present) {
      map['early_exit'] = Variable<bool>(earlyExit.value);
    }
    if (exitLevel.present) {
      map['exit_level'] = Variable<int>(exitLevel.value);
    }
    if (exitReason.present) {
      map['exit_reason'] = Variable<String>(exitReason.value);
    }
    if (distractionCount.present) {
      map['distraction_count'] = Variable<int>(distractionCount.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('plannedMin: $plannedMin, ')
          ..write('focusMin: $focusMin, ')
          ..write('breakMin: $breakMin, ')
          ..write('cycles: $cycles, ')
          ..write('longBreakMin: $longBreakMin, ')
          ..write('focusedMin: $focusedMin, ')
          ..write('outcome: $outcome, ')
          ..write('earlyExit: $earlyExit, ')
          ..write('exitLevel: $exitLevel, ')
          ..write('exitReason: $exitReason, ')
          ..write('distractionCount: $distractionCount, ')
          ..write('subjectId: $subjectId, ')
          ..write('roomId: $roomId')
          ..write(')'))
        .toString();
  }
}

class $DistractionEventsTable extends DistractionEvents
    with TableInfo<$DistractionEventsTable, DistractionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DistractionEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sessions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _packageNameMeta = const VerificationMeta(
    'packageName',
  );
  @override
  late final GeneratedColumn<String> packageName = GeneratedColumn<String>(
    'package_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _atMeta = const VerificationMeta('at');
  @override
  late final GeneratedColumn<DateTime> at = GeneratedColumn<DateTime>(
    'at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, sessionId, packageName, at];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'distraction_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<DistractionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('package_name')) {
      context.handle(
        _packageNameMeta,
        packageName.isAcceptableOrUnknown(
          data['package_name']!,
          _packageNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_packageNameMeta);
    }
    if (data.containsKey('at')) {
      context.handle(_atMeta, at.isAcceptableOrUnknown(data['at']!, _atMeta));
    } else if (isInserting) {
      context.missing(_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DistractionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DistractionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_id'],
      )!,
      packageName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}package_name'],
      )!,
      at: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}at'],
      )!,
    );
  }

  @override
  $DistractionEventsTable createAlias(String alias) {
    return $DistractionEventsTable(attachedDatabase, alias);
  }
}

class DistractionRow extends DataClass implements Insertable<DistractionRow> {
  final int id;
  final int sessionId;
  final String packageName;
  final DateTime at;
  const DistractionRow({
    required this.id,
    required this.sessionId,
    required this.packageName,
    required this.at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<int>(sessionId);
    map['package_name'] = Variable<String>(packageName);
    map['at'] = Variable<DateTime>(at);
    return map;
  }

  DistractionEventsCompanion toCompanion(bool nullToAbsent) {
    return DistractionEventsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      packageName: Value(packageName),
      at: Value(at),
    );
  }

  factory DistractionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DistractionRow(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      packageName: serializer.fromJson<String>(json['packageName']),
      at: serializer.fromJson<DateTime>(json['at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<int>(sessionId),
      'packageName': serializer.toJson<String>(packageName),
      'at': serializer.toJson<DateTime>(at),
    };
  }

  DistractionRow copyWith({
    int? id,
    int? sessionId,
    String? packageName,
    DateTime? at,
  }) => DistractionRow(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    packageName: packageName ?? this.packageName,
    at: at ?? this.at,
  );
  DistractionRow copyWithCompanion(DistractionEventsCompanion data) {
    return DistractionRow(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      packageName: data.packageName.present
          ? data.packageName.value
          : this.packageName,
      at: data.at.present ? data.at.value : this.at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DistractionRow(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('packageName: $packageName, ')
          ..write('at: $at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionId, packageName, at);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DistractionRow &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.packageName == this.packageName &&
          other.at == this.at);
}

class DistractionEventsCompanion extends UpdateCompanion<DistractionRow> {
  final Value<int> id;
  final Value<int> sessionId;
  final Value<String> packageName;
  final Value<DateTime> at;
  const DistractionEventsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.packageName = const Value.absent(),
    this.at = const Value.absent(),
  });
  DistractionEventsCompanion.insert({
    this.id = const Value.absent(),
    required int sessionId,
    required String packageName,
    required DateTime at,
  }) : sessionId = Value(sessionId),
       packageName = Value(packageName),
       at = Value(at);
  static Insertable<DistractionRow> custom({
    Expression<int>? id,
    Expression<int>? sessionId,
    Expression<String>? packageName,
    Expression<DateTime>? at,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (packageName != null) 'package_name': packageName,
      if (at != null) 'at': at,
    });
  }

  DistractionEventsCompanion copyWith({
    Value<int>? id,
    Value<int>? sessionId,
    Value<String>? packageName,
    Value<DateTime>? at,
  }) {
    return DistractionEventsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      packageName: packageName ?? this.packageName,
      at: at ?? this.at,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (packageName.present) {
      map['package_name'] = Variable<String>(packageName.value);
    }
    if (at.present) {
      map['at'] = Variable<DateTime>(at.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DistractionEventsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('packageName: $packageName, ')
          ..write('at: $at')
          ..write(')'))
        .toString();
  }
}

class $AllowedAppsTable extends AllowedApps
    with TableInfo<$AllowedAppsTable, AllowedAppRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AllowedAppsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _packageNameMeta = const VerificationMeta(
    'packageName',
  );
  @override
  late final GeneratedColumn<String> packageName = GeneratedColumn<String>(
    'package_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [packageName, label];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'allowed_apps';
  @override
  VerificationContext validateIntegrity(
    Insertable<AllowedAppRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('package_name')) {
      context.handle(
        _packageNameMeta,
        packageName.isAcceptableOrUnknown(
          data['package_name']!,
          _packageNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_packageNameMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {packageName};
  @override
  AllowedAppRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AllowedAppRow(
      packageName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}package_name'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
    );
  }

  @override
  $AllowedAppsTable createAlias(String alias) {
    return $AllowedAppsTable(attachedDatabase, alias);
  }
}

class AllowedAppRow extends DataClass implements Insertable<AllowedAppRow> {
  final String packageName;
  final String label;
  const AllowedAppRow({required this.packageName, required this.label});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['package_name'] = Variable<String>(packageName);
    map['label'] = Variable<String>(label);
    return map;
  }

  AllowedAppsCompanion toCompanion(bool nullToAbsent) {
    return AllowedAppsCompanion(
      packageName: Value(packageName),
      label: Value(label),
    );
  }

  factory AllowedAppRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AllowedAppRow(
      packageName: serializer.fromJson<String>(json['packageName']),
      label: serializer.fromJson<String>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'packageName': serializer.toJson<String>(packageName),
      'label': serializer.toJson<String>(label),
    };
  }

  AllowedAppRow copyWith({String? packageName, String? label}) => AllowedAppRow(
    packageName: packageName ?? this.packageName,
    label: label ?? this.label,
  );
  AllowedAppRow copyWithCompanion(AllowedAppsCompanion data) {
    return AllowedAppRow(
      packageName: data.packageName.present
          ? data.packageName.value
          : this.packageName,
      label: data.label.present ? data.label.value : this.label,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AllowedAppRow(')
          ..write('packageName: $packageName, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(packageName, label);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AllowedAppRow &&
          other.packageName == this.packageName &&
          other.label == this.label);
}

class AllowedAppsCompanion extends UpdateCompanion<AllowedAppRow> {
  final Value<String> packageName;
  final Value<String> label;
  final Value<int> rowid;
  const AllowedAppsCompanion({
    this.packageName = const Value.absent(),
    this.label = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AllowedAppsCompanion.insert({
    required String packageName,
    required String label,
    this.rowid = const Value.absent(),
  }) : packageName = Value(packageName),
       label = Value(label);
  static Insertable<AllowedAppRow> custom({
    Expression<String>? packageName,
    Expression<String>? label,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (packageName != null) 'package_name': packageName,
      if (label != null) 'label': label,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AllowedAppsCompanion copyWith({
    Value<String>? packageName,
    Value<String>? label,
    Value<int>? rowid,
  }) {
    return AllowedAppsCompanion(
      packageName: packageName ?? this.packageName,
      label: label ?? this.label,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (packageName.present) {
      map['package_name'] = Variable<String>(packageName.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AllowedAppsCompanion(')
          ..write('packageName: $packageName, ')
          ..write('label: $label, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StreakDaysTable extends StreakDays
    with TableInfo<$StreakDaysTable, StreakDayRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StreakDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<DateTime> day = GeneratedColumn<DateTime>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _focusedMinMeta = const VerificationMeta(
    'focusedMin',
  );
  @override
  late final GeneratedColumn<int> focusedMin = GeneratedColumn<int>(
    'focused_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hadEarlyExitMeta = const VerificationMeta(
    'hadEarlyExit',
  );
  @override
  late final GeneratedColumn<bool> hadEarlyExit = GeneratedColumn<bool>(
    'had_early_exit',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("had_early_exit" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [day, focusedMin, hadEarlyExit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'streak_days';
  @override
  VerificationContext validateIntegrity(
    Insertable<StreakDayRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('focused_min')) {
      context.handle(
        _focusedMinMeta,
        focusedMin.isAcceptableOrUnknown(data['focused_min']!, _focusedMinMeta),
      );
    } else if (isInserting) {
      context.missing(_focusedMinMeta);
    }
    if (data.containsKey('had_early_exit')) {
      context.handle(
        _hadEarlyExitMeta,
        hadEarlyExit.isAcceptableOrUnknown(
          data['had_early_exit']!,
          _hadEarlyExitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hadEarlyExitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {day};
  @override
  StreakDayRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StreakDayRow(
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}day'],
      )!,
      focusedMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}focused_min'],
      )!,
      hadEarlyExit: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}had_early_exit'],
      )!,
    );
  }

  @override
  $StreakDaysTable createAlias(String alias) {
    return $StreakDaysTable(attachedDatabase, alias);
  }
}

class StreakDayRow extends DataClass implements Insertable<StreakDayRow> {
  final DateTime day;
  final int focusedMin;
  final bool hadEarlyExit;
  const StreakDayRow({
    required this.day,
    required this.focusedMin,
    required this.hadEarlyExit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['day'] = Variable<DateTime>(day);
    map['focused_min'] = Variable<int>(focusedMin);
    map['had_early_exit'] = Variable<bool>(hadEarlyExit);
    return map;
  }

  StreakDaysCompanion toCompanion(bool nullToAbsent) {
    return StreakDaysCompanion(
      day: Value(day),
      focusedMin: Value(focusedMin),
      hadEarlyExit: Value(hadEarlyExit),
    );
  }

  factory StreakDayRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StreakDayRow(
      day: serializer.fromJson<DateTime>(json['day']),
      focusedMin: serializer.fromJson<int>(json['focusedMin']),
      hadEarlyExit: serializer.fromJson<bool>(json['hadEarlyExit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'day': serializer.toJson<DateTime>(day),
      'focusedMin': serializer.toJson<int>(focusedMin),
      'hadEarlyExit': serializer.toJson<bool>(hadEarlyExit),
    };
  }

  StreakDayRow copyWith({DateTime? day, int? focusedMin, bool? hadEarlyExit}) =>
      StreakDayRow(
        day: day ?? this.day,
        focusedMin: focusedMin ?? this.focusedMin,
        hadEarlyExit: hadEarlyExit ?? this.hadEarlyExit,
      );
  StreakDayRow copyWithCompanion(StreakDaysCompanion data) {
    return StreakDayRow(
      day: data.day.present ? data.day.value : this.day,
      focusedMin: data.focusedMin.present
          ? data.focusedMin.value
          : this.focusedMin,
      hadEarlyExit: data.hadEarlyExit.present
          ? data.hadEarlyExit.value
          : this.hadEarlyExit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StreakDayRow(')
          ..write('day: $day, ')
          ..write('focusedMin: $focusedMin, ')
          ..write('hadEarlyExit: $hadEarlyExit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(day, focusedMin, hadEarlyExit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StreakDayRow &&
          other.day == this.day &&
          other.focusedMin == this.focusedMin &&
          other.hadEarlyExit == this.hadEarlyExit);
}

class StreakDaysCompanion extends UpdateCompanion<StreakDayRow> {
  final Value<DateTime> day;
  final Value<int> focusedMin;
  final Value<bool> hadEarlyExit;
  final Value<int> rowid;
  const StreakDaysCompanion({
    this.day = const Value.absent(),
    this.focusedMin = const Value.absent(),
    this.hadEarlyExit = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StreakDaysCompanion.insert({
    required DateTime day,
    required int focusedMin,
    required bool hadEarlyExit,
    this.rowid = const Value.absent(),
  }) : day = Value(day),
       focusedMin = Value(focusedMin),
       hadEarlyExit = Value(hadEarlyExit);
  static Insertable<StreakDayRow> custom({
    Expression<DateTime>? day,
    Expression<int>? focusedMin,
    Expression<bool>? hadEarlyExit,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (day != null) 'day': day,
      if (focusedMin != null) 'focused_min': focusedMin,
      if (hadEarlyExit != null) 'had_early_exit': hadEarlyExit,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StreakDaysCompanion copyWith({
    Value<DateTime>? day,
    Value<int>? focusedMin,
    Value<bool>? hadEarlyExit,
    Value<int>? rowid,
  }) {
    return StreakDaysCompanion(
      day: day ?? this.day,
      focusedMin: focusedMin ?? this.focusedMin,
      hadEarlyExit: hadEarlyExit ?? this.hadEarlyExit,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (day.present) {
      map['day'] = Variable<DateTime>(day.value);
    }
    if (focusedMin.present) {
      map['focused_min'] = Variable<int>(focusedMin.value);
    }
    if (hadEarlyExit.present) {
      map['had_early_exit'] = Variable<bool>(hadEarlyExit.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StreakDaysCompanion(')
          ..write('day: $day, ')
          ..write('focusedMin: $focusedMin, ')
          ..write('hadEarlyExit: $hadEarlyExit, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, SettingRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SettingRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class SettingRow extends DataClass implements Insertable<SettingRow> {
  final String key;
  final String value;
  const SettingRow({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(key: Value(key), value: Value(value));
  }

  factory SettingRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  SettingRow copyWith({String? key, String? value}) =>
      SettingRow(key: key ?? this.key, value: value ?? this.value);
  SettingRow copyWithCompanion(SettingsCompanion data) {
    return SettingRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingRow(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingRow &&
          other.key == this.key &&
          other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<SettingRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<SettingRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $DistractionEventsTable distractionEvents =
      $DistractionEventsTable(this);
  late final $AllowedAppsTable allowedApps = $AllowedAppsTable(this);
  late final $StreakDaysTable streakDays = $StreakDaysTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    sessions,
    distractionEvents,
    allowedApps,
    streakDays,
    settings,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'sessions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('distraction_events', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$SessionsTableCreateCompanionBuilder = SessionsCompanion Function({
  Value<int> id,
  required DateTime startedAt,
  Value<DateTime?> endedAt,
  required int plannedMin,
  required int focusMin,
  required int breakMin,
  required int cycles,
  Value<int> longBreakMin,
  Value<int> focusedMin,
  required int outcome,
  Value<bool> earlyExit,
  Value<int> exitLevel,
  Value<String?> exitReason,
  Value<int> distractionCount,
  Value<int?> subjectId,
  Value<String?> roomId,
});
typedef $$SessionsTableUpdateCompanionBuilder = SessionsCompanion Function({
  Value<int> id,
  Value<DateTime> startedAt,
  Value<DateTime?> endedAt,
  Value<int> plannedMin,
  Value<int> focusMin,
  Value<int> breakMin,
  Value<int> cycles,
  Value<int> longBreakMin,
  Value<int> focusedMin,
  Value<int> outcome,
  Value<bool> earlyExit,
  Value<int> exitLevel,
  Value<String?> exitReason,
  Value<int> distractionCount,
  Value<int?> subjectId,
  Value<String?> roomId,
});

final class $$SessionsTableReferences
    extends BaseReferences<_$AppDatabase, $SessionsTable, SessionRow> {
  $$SessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DistractionEventsTable, List<DistractionRow>>
  _distractionEventsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.distractionEvents,
        aliasName: 'sessions__id__distraction_events__session_id',
      );

  $$DistractionEventsTableProcessedTableManager get distractionEventsRefs {
    final manager = $$DistractionEventsTableTableManager(
      $_db,
      $_db.distractionEvents,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _distractionEventsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SessionsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get plannedMin => $composableBuilder(
    column: $table.plannedMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get focusMin => $composableBuilder(
    column: $table.focusMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get breakMin => $composableBuilder(
    column: $table.breakMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cycles => $composableBuilder(
    column: $table.cycles,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get longBreakMin => $composableBuilder(
    column: $table.longBreakMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get focusedMin => $composableBuilder(
    column: $table.focusedMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get earlyExit => $composableBuilder(
    column: $table.earlyExit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exitLevel => $composableBuilder(
    column: $table.exitLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exitReason => $composableBuilder(
    column: $table.exitReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get distractionCount => $composableBuilder(
    column: $table.distractionCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roomId => $composableBuilder(
    column: $table.roomId,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> distractionEventsRefs(
    Expression<bool> Function($$DistractionEventsTableFilterComposer f) f,
  ) {
    final $$DistractionEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.distractionEvents,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DistractionEventsTableFilterComposer(
            $db: $db,
            $table: $db.distractionEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get plannedMin => $composableBuilder(
    column: $table.plannedMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get focusMin => $composableBuilder(
    column: $table.focusMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get breakMin => $composableBuilder(
    column: $table.breakMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cycles => $composableBuilder(
    column: $table.cycles,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get longBreakMin => $composableBuilder(
    column: $table.longBreakMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get focusedMin => $composableBuilder(
    column: $table.focusedMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get earlyExit => $composableBuilder(
    column: $table.earlyExit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exitLevel => $composableBuilder(
    column: $table.exitLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exitReason => $composableBuilder(
    column: $table.exitReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get distractionCount => $composableBuilder(
    column: $table.distractionCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roomId => $composableBuilder(
    column: $table.roomId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<int> get plannedMin => $composableBuilder(
    column: $table.plannedMin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get focusMin =>
      $composableBuilder(column: $table.focusMin, builder: (column) => column);

  GeneratedColumn<int> get breakMin =>
      $composableBuilder(column: $table.breakMin, builder: (column) => column);

  GeneratedColumn<int> get cycles =>
      $composableBuilder(column: $table.cycles, builder: (column) => column);

  GeneratedColumn<int> get longBreakMin => $composableBuilder(
    column: $table.longBreakMin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get focusedMin => $composableBuilder(
    column: $table.focusedMin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get outcome =>
      $composableBuilder(column: $table.outcome, builder: (column) => column);

  GeneratedColumn<bool> get earlyExit =>
      $composableBuilder(column: $table.earlyExit, builder: (column) => column);

  GeneratedColumn<int> get exitLevel =>
      $composableBuilder(column: $table.exitLevel, builder: (column) => column);

  GeneratedColumn<String> get exitReason => $composableBuilder(
    column: $table.exitReason,
    builder: (column) => column,
  );

  GeneratedColumn<int> get distractionCount => $composableBuilder(
    column: $table.distractionCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<String> get roomId =>
      $composableBuilder(column: $table.roomId, builder: (column) => column);

  Expression<T> distractionEventsRefs<T extends Object>(
    Expression<T> Function($$DistractionEventsTableAnnotationComposer a) f,
  ) {
    final $$DistractionEventsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.distractionEvents,
          getReferencedColumn: (t) => t.sessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DistractionEventsTableAnnotationComposer(
                $db: $db,
                $table: $db.distractionEvents,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionsTable,
          SessionRow,
          $$SessionsTableFilterComposer,
          $$SessionsTableOrderingComposer,
          $$SessionsTableAnnotationComposer,
          $$SessionsTableCreateCompanionBuilder,
          $$SessionsTableUpdateCompanionBuilder,
          (SessionRow, $$SessionsTableReferences),
          SessionRow,
          PrefetchHooks Function({bool distractionEventsRefs})
        > {
  $$SessionsTableTableManager(_$AppDatabase db, $SessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
                Value<int> plannedMin = const Value.absent(),
                Value<int> focusMin = const Value.absent(),
                Value<int> breakMin = const Value.absent(),
                Value<int> cycles = const Value.absent(),
                Value<int> longBreakMin = const Value.absent(),
                Value<int> focusedMin = const Value.absent(),
                Value<int> outcome = const Value.absent(),
                Value<bool> earlyExit = const Value.absent(),
                Value<int> exitLevel = const Value.absent(),
                Value<String?> exitReason = const Value.absent(),
                Value<int> distractionCount = const Value.absent(),
                Value<int?> subjectId = const Value.absent(),
                Value<String?> roomId = const Value.absent(),
              }) => SessionsCompanion(
                id: id,
                startedAt: startedAt,
                endedAt: endedAt,
                plannedMin: plannedMin,
                focusMin: focusMin,
                breakMin: breakMin,
                cycles: cycles,
                longBreakMin: longBreakMin,
                focusedMin: focusedMin,
                outcome: outcome,
                earlyExit: earlyExit,
                exitLevel: exitLevel,
                exitReason: exitReason,
                distractionCount: distractionCount,
                subjectId: subjectId,
                roomId: roomId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime startedAt,
                Value<DateTime?> endedAt = const Value.absent(),
                required int plannedMin,
                required int focusMin,
                required int breakMin,
                required int cycles,
                Value<int> longBreakMin = const Value.absent(),
                Value<int> focusedMin = const Value.absent(),
                required int outcome,
                Value<bool> earlyExit = const Value.absent(),
                Value<int> exitLevel = const Value.absent(),
                Value<String?> exitReason = const Value.absent(),
                Value<int> distractionCount = const Value.absent(),
                Value<int?> subjectId = const Value.absent(),
                Value<String?> roomId = const Value.absent(),
              }) => SessionsCompanion.insert(
                id: id,
                startedAt: startedAt,
                endedAt: endedAt,
                plannedMin: plannedMin,
                focusMin: focusMin,
                breakMin: breakMin,
                cycles: cycles,
                longBreakMin: longBreakMin,
                focusedMin: focusedMin,
                outcome: outcome,
                earlyExit: earlyExit,
                exitLevel: exitLevel,
                exitReason: exitReason,
                distractionCount: distractionCount,
                subjectId: subjectId,
                roomId: roomId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SessionsTable, SessionRow>(table),
                  $$SessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({distractionEventsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (distractionEventsRefs) db.distractionEvents,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (distractionEventsRefs)
                    await $_getPrefetchedDataByColumns<
                      SessionRow,
                      $SessionsTable,
                      DistractionRow,
                      $DistractionEventsTable
                    >(
                      currentTable: table,
                      referencedTable: $$SessionsTableReferences
                          ._distractionEventsRefsTable(db),
                      managerFromTypedResult: (p0) => $$SessionsTableReferences(
                        db,
                        table,
                        p0,
                      ).distractionEventsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'session_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionsTable,
      SessionRow,
      $$SessionsTableFilterComposer,
      $$SessionsTableOrderingComposer,
      $$SessionsTableAnnotationComposer,
      $$SessionsTableCreateCompanionBuilder,
      $$SessionsTableUpdateCompanionBuilder,
      (SessionRow, $$SessionsTableReferences),
      SessionRow,
      PrefetchHooks Function({bool distractionEventsRefs})
    >;
typedef $$DistractionEventsTableCreateCompanionBuilder =
    DistractionEventsCompanion Function({
      Value<int> id,
      required int sessionId,
      required String packageName,
      required DateTime at,
    });
typedef $$DistractionEventsTableUpdateCompanionBuilder =
    DistractionEventsCompanion Function({
      Value<int> id,
      Value<int> sessionId,
      Value<String> packageName,
      Value<DateTime> at,
    });

final class $$DistractionEventsTableReferences
    extends
        BaseReferences<_$AppDatabase, $DistractionEventsTable, DistractionRow> {
  $$DistractionEventsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SessionsTable _sessionIdTable(_$AppDatabase db) =>
      db.sessions.createAlias('distraction_events__session_id__sessions__id');

  $$SessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<int>('session_id')!;

    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DistractionEventsTableFilterComposer
    extends Composer<_$AppDatabase, $DistractionEventsTable> {
  $$DistractionEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get at => $composableBuilder(
    column: $table.at,
    builder: (column) => ColumnFilters(column),
  );

  $$SessionsTableFilterComposer get sessionId {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DistractionEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $DistractionEventsTable> {
  $$DistractionEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get at => $composableBuilder(
    column: $table.at,
    builder: (column) => ColumnOrderings(column),
  );

  $$SessionsTableOrderingComposer get sessionId {
    final $$SessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableOrderingComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DistractionEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DistractionEventsTable> {
  $$DistractionEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get at =>
      $composableBuilder(column: $table.at, builder: (column) => column);

  $$SessionsTableAnnotationComposer get sessionId {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DistractionEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DistractionEventsTable,
          DistractionRow,
          $$DistractionEventsTableFilterComposer,
          $$DistractionEventsTableOrderingComposer,
          $$DistractionEventsTableAnnotationComposer,
          $$DistractionEventsTableCreateCompanionBuilder,
          $$DistractionEventsTableUpdateCompanionBuilder,
          (DistractionRow, $$DistractionEventsTableReferences),
          DistractionRow,
          PrefetchHooks Function({bool sessionId})
        > {
  $$DistractionEventsTableTableManager(
    _$AppDatabase db,
    $DistractionEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DistractionEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DistractionEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DistractionEventsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> sessionId = const Value.absent(),
                Value<String> packageName = const Value.absent(),
                Value<DateTime> at = const Value.absent(),
              }) => DistractionEventsCompanion(
                id: id,
                sessionId: sessionId,
                packageName: packageName,
                at: at,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int sessionId,
                required String packageName,
                required DateTime at,
              }) => DistractionEventsCompanion.insert(
                id: id,
                sessionId: sessionId,
                packageName: packageName,
                at: at,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DistractionEventsTable, DistractionRow>(table),
                  $$DistractionEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (sessionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.sessionId,
                        referencedTable: $$DistractionEventsTableReferences
                            ._sessionIdTable(db),
                        referencedColumn: $$DistractionEventsTableReferences
                            ._sessionIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DistractionEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DistractionEventsTable,
      DistractionRow,
      $$DistractionEventsTableFilterComposer,
      $$DistractionEventsTableOrderingComposer,
      $$DistractionEventsTableAnnotationComposer,
      $$DistractionEventsTableCreateCompanionBuilder,
      $$DistractionEventsTableUpdateCompanionBuilder,
      (DistractionRow, $$DistractionEventsTableReferences),
      DistractionRow,
      PrefetchHooks Function({bool sessionId})
    >;
typedef $$AllowedAppsTableCreateCompanionBuilder =
    AllowedAppsCompanion Function({
      required String packageName,
      required String label,
      Value<int> rowid,
    });
typedef $$AllowedAppsTableUpdateCompanionBuilder =
    AllowedAppsCompanion Function({
      Value<String> packageName,
      Value<String> label,
      Value<int> rowid,
    });

class $$AllowedAppsTableFilterComposer
    extends Composer<_$AppDatabase, $AllowedAppsTable> {
  $$AllowedAppsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AllowedAppsTableOrderingComposer
    extends Composer<_$AppDatabase, $AllowedAppsTable> {
  $$AllowedAppsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AllowedAppsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AllowedAppsTable> {
  $$AllowedAppsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);
}

class $$AllowedAppsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AllowedAppsTable,
          AllowedAppRow,
          $$AllowedAppsTableFilterComposer,
          $$AllowedAppsTableOrderingComposer,
          $$AllowedAppsTableAnnotationComposer,
          $$AllowedAppsTableCreateCompanionBuilder,
          $$AllowedAppsTableUpdateCompanionBuilder,
          (
            AllowedAppRow,
            BaseReferences<_$AppDatabase, $AllowedAppsTable, AllowedAppRow>,
          ),
          AllowedAppRow,
          PrefetchHooks Function()
        > {
  $$AllowedAppsTableTableManager(_$AppDatabase db, $AllowedAppsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AllowedAppsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AllowedAppsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AllowedAppsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> packageName = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AllowedAppsCompanion(
                packageName: packageName,
                label: label,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String packageName,
                required String label,
                Value<int> rowid = const Value.absent(),
              }) => AllowedAppsCompanion.insert(
                packageName: packageName,
                label: label,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AllowedAppsTable, AllowedAppRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $AllowedAppsTable,
                    AllowedAppRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AllowedAppsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AllowedAppsTable,
      AllowedAppRow,
      $$AllowedAppsTableFilterComposer,
      $$AllowedAppsTableOrderingComposer,
      $$AllowedAppsTableAnnotationComposer,
      $$AllowedAppsTableCreateCompanionBuilder,
      $$AllowedAppsTableUpdateCompanionBuilder,
      (
        AllowedAppRow,
        BaseReferences<_$AppDatabase, $AllowedAppsTable, AllowedAppRow>,
      ),
      AllowedAppRow,
      PrefetchHooks Function()
    >;
typedef $$StreakDaysTableCreateCompanionBuilder = StreakDaysCompanion Function({
  required DateTime day,
  required int focusedMin,
  required bool hadEarlyExit,
  Value<int> rowid,
});
typedef $$StreakDaysTableUpdateCompanionBuilder = StreakDaysCompanion Function({
  Value<DateTime> day,
  Value<int> focusedMin,
  Value<bool> hadEarlyExit,
  Value<int> rowid,
});

class $$StreakDaysTableFilterComposer
    extends Composer<_$AppDatabase, $StreakDaysTable> {
  $$StreakDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get focusedMin => $composableBuilder(
    column: $table.focusedMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hadEarlyExit => $composableBuilder(
    column: $table.hadEarlyExit,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StreakDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $StreakDaysTable> {
  $$StreakDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get focusedMin => $composableBuilder(
    column: $table.focusedMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hadEarlyExit => $composableBuilder(
    column: $table.hadEarlyExit,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StreakDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $StreakDaysTable> {
  $$StreakDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<int> get focusedMin => $composableBuilder(
    column: $table.focusedMin,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hadEarlyExit => $composableBuilder(
    column: $table.hadEarlyExit,
    builder: (column) => column,
  );
}

class $$StreakDaysTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StreakDaysTable,
          StreakDayRow,
          $$StreakDaysTableFilterComposer,
          $$StreakDaysTableOrderingComposer,
          $$StreakDaysTableAnnotationComposer,
          $$StreakDaysTableCreateCompanionBuilder,
          $$StreakDaysTableUpdateCompanionBuilder,
          (
            StreakDayRow,
            BaseReferences<_$AppDatabase, $StreakDaysTable, StreakDayRow>,
          ),
          StreakDayRow,
          PrefetchHooks Function()
        > {
  $$StreakDaysTableTableManager(_$AppDatabase db, $StreakDaysTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StreakDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StreakDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StreakDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> day = const Value.absent(),
                Value<int> focusedMin = const Value.absent(),
                Value<bool> hadEarlyExit = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StreakDaysCompanion(
                day: day,
                focusedMin: focusedMin,
                hadEarlyExit: hadEarlyExit,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required DateTime day,
                required int focusedMin,
                required bool hadEarlyExit,
                Value<int> rowid = const Value.absent(),
              }) => StreakDaysCompanion.insert(
                day: day,
                focusedMin: focusedMin,
                hadEarlyExit: hadEarlyExit,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StreakDaysTable, StreakDayRow>(table),
                  BaseReferences<_$AppDatabase, $StreakDaysTable, StreakDayRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StreakDaysTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StreakDaysTable,
      StreakDayRow,
      $$StreakDaysTableFilterComposer,
      $$StreakDaysTableOrderingComposer,
      $$StreakDaysTableAnnotationComposer,
      $$StreakDaysTableCreateCompanionBuilder,
      $$StreakDaysTableUpdateCompanionBuilder,
      (
        StreakDayRow,
        BaseReferences<_$AppDatabase, $StreakDaysTable, StreakDayRow>,
      ),
      StreakDayRow,
      PrefetchHooks Function()
    >;
typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          SettingRow,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (
            SettingRow,
            BaseReferences<_$AppDatabase, $SettingsTable, SettingRow>,
          ),
          SettingRow,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => SettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) => SettingsCompanion.insert(key: key, value: value, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SettingsTable, SettingRow>(table),
                  BaseReferences<_$AppDatabase, $SettingsTable, SettingRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      SettingRow,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (SettingRow, BaseReferences<_$AppDatabase, $SettingsTable, SettingRow>),
      SettingRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
  $$DistractionEventsTableTableManager get distractionEvents =>
      $$DistractionEventsTableTableManager(_db, _db.distractionEvents);
  $$AllowedAppsTableTableManager get allowedApps =>
      $$AllowedAppsTableTableManager(_db, _db.allowedApps);
  $$StreakDaysTableTableManager get streakDays =>
      $$StreakDaysTableTableManager(_db, _db.streakDays);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
