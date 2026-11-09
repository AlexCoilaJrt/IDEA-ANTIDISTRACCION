// Contrato tipado entre Flutter y el motor de bloqueo nativo (Kotlin).
// Regenerar con: dart run pigeon --input pigeons/blocker.dart
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/data/services/blocker/blocker_api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut: 'android/app/src/main/kotlin/com/alexcoila/enfoque/blocker/BlockerApi.g.kt',
    kotlinOptions: KotlinOptions(package: 'com.alexcoila.enfoque.blocker'),
    dartPackageName: 'enfoque',
  ),
)
/// Rigurosidad del bloqueo.
enum StrictnessDto {
  /// Bloquea solo durante los bloques de enfoque; los descansos son libres.
  standard,

  /// Bloquea durante toda la sesión, descansos incluidos.
  strict,
}

/// Permisos que necesita el motor de bloqueo.
enum PermissionKindDto {
  usageAccess,
  overlay,
  notifications,
  batteryOptimization,
}

/// Configuración que Flutter envía para empezar una sesión.
class SessionConfigDto {
  new({
    required this.sessionId,
    required this.startedAtMillis,
    required this.endsAtMillis,
    required this.focusMinutes,
    required this.breakMinutes,
    required this.cycles,
    required this.allowedPackages,
    required this.strictness,
  });

  int sessionId;
  int startedAtMillis;
  int endsAtMillis;
  int focusMinutes;
  int breakMinutes;
  int cycles;
  List<String> allowedPackages;
  StrictnessDto strictness;
}

/// Un intento de abrir una app no permitida. Nunca sale del celular.
class DistractionDto {
  new({required this.packageName, required this.atMillis});

  String packageName;
  int atMillis;
}

/// Estado actual del motor nativo.
class BlockerStatusDto {
  new({
    required this.active,
    required this.distractions,
    this.sessionId,
    this.endsAtMillis,
  });

  bool active;
  int? sessionId;
  int? endsAtMillis;
  List<DistractionDto> distractions;
}

/// Estado de cada permiso.
class PermissionsDto {
  new({
    required this.usageAccess,
    required this.overlay,
    required this.notifications,
    required this.batteryOptimization,
  });

  bool usageAccess;
  bool overlay;
  bool notifications;
  bool batteryOptimization;
}

/// App instalada que aparece en el lanzador.
class InstalledAppDto {
  new({required this.packageName, required this.label, this.iconPng});

  String packageName;
  String label;
  Uint8List? iconPng;
}

@HostApi()
abstract class BlockerHostApi {
  /// Arranca el servicio en primer plano y empieza a bloquear.
  void startSession(SessionConfigDto config);

  /// Detiene el bloqueo (sesión terminada o salida anticipada).
  void stopSession();

  /// Estado actual, incluidos los intentos de distracción guardados.
  BlockerStatusDto getStatus();

  /// Si Flutter debe abrir la hoja de salida al volver desde el bloqueo.
  /// Se consume al leerlo.
  bool consumeExitRequest();

  PermissionsDto getPermissions();

  /// Abre la pantalla del sistema para conceder el permiso.
  void requestPermission(PermissionKindDto kind);

  /// Abre "Información de la app" (para "Permitir ajustes restringidos").
  void openAppDetails();

  /// Apps del lanzador (usa `<queries>`, no QUERY_ALL_PACKAGES).
  @async
  List<InstalledAppDto> getLaunchableApps();

  void launchApp(String packageName);
}

@FlutterApi()
abstract class BlockerFlutterApi {
  void onDistractionAttempt(DistractionDto event);

  void onSessionFinished(int sessionId);

  void onSessionInterrupted(int sessionId);

  /// El usuario tocó "Salir antes" en la pantalla de bloqueo.
  void onEarlyExitRequested();
}
