import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/data/services/blocker/blocker_api.g.dart';
import 'package:enfoque/data/services/blocker/blocker_service.dart';
import 'package:enfoque/domain/models/models.dart';

/// Acceso al motor de bloqueo nativo, con modelos de dominio.
abstract class BlockerRepository {
  Future<Result<void>> start(BlockerConfig config);

  Future<Result<void>> stop();

  Future<Result<BlockerStatus>> status();

  Stream<BlockerEvent> get events;

  Future<Result<AppPermissions>> permissions();

  Future<Result<void>> requestPermission(PermissionKind kind);

  /// Abre "Información de la app" (para permitir ajustes restringidos).
  Future<Result<void>> openAppDetails();

  /// Reemplaza las reglas de recordatorio del horario.
  Future<Result<void>> setReminderRules(List<ReminderRule> rules);

  /// Id del bloque cuyo "Empezar ahora" se tocó (una sola vez).
  Future<Result<int?>> consumeStartRequest();

  /// `true` una sola vez si el usuario tocó "Salir antes" en el bloqueo.
  Future<Result<bool>> consumeExitRequest();

  Future<Result<void>> launchApp(String packageName);
}

class BlockerRepositoryImpl implements BlockerRepository {
  new(this._service);

  final BlockerService _service;

  @override
  Future<Result<void>> start(BlockerConfig config) => guard(
    () => _service.startSession(
      SessionConfigDto(
        sessionId: config.sessionId,
        startedAtMillis: config.startedAt.millisecondsSinceEpoch,
        endsAtMillis: config.endsAt.millisecondsSinceEpoch,
        focusMinutes: config.plan.focusMinutes,
        breakMinutes: config.plan.breakMinutes,
        cycles: config.plan.cycles,
        longBreakMinutes: config.plan.longBreakMinutes,
        allowedPackages: config.allowedPackages,
        label: config.label,
        strictness: switch (config.strictness) {
          Strictness.standard => StrictnessDto.standard,
          Strictness.strict => StrictnessDto.strict,
        },
      ),
    ),
  );

  @override
  Future<Result<void>> stop() => guard(_service.stopSession);

  @override
  Future<Result<BlockerStatus>> status() => guard(() async {
    final dto = await _service.getStatus();
    return BlockerStatus(
      active: dto.active,
      sessionId: dto.sessionId,
      endsAt: dto.endsAtMillis == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(dto.endsAtMillis!),
      distractions: dto.distractions.map(_distraction).toList(),
    );
  });

  @override
  Stream<BlockerEvent> get events => _service.events.map(
    (e) => switch (e) {
      NativeDistraction(:final dto) => DistractionAttempted(_distraction(dto)),
      NativeFinished(:final sessionId) => BlockerSessionFinished(sessionId),
      NativeInterrupted(:final sessionId) => BlockerSessionInterrupted(
        sessionId,
      ),
      NativeExitRequested() => EarlyExitRequested(),
      NativeStartRequested() => StartRequested(),
    },
  );

  @override
  Future<Result<AppPermissions>> permissions() => guard(() async {
    final dto = await _service.getPermissions();
    return AppPermissions(
      usageAccess: dto.usageAccess,
      overlay: dto.overlay,
      notifications: dto.notifications,
      batteryOptimization: dto.batteryOptimization,
      exactAlarms: dto.exactAlarms,
    );
  });

  @override
  Future<Result<void>> requestPermission(PermissionKind kind) => guard(
    () => _service.requestPermission(switch (kind) {
      PermissionKind.usageAccess => PermissionKindDto.usageAccess,
      PermissionKind.overlay => PermissionKindDto.overlay,
      PermissionKind.notifications => PermissionKindDto.notifications,
      PermissionKind.batteryOptimization =>
        PermissionKindDto.batteryOptimization,
      PermissionKind.exactAlarms => PermissionKindDto.exactAlarms,
    }),
  );

  @override
  Future<Result<void>> openAppDetails() => guard(_service.openAppDetails);

  @override
  Future<Result<void>> setReminderRules(List<ReminderRule> rules) => guard(
    () => _service.setReminderRules([
      for (final r in rules)
        ReminderRuleDto(
          blockId: r.blockId,
          weekdays: r.weekdays.toList()..sort(),
          startMinute: r.startMinute,
          title: r.title,
          detail: r.detail,
        ),
    ]),
  );

  @override
  Future<Result<int?>> consumeStartRequest() =>
      guard(_service.consumeStartRequest);

  @override
  Future<Result<bool>> consumeExitRequest() =>
      guard(_service.consumeExitRequest);

  @override
  Future<Result<void>> launchApp(String packageName) =>
      guard(() => _service.launchApp(packageName));

  static DistractionEvent _distraction(DistractionDto dto) => DistractionEvent(
    packageName: dto.packageName,
    at: DateTime.fromMillisecondsSinceEpoch(dto.atMillis),
  );
}
