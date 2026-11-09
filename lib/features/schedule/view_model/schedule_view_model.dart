import 'dart:async';

import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/domain/logic/schedule_calculator.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_view_model.freezed.dart';
part 'schedule_view_model.g.dart';

@freezed
abstract class ScheduleState with _$ScheduleState {
  const factory({
    required List<StudyBlock> blocks,
    required DateTime now,
    ScheduledOccurrence? next,
    @Default(true) bool exactAlarms,
  }) = _ScheduleState;

  const new _();

  bool get isEmpty => blocks.isEmpty;

  /// Bloques de cada día (1 = lunes ... 7 = domingo), por hora.
  List<StudyBlock> blocksFor(int weekday) => [
    for (final b in blocks)
      if (b.weekdays.contains(weekday)) b,
  ]..sort((a, b) => a.startMinute.compareTo(b.startMinute));
}

/// La próxima sesión del horario (también la usa Inicio).
@riverpod
Future<ScheduledOccurrence?> nextScheduled(Ref ref) async {
  final blocks = await ref.watch(studyBlocksProvider.future);
  return ScheduleCalculator.nextOrCurrent(blocks, ref.watch(clockProvider)());
}

/// Pestaña Horario: agenda semanal.
@riverpod
class ScheduleViewModel extends _$ScheduleViewModel {
  @override
  Future<ScheduleState> build() async {
    ref.listen(appResumedProvider, (_, _) => unawaited(_refreshAlarms()));
    final blocks = await ref.watch(studyBlocksProvider.future);
    final now = ref.watch(clockProvider)();
    final permissions = await ref.read(blockerRepositoryProvider).permissions();
    return ScheduleState(
      blocks: blocks,
      now: now,
      next: ScheduleCalculator.nextOrCurrent(blocks, now),
      exactAlarms: permissions.valueOrNull?.exactAlarms ?? true,
    );
  }

  Future<void> setEnabled(StudyBlock block, {required bool enabled}) async {
    await ref
        .read(scheduleRepositoryProvider)
        .save(block.copyWith(enabled: enabled));
  }

  Future<void> requestExactAlarms() => ref
      .read(blockerRepositoryProvider)
      .requestPermission(PermissionKind.exactAlarms);

  Future<void> _refreshAlarms() async {
    final p = await ref.read(blockerRepositoryProvider).permissions();
    final s = state.value;
    if (!ref.mounted || s == null) return;
    final exact = p.valueOrNull?.exactAlarms ?? true;
    if (exact != s.exactAlarms) {
      state = AsyncData(s.copyWith(exactAlarms: exact));
    }
  }
}
