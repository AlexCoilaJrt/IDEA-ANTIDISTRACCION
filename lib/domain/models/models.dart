import 'dart:typed_data';

import 'package:enfoque/domain/models/pomodoro_plan.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'focus_session.dart';
export 'pomodoro_plan.dart';
export 'study_block.dart';

part 'models.freezed.dart';

/// Rigurosidad del bloqueo.
enum Strictness {
  /// Bloquea solo los bloques de enfoque.
  standard,

  /// Bloquea toda la sesión, descansos incluidos.
  strict,
}

enum AppThemeMode { system, light, dark }

/// App instalada que aparece en el lanzador.
@freezed
abstract class InstalledApp with _$InstalledApp {
  const factory({
    required String packageName,
    required String label,
    Uint8List? icon,
  }) = _InstalledApp;
}

/// App que se puede usar durante una sesión.
@freezed
abstract class AllowedApp with _$AllowedApp {
  const factory({required String packageName, required String label}) =
      _AllowedApp;
}

/// Intento de abrir una app no permitida. Solo se guarda en el celular.
@freezed
abstract class DistractionEvent with _$DistractionEvent {
  const factory({required String packageName, required DateTime at}) =
      _DistractionEvent;
}

/// Estado de los permisos del motor de bloqueo.
@freezed
abstract class AppPermissions with _$AppPermissions {
  const factory({
    required bool usageAccess,
    required bool overlay,
    required bool notifications,
    required bool batteryOptimization,

    /// Alarmas puntuales para los avisos del horario.
    @Default(true) bool exactAlarms,
  }) = _AppPermissions;

  const new _();

  static const none = AppPermissions(
    usageAccess: false,
    overlay: false,
    notifications: false,
    batteryOptimization: false,
    exactAlarms: false,
  );

  /// Sin estos dos permisos no se puede bloquear.
  bool get canBlock => usageAccess && overlay;

  bool get allGranted =>
      usageAccess &&
      overlay &&
      notifications &&
      batteryOptimization &&
      exactAlarms;
}

enum PermissionKind {
  usageAccess,
  overlay,
  notifications,
  batteryOptimization,
  exactAlarms,
}

/// Regla de recordatorio que se envía al motor nativo (textos ya traducidos).
@freezed
abstract class ReminderRule with _$ReminderRule {
  const factory({
    required int blockId,
    required Set<int> weekdays,
    required int startMinute,
    required String title,
    required String detail,
  }) = _ReminderRule;
}

/// Ajustes del usuario.
@freezed
abstract class AppSettings with _$AppSettings {
  const factory({
    @Default(25) int dailyGoalMinutes,
    @Default(PomodoroPreset.classic) PomodoroPreset preset,
    @Default(45) int freeMinutes,
    @Default(1) int cycles,
    @Default(Strictness.standard) Strictness strictness,
    @Default(AppThemeMode.dark) AppThemeMode themeMode,
    @Default(false) bool onboardingDone,

    /// Si ya se preseleccionaron las apps sugeridas (calculadora, PDF...).
    @Default(false) bool allowlistSeeded,

    /// Nombre para el saludo de Inicio (opcional).
    @Default('') String displayName,
  }) = _AppSettings;

  const new _();

  PomodoroPlan get plan =>
      PomodoroPlan.fromPreset(preset, cycles: cycles, freeMinutes: freeMinutes);
}

/// Resumen de un día para la racha.
@freezed
abstract class DayFocus with _$DayFocus {
  const factory({
    /// Medianoche local del día.
    required DateTime day,
    required int focusedMinutes,
    required bool hadEarlyExit,
  }) = _DayFocus;
}

@freezed
abstract class StreakSummary with _$StreakSummary {
  const factory({
    required int current,
    required int best,
    required bool todayQualified,
  }) = _StreakSummary;

  static const empty = StreakSummary(
    current: 0,
    best: 0,
    todayQualified: false,
  );
}

/// Estado que reporta el motor nativo.
@freezed
abstract class BlockerStatus with _$BlockerStatus {
  const factory({
    required bool active,
    required List<DistractionEvent> distractions,
    int? sessionId,
    DateTime? endsAt,
  }) = _BlockerStatus;
}

/// Configuración que recibe el motor nativo.
@freezed
abstract class BlockerConfig with _$BlockerConfig {
  const factory({
    required int sessionId,
    required DateTime startedAt,
    required PomodoroPlan plan,
    required List<String> allowedPackages,
    required Strictness strictness,
    String? label,
  }) = _BlockerConfig;

  const new _();

  DateTime get endsAt => startedAt.add(plan.totalDuration);
}

/// Eventos que llegan desde el motor nativo.
///
/// Las subclases sin datos NO tienen constructor `const` a propósito: Riverpod
/// descarta valores iguales seguidos, y dos `const` son idénticos, así que se
/// perdería el segundo "Salir antes" o "Empezar ahora".
sealed class BlockerEvent {
  const new();
}

final class DistractionAttempted extends BlockerEvent {
  const new(this.event);
  final DistractionEvent event;
}

final class BlockerSessionFinished extends BlockerEvent {
  const new(this.sessionId);
  final int sessionId;
}

final class BlockerSessionInterrupted extends BlockerEvent {
  const new(this.sessionId);
  final int sessionId;
}

final class EarlyExitRequested extends BlockerEvent {
  // ignore: ver BlockerEvent.
  new();
}

/// "Empezar ahora" en un recordatorio del horario.
final class StartRequested extends BlockerEvent {
  // ignore: ver BlockerEvent.
  new();
}
