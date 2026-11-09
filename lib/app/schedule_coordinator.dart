import 'dart:async';
import 'dart:ui' show Locale;

import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/domain/use_cases/session_use_cases.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_coordinator.g.dart';

/// Por qué no se pudo empezar una sesión desde un recordatorio.
enum ScheduledStartProblem { missingPermissions, alreadyActive, other }

/// Mantiene los recordatorios nativos al día con el horario y atiende el
/// botón "Empezar ahora" de los avisos.
@Riverpod(keepAlive: true)
class ScheduleCoordinator extends _$ScheduleCoordinator {
  @override
  ScheduledStartProblem? build() {
    ref
      ..listen(studyBlocksProvider, (_, next) {
        if (next.value case final blocks?) unawaited(syncReminders(blocks));
      }, fireImmediately: true)
      ..listen(appResumedProvider, (_, _) => unawaited(checkStartRequest()))
      ..listen(blockerEventsProvider, (_, next) {
        if (next.value is StartRequested) unawaited(checkStartRequest());
      });
    unawaited(Future.microtask(checkStartRequest));
    return null;
  }

  /// Envía al motor nativo una regla por cada bloque activo.
  Future<void> syncReminders(List<StudyBlock> blocks) async {
    final l10n = lookupAppLocalizations(const Locale('es'));
    await ref.read(blockerRepositoryProvider).setReminderRules([
      for (final b in blocks)
        if (b.enabled && b.weekdays.isNotEmpty) reminderRuleFor(b, l10n),
    ]);
  }

  /// Si se tocó "Empezar ahora", empieza la sesión con el plan del bloque.
  Future<void> checkStartRequest() async {
    final request = await ref
        .read(blockerRepositoryProvider)
        .consumeStartRequest();
    final blockId = request.valueOrNull;
    if (blockId == null || !ref.mounted) return;
    final block = (await ref.read(scheduleRepositoryProvider).getById(blockId))
        .valueOrNull;
    if (!ref.mounted) return;
    final result = await ref
        .read(startSessionUseCaseProvider)
        .call(plan: block?.plan);
    if (!ref.mounted) return;
    // El router abre la pantalla de sesión solo cuando hay una activa.
    state = switch (result) {
      Ok() => null,
      Failure(error: MissingPermissionsException()) =>
        ScheduledStartProblem.missingPermissions,
      Failure(error: SessionAlreadyActiveException()) =>
        ScheduledStartProblem.alreadyActive,
      Failure() => ScheduledStartProblem.other,
    };
  }

  /// La vista ya mostró el problema.
  void clearProblem() => state = null;
}

/// Textos del aviso para un bloque (también se usan en las pruebas).
ReminderRule reminderRuleFor(StudyBlock b, AppLocalizations l10n) {
  final plan = b.plan;
  final endMinute = (b.startMinute + b.duration.inMinutes) % (24 * 60);
  String hhmm(int m) =>
      '${(m ~/ 60).toString().padLeft(2, '0')}:'
      '${(m % 60).toString().padLeft(2, '0')}';
  final kind = switch (b.preset) {
    PomodoroPreset.free => l10n.scheduleKindFree(plan.focusMinutes),
    _ => l10n.scheduleKindPomodoro(
      plan.focusMinutes,
      plan.breakMinutes,
      plan.cycles,
    ),
  };
  return ReminderRule(
    blockId: b.id,
    weekdays: b.weekdays,
    startMinute: b.startMinute,
    title: b.label ?? l10n.scheduleDefaultTitle,
    detail: l10n.scheduleReminderDetail(kind, hhmm(endMinute)),
  );
}
