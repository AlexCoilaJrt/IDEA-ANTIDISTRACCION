import 'dart:async';
import 'dart:typed_data';

import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/logic/pomodoro_clock.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_view_model.freezed.dart';
part 'session_view_model.g.dart';

@freezed
abstract class SessionUiState with _$SessionUiState {
  const factory({
    required FocusSession session,
    required PomodoroPhase phase,
    required List<AllowedApp> allowedApps,
    @Default(0) int distractionCount,

    /// El usuario tocó "Salir antes" en la pantalla de bloqueo nativa.
    @Default(false) bool exitRequested,

    /// Íconos de las apps permitidas (por paquete).
    @Default(<String, Uint8List>{}) Map<String, Uint8List> icons,
    @Default(Strictness.standard) Strictness strictness,
  }) = _SessionUiState;
}

/// Sesión activa a pantalla completa. Se actualiza cada segundo.
@riverpod
class SessionViewModel extends _$SessionViewModel {
  Timer? _ticker;
  bool _reconciling = false;

  @override
  SessionUiState? build() {
    final session = ref.watch(activeSessionProvider).value;
    if (session == null) return null;
    final allowed = ref.watch(allowedAppsStreamProvider).value ?? const [];
    final clock = ref.watch(clockProvider);
    final strictness =
        ref.watch(settingsStreamProvider).value?.strictness ??
        Strictness.standard;

    _ticker = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
    ref
      ..onDispose(() => _ticker?.cancel())
      ..listen(blockerEventsProvider, (_, next) {
        switch (next.value) {
          case DistractionAttempted():
            final s = state;
            if (s != null) {
              state = s.copyWith(distractionCount: s.distractionCount + 1);
            }
          case EarlyExitRequested():
            unawaited(_checkExitRequest());
          default:
            break;
        }
      })
      ..listen(appResumedProvider, (_, _) => unawaited(_checkExitRequest()));

    unawaited(_loadNativeState(session.id));

    return SessionUiState(
      session: session,
      phase: PomodoroClock.phaseAt(session.plan, session.startedAt, clock()),
      allowedApps: allowed,
      strictness: strictness,
    );
  }

  /// La vista ya abrió la hoja de salida.
  void exitRequestHandled() {
    final s = state;
    if (s != null && s.exitRequested) state = s.copyWith(exitRequested: false);
  }

  Future<void> launchAllowedApp(String packageName) async {
    await ref.read(blockerRepositoryProvider).launchApp(packageName);
  }

  void _tick() {
    final s = state;
    if (s == null) return;
    final now = ref.read(clockProvider)();
    final phase = PomodoroClock.phaseAt(
      s.session.plan,
      s.session.startedAt,
      now,
    );
    state = s.copyWith(phase: phase);
    if (phase.kind == PomodoroPhaseKind.done && !_reconciling) {
      _reconciling = true;
      unawaited(
        ref
            .read(sessionSupervisorProvider.notifier)
            .reconcile()
            .whenComplete(() => _reconciling = false),
      );
    }
  }

  Future<void> _loadNativeState(int sessionId) async {
    final status = await ref.read(blockerRepositoryProvider).status();
    if (!ref.mounted) return;
    if (status case Ok(:final value) when value.sessionId == sessionId) {
      final s = state;
      if (s != null) {
        state = s.copyWith(distractionCount: value.distractions.length);
      }
    }
    await _checkExitRequest();
    await _loadIcons();
  }

  Future<void> _loadIcons() async {
    final apps = (await ref.read(allowedAppsRepositoryProvider).installedApps())
        .valueOrNull;
    if (!ref.mounted || apps == null) return;
    final s = state;
    if (s == null) return;
    state = s.copyWith(icons: {for (final a in apps) a.packageName: ?a.icon});
  }

  Future<void> _checkExitRequest() async {
    final result = await ref
        .read(blockerRepositoryProvider)
        .consumeExitRequest();
    if (!ref.mounted) return;
    if (result case Ok(value: true)) {
      final s = state;
      if (s != null) state = s.copyWith(exitRequested: true);
    }
  }
}
