import 'dart:async';

import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/logic/exit_cost.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exit_cost_view_model.freezed.dart';
part 'exit_cost_view_model.g.dart';

@freezed
abstract class ExitCostState with _$ExitCostState {
  const factory({
    required int secondsLeft,
    @Default(1) int step,
    @Default('') String reason,
    @Default(false) bool busy,
    @Default(false) bool exited,
  }) = _ExitCostState;

  const new _();

  bool get canContinue => switch (step) {
    1 => secondsLeft == 0,
    2 => ExitCost.reasonIsValid(reason),
    _ => false,
  };
}

/// "Salir antes" con costo: espera de 60 s, motivo y confirmación.
@riverpod
class ExitCostViewModel extends _$ExitCostViewModel {
  Timer? _countdown;

  @override
  ExitCostState build(int sessionId) {
    ref.onDispose(() => _countdown?.cancel());
    _startCountdown();
    unawaited(_recordLevel(1));
    return ExitCostState(secondsLeft: ExitCost.waitDuration.inSeconds);
  }

  void updateReason(String reason) => state = state.copyWith(reason: reason);

  void next() {
    if (!state.canContinue || state.step >= ExitCost.lastStep) return;
    final step = state.step + 1;
    state = state.copyWith(step: step);
    unawaited(_recordLevel(step));
  }

  /// Último escalón: cierra la sesión como salida anticipada.
  Future<Result<FocusSession>> confirmExit() async {
    if (state.step != ExitCost.lastStep) {
      return Result.error(StateError('Faltan escalones'));
    }
    state = state.copyWith(busy: true);
    final result = await ref
        .read(finishSessionUseCaseProvider)
        .call(
          sessionId,
          outcome: SessionOutcome.earlyExit,
          exitReason: state.reason.trim(),
        );
    if (!ref.mounted) return result;
    if (result case Ok(:final value)) {
      ref.read(finishedSessionProvider.notifier).show(value.id);
      state = state.copyWith(busy: false, exited: true);
    } else {
      state = state.copyWith(busy: false);
    }
    return result;
  }

  void _startCountdown() {
    _countdown = Timer.periodic(const Duration(seconds: 1), (timer) {
      final left = state.secondsLeft - 1;
      state = state.copyWith(secondsLeft: left < 0 ? 0 : left);
      if (left <= 0) timer.cancel();
    });
  }

  Future<void> _recordLevel(int level) =>
      ref.read(sessionRepositoryProvider).recordExitLevel(sessionId, level);
}
