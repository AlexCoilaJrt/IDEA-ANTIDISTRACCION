import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/data/repositories/allowed_apps_repository.dart';
import 'package:enfoque/data/repositories/blocker_repository.dart';
import 'package:enfoque/data/repositories/session_repository.dart';
import 'package:enfoque/data/repositories/settings_repository.dart';
import 'package:enfoque/data/repositories/streak_repository.dart';
import 'package:enfoque/domain/logic/pomodoro_clock.dart';
import 'package:enfoque/domain/logic/streak_calculator.dart';
import 'package:enfoque/domain/models/models.dart';

typedef Clock = DateTime Function();

/// Faltan permisos para bloquear.
class MissingPermissionsException implements Exception {
  const new();
}

/// Ya hay una sesión en curso.
class SessionAlreadyActiveException implements Exception {
  const new();
}

/// Crea la sesión en drift y arranca el motor de bloqueo.
class StartSessionUseCase {
  new({
    required this._sessions,
    required this._allowedApps,
    required this._settings,
    required this._blocker,
    required this._clock,
  });

  final SessionRepository _sessions;
  final AllowedAppsRepository _allowedApps;
  final SettingsRepository _settings;
  final BlockerRepository _blocker;
  final Clock _clock;

  /// Empieza con el plan de los ajustes, o con [plan] si viene de un bloque
  /// del horario.
  Future<Result<FocusSession>> call({PomodoroPlan? plan}) async {
    final permissions = await _blocker.permissions();
    if (permissions case Ok(:final value) when !value.canBlock) {
      return const Result.error(MissingPermissionsException());
    }
    if (permissions case Failure(:final error)) return Result.error(error);

    final active = await _sessions.active();
    if (active case Ok(:final value) when value != null) {
      return const Result.error(SessionAlreadyActiveException());
    }

    final settingsResult = await _settings.load();
    if (settingsResult case Failure(:final error)) return Result.error(error);
    final settings = settingsResult.valueOrNull!;

    final allowedResult = await _allowedApps.allowed();
    if (allowedResult case Failure(:final error)) return Result.error(error);

    final startedAt = _clock();
    final sessionPlan = plan ?? settings.plan;
    final created = await _sessions.create(
      startedAt: startedAt,
      plan: sessionPlan,
    );
    if (created case Failure(:final error)) return Result.error(error);
    final session = created.valueOrNull!;

    final started = await _blocker.start(
      BlockerConfig(
        sessionId: session.id,
        startedAt: startedAt,
        plan: sessionPlan,
        allowedPackages: [
          for (final app in allowedResult.valueOrNull!) app.packageName,
        ],
        strictness: settings.strictness,
      ),
    );
    if (started case Failure(:final error, :final stackTrace)) {
      await _sessions.delete(session.id);
      return Result.error(error, stackTrace);
    }
    return Result.ok(session);
  }
}

/// Cierra una sesión: detiene el bloqueo, guarda distracciones y actualiza
/// la racha del día. Es idempotente.
class FinishSessionUseCase {
  new({
    required this._sessions,
    required this._streak,
    required this._blocker,
    required this._clock,
  });

  final SessionRepository _sessions;
  final StreakRepository _streak;
  final BlockerRepository _blocker;
  final Clock _clock;

  /// Serializa los cierres: el fin natural, el evento nativo y "Salir antes"
  /// pueden llegar casi a la vez.
  Future<void> _lock = Future.value();

  Future<Result<FocusSession>> call(
    int sessionId, {
    required SessionOutcome outcome,
    String? exitReason,
  }) {
    final result = _lock.then(
      (_) => _finish(sessionId, outcome: outcome, exitReason: exitReason),
    );
    _lock = result.then((_) {});
    return result;
  }

  Future<Result<FocusSession>> _finish(
    int sessionId, {
    required SessionOutcome outcome,
    String? exitReason,
  }) async {
    assert(outcome != SessionOutcome.active, 'Una sesión cerrada no es activa');
    final found = await _sessions.getById(sessionId);
    if (found case Failure(:final error)) return Result.error(error);
    final session = found.valueOrNull!;
    if (!session.isActive) return Result.ok(session);

    // Leer las distracciones antes de detener el motor (que las borra).
    final status = await _blocker.status();
    final distractions = switch (status) {
      Ok(:final value) when value.sessionId == sessionId => value.distractions,
      _ => const <DistractionEvent>[],
    };
    await _blocker.stop();

    final now = _clock();
    final completed = outcome == SessionOutcome.completed;
    final endedAt = completed && now.isAfter(session.plannedEnd)
        ? session.plannedEnd
        : now;
    final focused = completed
        ? session.plan.plannedFocusMinutes
        : PomodoroClock.focusedMinutesAt(session.plan, session.startedAt, now);

    final updated = await _sessions.complete(
      sessionId,
      outcome: outcome,
      endedAt: endedAt,
      focusedMinutes: focused,
      distractions: distractions,
      exitReason: exitReason,
    );
    if (updated case Failure(:final error)) return Result.error(error);

    await _updateDay(session.startedAt);
    return updated;
  }

  Future<void> _updateDay(DateTime anyTime) async {
    final day = StreakCalculator.dateOnly(anyTime);
    final next = DateTime(day.year, day.month, day.day + 1);
    final sessions = await _sessions.between(day, next);
    if (sessions case Ok(:final value)) {
      await _streak.upsertDay(StreakCalculator.aggregate(day, value));
    }
  }
}

/// Al abrir o volver a la app: concilia drift con el motor nativo (por si la
/// sesión terminó o se interrumpió con la app cerrada).
class ReconcileSessionUseCase {
  new({
    required this._sessions,
    required this._blocker,
    required this._finish,
    required this._clock,
  });

  final SessionRepository _sessions;
  final BlockerRepository _blocker;
  final FinishSessionUseCase _finish;
  final Clock _clock;

  /// Devuelve la sesión cerrada por la conciliación, si hubo una.
  Future<Result<FocusSession?>> call() async {
    final activeResult = await _sessions.active();
    if (activeResult case Failure(:final error)) return Result.error(error);
    final active = activeResult.valueOrNull;
    final status = (await _blocker.status()).valueOrNull;

    if (active == null) {
      // Motor encendido sin sesión en drift: se apaga.
      if (status?.active ?? false) await _blocker.stop();
      return const Result.ok(null);
    }

    if (!_clock().isBefore(active.plannedEnd)) {
      return await _finish(active.id, outcome: SessionOutcome.completed);
    }
    // Si no se pudo leer el motor, no se toca nada.
    if (status == null) return const Result.ok(null);
    final nativeRunning = status.active && status.sessionId == active.id;
    if (!nativeRunning) {
      return await _finish(active.id, outcome: SessionOutcome.interrupted);
    }
    return const Result.ok(null);
  }
}
