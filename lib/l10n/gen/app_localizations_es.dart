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
  String get scheduleTitle => 'Tu horario de estudio';

  @override
  String get scheduleDefaultTitle => 'Sesión de estudio';

  @override
  String scheduleKindPomodoro(int focus, int rest, int cycles) {
    String _temp0 = intl.Intl.pluralLogic(
      cycles,
      locale: localeName,
      other: '$cycles bloques de $focus/$rest',
      one: '1 bloque de $focus/$rest',
    );
    return '$_temp0';
  }

  @override
  String scheduleKindFree(int minutes) {
    return '$minutes min seguidos';
  }

  @override
  String scheduleReminderDetail(String kind, String end) {
    return '$kind · termina a las $end';
  }

  @override
  String get scheduleNextTitle => 'Próxima sesión';

  @override
  String get scheduleNowTitle => 'Ahora, según tu horario';

  @override
  String scheduleWhen(String day, String time) {
    return '$day a las $time';
  }

  @override
  String get scheduleToday => 'Hoy';

  @override
  String get scheduleTomorrow => 'Mañana';

  @override
  String scheduleRange(String start, String end) {
    return '$start – $end';
  }

  @override
  String get scheduleEmptyTitle => 'Aún no tienes horario';

  @override
  String get scheduleEmptyBody =>
      'Agrega los días y horas en que quieres estudiar. Te avisaremos 10 minutos antes y a la hora, con un botón para empezar.';

  @override
  String get scheduleAdd => 'Agregar bloque';

  @override
  String get scheduleDayFree => 'Libre';

  @override
  String get schedulePaused => 'Pausado';

  @override
  String get scheduleRemindersNote =>
      'Te avisamos 10 min antes y a la hora, con el botón «Empezar ahora».';

  @override
  String get scheduleExactWarning =>
      'Los avisos pueden llegar unos minutos tarde. Activa «Alarmas y recordatorios» para que lleguen a la hora exacta.';

  @override
  String get scheduleExactAction => 'Activar';

  @override
  String get scheduleStartNow => 'Empezar ahora';

  @override
  String get scheduleProblemPermissions =>
      'No se pudo empezar la sesión: faltan permisos.';

  @override
  String get scheduleProblemActive => 'Ya tienes una sesión en curso.';

  @override
  String get scheduleProblemOther =>
      'No se pudo empezar la sesión. Inténtalo desde Inicio.';

  @override
  String get scheduleReview => 'Revisar';

  @override
  String scheduleToggleSemantics(String name) {
    return 'Activar o pausar $name';
  }

  @override
  String get blockEditorNewTitle => 'Nuevo bloque';

  @override
  String get blockEditorEditTitle => 'Editar bloque';

  @override
  String get blockEditorLabel => 'Materia o tema (opcional)';

  @override
  String get blockEditorLabelHint => 'Ej.: Matemáticas';

  @override
  String get blockEditorDays => 'Días';

  @override
  String get blockEditorTime => 'Hora de inicio';

  @override
  String get blockEditorChangeTime => 'Cambiar hora';

  @override
  String get blockEditorType => 'Tipo de sesión';

  @override
  String blockEditorSummary(int focus, String start, String end) {
    return '$focus min de enfoque · de $start a $end';
  }

  @override
  String get blockEditorNoDays => 'Elige al menos un día.';

  @override
  String blockEditorOverlap(String other) {
    return 'Se cruza con «$other». Cambia la hora o los días.';
  }

  @override
  String get blockEditorDelete => 'Eliminar bloque';

  @override
  String get blockEditorDeleteTitle => '¿Eliminar este bloque?';

  @override
  String get blockEditorDeleteBody =>
      'Dejarás de recibir sus avisos. Tus sesiones pasadas no se borran.';

  @override
  String get commonDelete => 'Eliminar';

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
  String get welcomeBrand => 'ENFOQUE';

  @override
  String get welcomeSkip => 'Saltar';

  @override
  String get welcomeNext => 'Siguiente';

  @override
  String get welcome1Badge => 'Modo Zen activo';

  @override
  String get welcome1Body =>
      'Enfoque bloquea las apps que te distraen mientras estudias.';

  @override
  String get welcome2Badge => 'Pomodoro y horario';

  @override
  String get welcome2Title => 'Tu semana organizada';

  @override
  String get welcome2Body =>
      'Programa tus sesiones de estudio y te avisamos a la hora, con descansos incluidos.';

  @override
  String get welcome3Badge => 'Racha y progreso';

  @override
  String get welcome3Title => 'Cada día cuenta';

  @override
  String get welcome3Body =>
      'Mantén tu racha, mira tu progreso y aprende a resistir las distracciones. Todo queda en tu celular.';

  @override
  String homeHello(String name) {
    return 'Hola, $name';
  }

  @override
  String get homeHelloNoName => 'Hola';

  @override
  String get homeReady => 'Todo listo para hoy';

  @override
  String homeStreakRun(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días seguidos',
      one: '1 día seguido',
      zero: 'Sin racha',
    );
    return '$_temp0';
  }

  @override
  String streakChip(int count) {
    return '$count d';
  }

  @override
  String streakSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días de racha',
      one: '1 día de racha',
    );
    return '$_temp0';
  }

  @override
  String get homeNextSession => 'Próxima sesión';

  @override
  String get homeNowSession => 'Ahora, según tu horario';

  @override
  String homeWhenRange(String day, String start, String end) {
    return '$day $start a $end';
  }

  @override
  String homeBlocksPomodoro(int cycles, int focus) {
    String _temp0 = intl.Intl.pluralLogic(
      cycles,
      locale: localeName,
      other: '$cycles bloques Pomodoro de $focus min',
      one: '1 bloque Pomodoro de $focus min',
    );
    return '$_temp0';
  }

  @override
  String homeBlocksFree(int minutes) {
    return '$minutes min de enfoque libre';
  }

  @override
  String get homeNoScheduleTitle => 'Sin sesiones programadas';

  @override
  String get homeNoScheduleBody =>
      'Organiza tu semana en Horario y te avisaremos a la hora de estudiar.';

  @override
  String get homeOpenSchedule => 'Ir a Horario';

  @override
  String get homeQuickTitle => 'Sesión rápida';

  @override
  String homeQuickPomodoro(int cycles, int focus, int rest) {
    return '$cycles × $focus/$rest min · toca para ajustar';
  }

  @override
  String homeQuickFree(int minutes) {
    return 'Temporizador libre de $minutes min';
  }

  @override
  String get homeToday => 'Hoy';

  @override
  String homeGoal(String goal) {
    return 'Meta: $goal';
  }

  @override
  String get homeMetricFocused => 'concentrado';

  @override
  String get homeMetricSessions => 'sesiones';

  @override
  String get homeMetricExits => 'salidas';

  @override
  String get homeThisWeek => 'Esta semana';

  @override
  String homeWeekTotal(String total) {
    return 'Total: $total';
  }

  @override
  String homeVsLastWeek(String change) {
    return '$change % vs semana pasada';
  }

  @override
  String homeBestDay(String day, String time) {
    return 'Mejor día: $day ($time)';
  }

  @override
  String get homeDetails => 'Detalles';

  @override
  String get weekdayInitials => 'L,M,X,J,V,S,D';

  @override
  String durationHm(int hours, String minutes) {
    return '$hours h $minutes min';
  }

  @override
  String durationShortHm(int hours, int minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String durationShortM(int minutes) {
    return '${minutes}m';
  }

  @override
  String get sessionTitle => 'Sesión activa';

  @override
  String get sessionBlockingOn => 'Bloqueo activo';

  @override
  String get sessionBlockingPaused => 'Bloqueo en pausa';

  @override
  String get sessionStateFocus => 'Concentrado';

  @override
  String get sessionStateRest => 'Descanso';

  @override
  String sessionCaption(int current, int total, String phase) {
    return 'Bloque $current de $total · $phase';
  }

  @override
  String get sessionNoSubject => 'Sesión de enfoque';

  @override
  String get sessionCheer1 => 'Cada minuto cuenta. Vas muy bien.';

  @override
  String get sessionCheer2 => 'Respira y sigue a tu ritmo.';

  @override
  String get sessionCheer3 => 'Tu yo del futuro te lo va a agradecer.';

  @override
  String get statsWeek => 'Semana';

  @override
  String get statsMonth => 'Mes';

  @override
  String get statsYear => 'Año';

  @override
  String get statsFocused => 'Concentrado';

  @override
  String get statsCompleted => 'Completadas';

  @override
  String get statsActive => 'Activa';

  @override
  String get statsHours => 'Horas de estudio';

  @override
  String get statsHoursSub => 'Distribución por materia';

  @override
  String get statsConsistency => 'Consistencia mensual';

  @override
  String get statsLess => 'Menos tiempo';

  @override
  String get statsMore => 'Más de 3 h';

  @override
  String get statsBySubject => 'Por materia';

  @override
  String statsTotal(String total) {
    return 'Total: $total';
  }

  @override
  String statsSubjectsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'materias',
      one: 'materia',
    );
    return '$_temp0';
  }

  @override
  String get statsNoSubject => 'Sin materia';

  @override
  String get statsDistractionTitle => 'Filtro de distracciones';

  @override
  String get statsDistractionSub => 'Protección activa de tu enfoque';

  @override
  String statsDistractionApp(String app) {
    return '$app bloqueada';
  }

  @override
  String statsDistractionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count intentos interceptados',
      one: '1 intento interceptado',
    );
    return '$_temp0';
  }

  @override
  String get statsDistractionNone =>
      'Sin intentos de distracción en este período. ¡Excelente!';

  @override
  String statsDistractionBetter(int percent) {
    return '¡Excelente autodisciplina! Bajaste un $percent % respecto al período anterior.';
  }

  @override
  String statsDistractionWorse(int percent) {
    return 'Subiste un $percent % respecto al período anterior. Tú puedes.';
  }

  @override
  String get roomsTitle => 'Salas de estudio';

  @override
  String get roomsSoon => 'Próximamente';

  @override
  String get roomsCreate => 'Crear sala';

  @override
  String get roomsCode => 'Con código';

  @override
  String get roomsFeature1 => 'Estudia en grupo con presencia en vivo.';

  @override
  String get roomsFeature2 => 'Mira quién está concentrado o en descanso.';

  @override
  String get roomsFeature3 => 'La sala se entera si alguien sale antes.';

  @override
  String get settingsName => 'Tu nombre';

  @override
  String get settingsNameHint => 'Para saludarte en Inicio';

  @override
  String get welcomeTitle => 'Estudia sin distracciones';

  @override
  String get welcomeStart => 'Empezar';

  @override
  String get permissionsTitle => 'Permisos';

  @override
  String get permissionsIntro =>
      'Te guiamos permiso por permiso. Estos permisos no borran ni cambian nada más de tu celular, y puedes quitarlos cuando quieras.';

  @override
  String permissionsStep(int current, int total) {
    return 'Paso $current de $total';
  }

  @override
  String get permissionsHowTo => 'Qué vas a hacer';

  @override
  String get permissionsSafetyNote =>
      'Solo toca lo que se indica aquí. Si te equivocas, no pasa nada: vuelve y repite el paso.';

  @override
  String get permStepFindApp =>
      'Si ves una lista de apps, busca «Enfoque (local)» y tócala.';

  @override
  String get permStepBack =>
      'Vuelve a Enfoque con el botón Atrás. Lo detectamos solos.';

  @override
  String get permUsageStep1 =>
      'Toca «Abrir ajustes». Se abrirá «Acceso a datos de uso» (el nombre puede variar un poco según tu celular).';

  @override
  String get permUsageStep2 =>
      'Activa el interruptor «Permitir acceso al uso».';

  @override
  String get permOverlayStep1 =>
      'Toca «Abrir ajustes». Se abrirá «Mostrar sobre otras apps».';

  @override
  String get permOverlayStep2 =>
      'Activa el interruptor «Permitir mostrar sobre otras apps».';

  @override
  String get permNotifStep1 =>
      'Toca «Permitir notificaciones». Android te preguntará si Enfoque puede enviarte notificaciones.';

  @override
  String get permNotifStep2 =>
      'Elige «Permitir». Si en cambio se abren los ajustes, activa «Mostrar notificaciones».';

  @override
  String get permBatteryStep1 =>
      'Toca «Quitar restricción». Aparecerá una ventana de Android.';

  @override
  String get permBatteryStep2 =>
      'Elige «Permitir». Si se abre una lista, busca «Enfoque (local)» y elige «Sin restricciones» o «No optimizar».';

  @override
  String get permOpenSettings => 'Abrir ajustes';

  @override
  String get permAllowNotifications => 'Permitir notificaciones';

  @override
  String get permBatteryAction => 'Quitar restricción';

  @override
  String get permVerify => 'Ya lo activé, verificar';

  @override
  String get permSkip => 'Omitir por ahora';

  @override
  String get permStillOff =>
      'Todavía aparece desactivado. Revisa que el interruptor de «Enfoque (local)» esté encendido.';

  @override
  String get permNowOn => '¡Listo! Permiso activado.';

  @override
  String get permRestrictedTitle =>
      '¿El interruptor está gris o dice «Ajuste restringido»?';

  @override
  String get permRestrictedBody =>
      'Pasa en Android 13 o superior con apps instaladas desde un archivo. Es normal y se soluciona así:';

  @override
  String get permRestrictedStep1 => 'Toca «Abrir información de la app».';

  @override
  String get permRestrictedStep2 =>
      'Toca el menú ⋮ (arriba a la derecha) y elige «Permitir ajustes restringidos». Confirma con tu PIN o huella.';

  @override
  String get permRestrictedStep3 =>
      'Vuelve aquí y toca «Abrir ajustes» otra vez.';

  @override
  String get permOpenAppInfo => 'Abrir información de la app';

  @override
  String get permissionsSummary => 'Resumen';

  @override
  String get permStatusPending => 'Pendiente';

  @override
  String get permStatusSkipped => 'Omitido';

  @override
  String get permissionsAllDone => '¡Todo listo! Ya puedes continuar.';

  @override
  String get permissionsRequiredDone =>
      'Los permisos obligatorios están listos. Los recomendados hacen el bloqueo más confiable, pero puedes continuar.';

  @override
  String get permissionsRequiredMissing =>
      'Activa los dos permisos obligatorios para continuar.';

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
      'Para avisarte con sonido cuando empieza un descanso, cuando vuelves al enfoque y cuando termina la sesión.';

  @override
  String get permissionBatteryTitle => 'Sin optimización de batería';

  @override
  String get permissionBatteryBody =>
      'Para que Android no detenga el bloqueo a mitad de la sesión.';

  @override
  String get permissionExactTitle => 'Alarmas y recordatorios';

  @override
  String get permissionExactBody =>
      'Para que los avisos de tu horario de estudio lleguen a la hora exacta y no con minutos de retraso.';

  @override
  String get permExactStep1 =>
      'Toca «Abrir ajustes». Se abrirá «Alarmas y recordatorios».';

  @override
  String get permExactStep2 =>
      'Activa «Permitir configurar alarmas y recordatorios».';

  @override
  String get permissionRequired => 'Obligatorio';

  @override
  String get permissionRecommended => 'Recomendado';

  @override
  String get permissionGranted => 'Activado';

  @override
  String get permissionsContinue => 'Continuar';

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
  String homeLongBreakIncluded(int minutes) {
    return 'Incluye un descanso largo de $minutes min después del bloque 4.';
  }

  @override
  String homeLongBreakHint(int minutes) {
    return 'Con 5 bloques o más, después del 4.º hay un descanso largo de $minutes min.';
  }

  @override
  String get homeStart => 'Empezar sesión';

  @override
  String get homeAllowedApps => 'Apps permitidas';

  @override
  String get homeSettings => 'Ajustes';

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
  String get sessionPhaseFocus => 'Enfoque';

  @override
  String get sessionPhaseRest => 'Descanso';

  @override
  String get sessionPhaseLongRest => 'Descanso largo';

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
