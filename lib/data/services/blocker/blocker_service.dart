import 'dart:async';

import 'package:enfoque/data/services/blocker/blocker_api.g.dart';

/// Envuelve el canal Pigeon con el motor nativo. Sin lógica de negocio.
///
/// Recibe los eventos de [BlockerFlutterApi] y los reenvía como stream.
class BlockerService implements BlockerFlutterApi {
  new({BlockerHostApi? hostApi}) : _host = hostApi ?? BlockerHostApi() {
    BlockerFlutterApi.setUp(this);
  }

  final BlockerHostApi _host;
  final _events = StreamController<NativeBlockerEvent>.broadcast();

  Stream<NativeBlockerEvent> get events => _events.stream;

  Future<void> startSession(SessionConfigDto config) =>
      _host.startSession(config);

  Future<void> stopSession() => _host.stopSession();

  Future<BlockerStatusDto> getStatus() => _host.getStatus();

  Future<bool> consumeExitRequest() => _host.consumeExitRequest();

  Future<PermissionsDto> getPermissions() => _host.getPermissions();

  Future<void> requestPermission(PermissionKindDto kind) =>
      _host.requestPermission(kind);

  Future<void> openAppDetails() => _host.openAppDetails();

  Future<List<InstalledAppDto>> getLaunchableApps() =>
      _host.getLaunchableApps();

  Future<void> launchApp(String packageName) => _host.launchApp(packageName);

  @override
  void onDistractionAttempt(DistractionDto event) =>
      _events.add(NativeDistraction(event));

  @override
  void onSessionFinished(int sessionId) =>
      _events.add(NativeFinished(sessionId));

  @override
  void onSessionInterrupted(int sessionId) =>
      _events.add(NativeInterrupted(sessionId));

  @override
  void onEarlyExitRequested() => _events.add(const NativeExitRequested());

  @override
  void onStartRequested() => _events.add(const NativeStartRequested());

  Future<void> setReminderRules(List<ReminderRuleDto> rules) =>
      _host.setReminderRules(rules);

  Future<int?> consumeStartRequest() => _host.consumeStartRequest();

  void dispose() {
    BlockerFlutterApi.setUp(null);
    unawaited(_events.close());
  }
}

/// Eventos tal como llegan del motor nativo.
sealed class NativeBlockerEvent {
  const new();
}

final class NativeDistraction extends NativeBlockerEvent {
  const new(this.dto);
  final DistractionDto dto;
}

final class NativeFinished extends NativeBlockerEvent {
  const new(this.sessionId);
  final int sessionId;
}

final class NativeInterrupted extends NativeBlockerEvent {
  const new(this.sessionId);
  final int sessionId;
}

final class NativeExitRequested extends NativeBlockerEvent {
  const new();
}

final class NativeStartRequested extends NativeBlockerEvent {
  const new();
}
