import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/logic/schedule_calculator.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'block_editor_view_model.freezed.dart';
part 'block_editor_view_model.g.dart';

@freezed
abstract class BlockEditorState with _$BlockEditorState {
  const factory({
    required StudyBlock block,

    /// Los demás bloques, para detectar cruces.
    required List<StudyBlock> others,
    @Default(false) bool saving,
  }) = _BlockEditorState;

  const new _();

  bool get isNew => block.id == 0;

  bool get hasDays => block.weekdays.isNotEmpty;

  List<StudyBlock> get overlaps =>
      ScheduleCalculator.overlapping(block, others);

  bool get canSave => hasDays && overlaps.isEmpty && !saving;
}

/// Crear o editar un bloque del horario. `blockId == 0` es uno nuevo.
@riverpod
class BlockEditorViewModel extends _$BlockEditorViewModel {
  /// Valores de un bloque nuevo: lunes a viernes a las 18:00, 2 x 25/5.
  static const defaultBlock = StudyBlock(
    weekdays: {1, 2, 3, 4, 5},
    startMinute: 18 * 60,
    cycles: 2,
  );

  @override
  Future<BlockEditorState> build(int blockId) async {
    final repo = ref.read(scheduleRepositoryProvider);
    final all = (await repo.blocks()).valueOrNull ?? const [];
    final existing = blockId == 0
        ? null
        : all.where((b) => b.id == blockId).firstOrNull;
    return BlockEditorState(
      block: existing ?? defaultBlock,
      others: [
        for (final b in all)
          if (b.id != blockId && b.enabled) b,
      ],
    );
  }

  void setLabel(String label) => _edit((b) => b.copyWith(label: label));

  void toggleDay(int weekday) => _edit((b) {
    final days = {...b.weekdays};
    days.contains(weekday) ? days.remove(weekday) : days.add(weekday);
    return b.copyWith(weekdays: days);
  });

  void setStart(int minuteOfDay) =>
      _edit((b) => b.copyWith(startMinute: minuteOfDay.clamp(0, 24 * 60 - 1)));

  void setPreset(PomodoroPreset preset) =>
      _edit((b) => b.copyWith(preset: preset));

  void setCycles(int cycles) =>
      _edit((b) => b.copyWith(cycles: cycles.clamp(1, 8)));

  void setFreeMinutes(int minutes) =>
      _edit((b) => b.copyWith(freeMinutes: minutes.clamp(5, 240)));

  Future<Result<StudyBlock>> save() async {
    final s = state.value;
    if (s == null || !s.canSave) {
      return Result.error(StateError('El bloque no es válido'));
    }
    state = AsyncData(s.copyWith(saving: true));
    final result = await ref.read(scheduleRepositoryProvider).save(s.block);
    if (ref.mounted && result is Failure) {
      state = AsyncData(s.copyWith(saving: false));
    }
    return result;
  }

  Future<Result<void>> delete() async {
    final s = state.value;
    if (s == null || s.isNew) return const Result.ok(null);
    return await ref.read(scheduleRepositoryProvider).delete(s.block.id);
  }

  void _edit(StudyBlock Function(StudyBlock) change) {
    final s = state.value;
    if (s != null) state = AsyncData(s.copyWith(block: change(s.block)));
  }
}
