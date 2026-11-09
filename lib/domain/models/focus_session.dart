import 'package:enfoque/domain/models/pomodoro_plan.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_session.freezed.dart';

enum SessionOutcome {
  /// Sesión en curso.
  active,

  /// Terminó a tiempo.
  completed,

  /// El usuario pasó los tres escalones de "Salir antes".
  earlyExit,

  /// El sistema detuvo el bloqueo (p. ej. se revocó un permiso).
  interrupted,
}

/// Una sesión de enfoque.
@freezed
abstract class FocusSession with _$FocusSession {
  const factory({
    required int id,
    required DateTime startedAt,
    required PomodoroPlan plan,
    required SessionOutcome outcome,
    DateTime? endedAt,
    @Default(0) int focusedMinutes,
    @Default(0) int exitLevel,
    @Default(0) int distractionCount,
    String? exitReason,
    int? subjectId,
    String? roomId,

    /// Materia o tema (viene del bloque del horario).
    String? label,
  }) = _FocusSession;

  const new _();

  DateTime get plannedEnd => startedAt.add(plan.totalDuration);

  int get plannedMinutes => plan.plannedFocusMinutes;

  bool get isActive => outcome == SessionOutcome.active;

  bool get earlyExit => outcome == SessionOutcome.earlyExit;

  /// 1 punto por minuto concentrado; una salida anticipada los anula.
  int get points => earlyExit ? 0 : focusedMinutes;
}
