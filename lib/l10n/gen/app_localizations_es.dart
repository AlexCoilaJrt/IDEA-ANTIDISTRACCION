// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Enfoque';

  @override
  String get navHome => 'Inicio';

  @override
  String get navSchedule => 'Horario';

  @override
  String get navRooms => 'Salas';

  @override
  String get navProgress => 'Progreso';

  @override
  String get commonRetry => 'Reintentar';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonLoading => 'Cargando…';

  @override
  String get commonGenericError => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String commonMinutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get welcomeTitle => 'Estudia sin distracciones';

  @override
  String get welcomeBody =>
      'Enfoque bloquea las apps que te distraen mientras estudias. Tú eliges qué apps quedan permitidas.';

  @override
  String get welcomePointBlock =>
      'Bloqueo de apps durante tus sesiones Pomodoro';

  @override
  String get welcomePointExit =>
      'Salir antes tiene un costo: piénsalo dos veces';

  @override
  String get welcomePointStreak =>
      'Racha diaria y estadísticas, todo guardado en tu celular';

  @override
  String get welcomeStart => 'Empezar';

  @override
  String get permissionsTitle => 'Permisos';

  @override
  String get permissionsBody =>
      'Para bloquear apps, Android necesita que actives estos permisos. Tus datos de uso nunca salen del celular.';

  @override
  String get permissionUsageTitle => 'Acceso a datos de uso';

  @override
  String get permissionUsageBody =>
      'Para saber qué app está abierta durante una sesión.';

  @override
  String get permissionOverlayTitle => 'Mostrar sobre otras apps';

  @override
  String get permissionOverlayBody =>
      'Para mostrar la pantalla de bloqueo encima de una app no permitida.';

  @override
  String get permissionNotificationsTitle => 'Notificaciones';

  @override
  String get permissionNotificationsBody =>
      'Para mostrar el aviso fijo con el tiempo restante.';

  @override
  String get permissionBatteryTitle => 'Sin optimización de batería';

  @override
  String get permissionBatteryBody =>
      'Para que Android no detenga el bloqueo a mitad de la sesión.';

  @override
  String get permissionRequired => 'Obligatorio';

  @override
  String get permissionRecommended => 'Recomendado';

  @override
  String get permissionGrant => 'Activar';

  @override
  String get permissionGranted => 'Activado';

  @override
  String get permissionsContinue => 'Continuar';

  @override
  String get permissionsMissing =>
      'Activa los permisos obligatorios para continuar.';

  @override
  String get allowlistTitle => 'Apps permitidas';

  @override
  String get allowlistBody =>
      'Estas apps se pueden abrir durante una sesión. Las llamadas y la pantalla de inicio siempre funcionan.';

  @override
  String get allowlistSearch => 'Buscar apps';

  @override
  String get allowlistEmpty => 'No se encontraron apps.';

  @override
  String allowlistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps permitidas',
      one: '1 app permitida',
      zero: 'Ninguna app permitida',
    );
    return '$_temp0';
  }

  @override
  String get allowlistDone => 'Listo';

  @override
  String get homeGreeting => '¿Listo para concentrarte?';

  @override
  String homeTodayProgress(int done, int goal) {
    return 'Hoy: $done de $goal min';
  }

  @override
  String get homeGoalReached => '¡Meta de hoy cumplida!';

  @override
  String get homePresetLabel => 'Tipo de sesión';

  @override
  String get homePresetClassic => '25 / 5';

  @override
  String get homePresetLong => '50 / 10';

  @override
  String get homePresetFree => 'Libre';

  @override
  String homeCyclesLabel(int cycles) {
    return 'Bloques: $cycles';
  }

  @override
  String homeFreeMinutesLabel(int minutes) {
    return 'Duración: $minutes min';
  }

  @override
  String homeSessionSummary(int focus, String time) {
    return '$focus min de enfoque · termina a las $time';
  }

  @override
  String get homeStart => 'Empezar sesión';

  @override
  String get homeAllowedApps => 'Apps permitidas';

  @override
  String get homeSettings => 'Ajustes';

  @override
  String get homeNeedsPermissions => 'Faltan permisos para bloquear apps.';

  @override
  String get homeReviewPermissions => 'Revisar';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días',
      one: '1 día',
      zero: 'Sin racha',
    );
    return '$_temp0';
  }

  @override
  String get streakLabel => 'Racha';

  @override
  String get sessionPhaseFocus => 'Enfoque';

  @override
  String get sessionPhaseRest => 'Descanso';

  @override
  String get sessionPhaseDone => 'Terminado';

  @override
  String sessionCycle(int current, int total) {
    return 'Bloque $current de $total';
  }

  @override
  String sessionRemainingTotal(String time) {
    return 'Quedan $time en total';
  }

  @override
  String sessionDistractions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count intentos de distracción',
      one: '1 intento de distracción',
      zero: 'Sin intentos de distracción',
    );
    return '$_temp0';
  }

  @override
  String get sessionAllowedApps => 'Apps permitidas';

  @override
  String get sessionExitEarly => 'Salir antes';

  @override
  String sessionTimerSemantics(String phase, String time) {
    return '$phase, quedan $time';
  }

  @override
  String get exitTitle => '¿Seguro que quieres salir?';

  @override
  String exitStep(int step) {
    return 'Paso $step de 3';
  }

  @override
  String get exitStep1Body => 'Respira. Espera un minuto antes de decidir.';

  @override
  String exitStep1Countdown(int seconds) {
    return 'Puedes continuar en $seconds s';
  }

  @override
  String exitStep2Body(int min) {
    return 'Escribe por qué quieres salir (mínimo $min caracteres).';
  }

  @override
  String get exitStep2Hint => 'Quiero salir porque…';

  @override
  String exitStep2Counter(int current, int min) {
    return '$current / $min';
  }

  @override
  String get exitStep3Body =>
      'Si sales ahora, pierdes la racha de hoy y los puntos de esta sesión.';

  @override
  String get exitConfirm => 'Salir y perder la racha';

  @override
  String get exitKeepStudying => 'Seguir estudiando';

  @override
  String get summaryCompletedTitle => '¡Sesión completada!';

  @override
  String get summaryEarlyExitTitle => 'Saliste antes';

  @override
  String get summaryInterruptedTitle => 'Sesión interrumpida';

  @override
  String get summaryFocused => 'Minutos concentrado';

  @override
  String get summaryPoints => 'Puntos';

  @override
  String get summaryDistractions => 'Intentos de distracción';

  @override
  String get summaryBackHome => 'Volver al inicio';

  @override
  String get progressTitle => 'Progreso';

  @override
  String get statCurrentStreak => 'Racha actual';

  @override
  String get statBestStreak => 'Mejor racha';

  @override
  String get statToday => 'Hoy';

  @override
  String get statWeek => 'Esta semana';

  @override
  String get statSessions => 'Sesiones completas';

  @override
  String get statDistractions => 'Distracciones (7 días)';

  @override
  String get statWeekChart => 'Minutos de los últimos 7 días';

  @override
  String get statHeatmap => 'Últimas 12 semanas';

  @override
  String get statRecentSessions => 'Sesiones recientes';

  @override
  String get statEmptyTitle => 'Aún no hay sesiones';

  @override
  String get statEmptyBody =>
      'Cuando termines tu primera sesión, aquí verás tu progreso.';

  @override
  String get sessionCardCompleted => 'Completada';

  @override
  String get sessionCardEarlyExit => 'Salida anticipada';

  @override
  String get sessionCardInterrupted => 'Interrumpida';

  @override
  String get sessionCardActive => 'En curso';

  @override
  String get scheduleComingTitle => 'Horario y exámenes';

  @override
  String get scheduleComingBody =>
      'Llega en la fase 2: materias, horario, exámenes y planificador automático.';

  @override
  String get roomsComingTitle => 'Salas de estudio';

  @override
  String get roomsComingBody =>
      'Llega en la fase 3: estudia en grupo con presencia en vivo.';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsDailyGoal => 'Meta diaria';

  @override
  String settingsDailyGoalValue(int minutes) {
    return '$minutes minutos';
  }

  @override
  String get settingsStrictness => 'Modo estricto';

  @override
  String get settingsStrictnessBody => 'Bloquea también durante los descansos.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsThemeLight => 'Claro';

  @override
  String get settingsThemeDark => 'Oscuro';

  @override
  String get settingsPermissions => 'Permisos';

  @override
  String get settingsAllowedApps => 'Apps permitidas';

  @override
  String get settingsPrivacy =>
      'La lista de apps que abres nunca sale de tu celular.';
}
