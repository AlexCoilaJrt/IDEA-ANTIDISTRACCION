import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('es')];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'Enfoque'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get navHome;

  /// No description provided for @navSchedule.
  ///
  /// In es, this message translates to:
  /// **'Horario'**
  String get navSchedule;

  /// No description provided for @navRooms.
  ///
  /// In es, this message translates to:
  /// **'Salas'**
  String get navRooms;

  /// No description provided for @navProgress.
  ///
  /// In es, this message translates to:
  /// **'Progreso'**
  String get navProgress;

  /// No description provided for @commonRetry.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get commonRetry;

  /// No description provided for @commonContinue.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get commonContinue;

  /// No description provided for @commonCancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get commonSave;

  /// No description provided for @commonLoading.
  ///
  /// In es, this message translates to:
  /// **'Cargando…'**
  String get commonLoading;

  /// No description provided for @commonGenericError.
  ///
  /// In es, this message translates to:
  /// **'Algo salió mal. Inténtalo de nuevo.'**
  String get commonGenericError;

  /// No description provided for @commonMinutesShort.
  ///
  /// In es, this message translates to:
  /// **'{minutes} min'**
  String commonMinutesShort(int minutes);

  /// No description provided for @welcomeTitle.
  ///
  /// In es, this message translates to:
  /// **'Estudia sin distracciones'**
  String get welcomeTitle;

  /// No description provided for @welcomeBody.
  ///
  /// In es, this message translates to:
  /// **'Enfoque bloquea las apps que te distraen mientras estudias. Tú eliges qué apps quedan permitidas.'**
  String get welcomeBody;

  /// No description provided for @welcomePointBlock.
  ///
  /// In es, this message translates to:
  /// **'Bloqueo de apps durante tus sesiones Pomodoro'**
  String get welcomePointBlock;

  /// No description provided for @welcomePointExit.
  ///
  /// In es, this message translates to:
  /// **'Salir antes tiene un costo: piénsalo dos veces'**
  String get welcomePointExit;

  /// No description provided for @welcomePointStreak.
  ///
  /// In es, this message translates to:
  /// **'Racha diaria y estadísticas, todo guardado en tu celular'**
  String get welcomePointStreak;

  /// No description provided for @welcomeStart.
  ///
  /// In es, this message translates to:
  /// **'Empezar'**
  String get welcomeStart;

  /// No description provided for @permissionsTitle.
  ///
  /// In es, this message translates to:
  /// **'Permisos'**
  String get permissionsTitle;

  /// No description provided for @permissionsIntro.
  ///
  /// In es, this message translates to:
  /// **'Te guiamos permiso por permiso. Estos permisos no borran ni cambian nada más de tu celular, y puedes quitarlos cuando quieras.'**
  String get permissionsIntro;

  /// No description provided for @permissionsStep.
  ///
  /// In es, this message translates to:
  /// **'Paso {current} de {total}'**
  String permissionsStep(int current, int total);

  /// No description provided for @permissionsHowTo.
  ///
  /// In es, this message translates to:
  /// **'Qué vas a hacer'**
  String get permissionsHowTo;

  /// No description provided for @permissionsSafetyNote.
  ///
  /// In es, this message translates to:
  /// **'Solo toca lo que se indica aquí. Si te equivocas, no pasa nada: vuelve y repite el paso.'**
  String get permissionsSafetyNote;

  /// No description provided for @permStepFindApp.
  ///
  /// In es, this message translates to:
  /// **'Si ves una lista de apps, busca «Enfoque (local)» y tócala.'**
  String get permStepFindApp;

  /// No description provided for @permStepBack.
  ///
  /// In es, this message translates to:
  /// **'Vuelve a Enfoque con el botón Atrás. Lo detectamos solos.'**
  String get permStepBack;

  /// No description provided for @permUsageStep1.
  ///
  /// In es, this message translates to:
  /// **'Toca «Abrir ajustes». Se abrirá «Acceso a datos de uso» (el nombre puede variar un poco según tu celular).'**
  String get permUsageStep1;

  /// No description provided for @permUsageStep2.
  ///
  /// In es, this message translates to:
  /// **'Activa el interruptor «Permitir acceso al uso».'**
  String get permUsageStep2;

  /// No description provided for @permOverlayStep1.
  ///
  /// In es, this message translates to:
  /// **'Toca «Abrir ajustes». Se abrirá «Mostrar sobre otras apps».'**
  String get permOverlayStep1;

  /// No description provided for @permOverlayStep2.
  ///
  /// In es, this message translates to:
  /// **'Activa el interruptor «Permitir mostrar sobre otras apps».'**
  String get permOverlayStep2;

  /// No description provided for @permNotifStep1.
  ///
  /// In es, this message translates to:
  /// **'Toca «Permitir notificaciones». Android te preguntará si Enfoque puede enviarte notificaciones.'**
  String get permNotifStep1;

  /// No description provided for @permNotifStep2.
  ///
  /// In es, this message translates to:
  /// **'Elige «Permitir». Si en cambio se abren los ajustes, activa «Mostrar notificaciones».'**
  String get permNotifStep2;

  /// No description provided for @permBatteryStep1.
  ///
  /// In es, this message translates to:
  /// **'Toca «Quitar restricción». Aparecerá una ventana de Android.'**
  String get permBatteryStep1;

  /// No description provided for @permBatteryStep2.
  ///
  /// In es, this message translates to:
  /// **'Elige «Permitir». Si se abre una lista, busca «Enfoque (local)» y elige «Sin restricciones» o «No optimizar».'**
  String get permBatteryStep2;

  /// No description provided for @permOpenSettings.
  ///
  /// In es, this message translates to:
  /// **'Abrir ajustes'**
  String get permOpenSettings;

  /// No description provided for @permAllowNotifications.
  ///
  /// In es, this message translates to:
  /// **'Permitir notificaciones'**
  String get permAllowNotifications;

  /// No description provided for @permBatteryAction.
  ///
  /// In es, this message translates to:
  /// **'Quitar restricción'**
  String get permBatteryAction;

  /// No description provided for @permVerify.
  ///
  /// In es, this message translates to:
  /// **'Ya lo activé, verificar'**
  String get permVerify;

  /// No description provided for @permSkip.
  ///
  /// In es, this message translates to:
  /// **'Omitir por ahora'**
  String get permSkip;

  /// No description provided for @permStillOff.
  ///
  /// In es, this message translates to:
  /// **'Todavía aparece desactivado. Revisa que el interruptor de «Enfoque (local)» esté encendido.'**
  String get permStillOff;

  /// No description provided for @permNowOn.
  ///
  /// In es, this message translates to:
  /// **'¡Listo! Permiso activado.'**
  String get permNowOn;

  /// No description provided for @permRestrictedTitle.
  ///
  /// In es, this message translates to:
  /// **'¿El interruptor está gris o dice «Ajuste restringido»?'**
  String get permRestrictedTitle;

  /// No description provided for @permRestrictedBody.
  ///
  /// In es, this message translates to:
  /// **'Pasa en Android 13 o superior con apps instaladas desde un archivo. Es normal y se soluciona así:'**
  String get permRestrictedBody;

  /// No description provided for @permRestrictedStep1.
  ///
  /// In es, this message translates to:
  /// **'Toca «Abrir información de la app».'**
  String get permRestrictedStep1;

  /// No description provided for @permRestrictedStep2.
  ///
  /// In es, this message translates to:
  /// **'Toca el menú ⋮ (arriba a la derecha) y elige «Permitir ajustes restringidos». Confirma con tu PIN o huella.'**
  String get permRestrictedStep2;

  /// No description provided for @permRestrictedStep3.
  ///
  /// In es, this message translates to:
  /// **'Vuelve aquí y toca «Abrir ajustes» otra vez.'**
  String get permRestrictedStep3;

  /// No description provided for @permOpenAppInfo.
  ///
  /// In es, this message translates to:
  /// **'Abrir información de la app'**
  String get permOpenAppInfo;

  /// No description provided for @permissionsSummary.
  ///
  /// In es, this message translates to:
  /// **'Resumen'**
  String get permissionsSummary;

  /// No description provided for @permStatusPending.
  ///
  /// In es, this message translates to:
  /// **'Pendiente'**
  String get permStatusPending;

  /// No description provided for @permStatusSkipped.
  ///
  /// In es, this message translates to:
  /// **'Omitido'**
  String get permStatusSkipped;

  /// No description provided for @permissionsAllDone.
  ///
  /// In es, this message translates to:
  /// **'¡Todo listo! Ya puedes continuar.'**
  String get permissionsAllDone;

  /// No description provided for @permissionsRequiredDone.
  ///
  /// In es, this message translates to:
  /// **'Los permisos obligatorios están listos. Los recomendados hacen el bloqueo más confiable, pero puedes continuar.'**
  String get permissionsRequiredDone;

  /// No description provided for @permissionsRequiredMissing.
  ///
  /// In es, this message translates to:
  /// **'Activa los dos permisos obligatorios para continuar.'**
  String get permissionsRequiredMissing;

  /// No description provided for @permissionUsageTitle.
  ///
  /// In es, this message translates to:
  /// **'Acceso a datos de uso'**
  String get permissionUsageTitle;

  /// No description provided for @permissionUsageBody.
  ///
  /// In es, this message translates to:
  /// **'Para saber qué app está abierta durante una sesión.'**
  String get permissionUsageBody;

  /// No description provided for @permissionOverlayTitle.
  ///
  /// In es, this message translates to:
  /// **'Mostrar sobre otras apps'**
  String get permissionOverlayTitle;

  /// No description provided for @permissionOverlayBody.
  ///
  /// In es, this message translates to:
  /// **'Para mostrar la pantalla de bloqueo encima de una app no permitida.'**
  String get permissionOverlayBody;

  /// No description provided for @permissionNotificationsTitle.
  ///
  /// In es, this message translates to:
  /// **'Notificaciones'**
  String get permissionNotificationsTitle;

  /// No description provided for @permissionNotificationsBody.
  ///
  /// In es, this message translates to:
  /// **'Para mostrar el aviso fijo con el tiempo restante.'**
  String get permissionNotificationsBody;

  /// No description provided for @permissionBatteryTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin optimización de batería'**
  String get permissionBatteryTitle;

  /// No description provided for @permissionBatteryBody.
  ///
  /// In es, this message translates to:
  /// **'Para que Android no detenga el bloqueo a mitad de la sesión.'**
  String get permissionBatteryBody;

  /// No description provided for @permissionRequired.
  ///
  /// In es, this message translates to:
  /// **'Obligatorio'**
  String get permissionRequired;

  /// No description provided for @permissionRecommended.
  ///
  /// In es, this message translates to:
  /// **'Recomendado'**
  String get permissionRecommended;

  /// No description provided for @permissionGranted.
  ///
  /// In es, this message translates to:
  /// **'Activado'**
  String get permissionGranted;

  /// No description provided for @permissionsContinue.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get permissionsContinue;

  /// No description provided for @allowlistTitle.
  ///
  /// In es, this message translates to:
  /// **'Apps permitidas'**
  String get allowlistTitle;

  /// No description provided for @allowlistBody.
  ///
  /// In es, this message translates to:
  /// **'Estas apps se pueden abrir durante una sesión. Las llamadas y la pantalla de inicio siempre funcionan.'**
  String get allowlistBody;

  /// No description provided for @allowlistSearch.
  ///
  /// In es, this message translates to:
  /// **'Buscar apps'**
  String get allowlistSearch;

  /// No description provided for @allowlistEmpty.
  ///
  /// In es, this message translates to:
  /// **'No se encontraron apps.'**
  String get allowlistEmpty;

  /// No description provided for @allowlistCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =0{Ninguna app permitida} =1{1 app permitida} other{{count} apps permitidas}}'**
  String allowlistCount(int count);

  /// No description provided for @allowlistDone.
  ///
  /// In es, this message translates to:
  /// **'Listo'**
  String get allowlistDone;

  /// No description provided for @homeGreeting.
  ///
  /// In es, this message translates to:
  /// **'¿Listo para concentrarte?'**
  String get homeGreeting;

  /// No description provided for @homeTodayProgress.
  ///
  /// In es, this message translates to:
  /// **'Hoy: {done} de {goal} min'**
  String homeTodayProgress(int done, int goal);

  /// No description provided for @homeGoalReached.
  ///
  /// In es, this message translates to:
  /// **'¡Meta de hoy cumplida!'**
  String get homeGoalReached;

  /// No description provided for @homePresetLabel.
  ///
  /// In es, this message translates to:
  /// **'Tipo de sesión'**
  String get homePresetLabel;

  /// No description provided for @homePresetClassic.
  ///
  /// In es, this message translates to:
  /// **'25 / 5'**
  String get homePresetClassic;

  /// No description provided for @homePresetLong.
  ///
  /// In es, this message translates to:
  /// **'50 / 10'**
  String get homePresetLong;

  /// No description provided for @homePresetFree.
  ///
  /// In es, this message translates to:
  /// **'Libre'**
  String get homePresetFree;

  /// No description provided for @homeCyclesLabel.
  ///
  /// In es, this message translates to:
  /// **'Bloques: {cycles}'**
  String homeCyclesLabel(int cycles);

  /// No description provided for @homeFreeMinutesLabel.
  ///
  /// In es, this message translates to:
  /// **'Duración: {minutes} min'**
  String homeFreeMinutesLabel(int minutes);

  /// No description provided for @homeSessionSummary.
  ///
  /// In es, this message translates to:
  /// **'{focus} min de enfoque · termina a las {time}'**
  String homeSessionSummary(int focus, String time);

  /// No description provided for @homeStart.
  ///
  /// In es, this message translates to:
  /// **'Empezar sesión'**
  String get homeStart;

  /// No description provided for @homeAllowedApps.
  ///
  /// In es, this message translates to:
  /// **'Apps permitidas'**
  String get homeAllowedApps;

  /// No description provided for @homeSettings.
  ///
  /// In es, this message translates to:
  /// **'Ajustes'**
  String get homeSettings;

  /// No description provided for @homeNeedsPermissions.
  ///
  /// In es, this message translates to:
  /// **'Faltan permisos para bloquear apps.'**
  String get homeNeedsPermissions;

  /// No description provided for @homeReviewPermissions.
  ///
  /// In es, this message translates to:
  /// **'Revisar'**
  String get homeReviewPermissions;

  /// No description provided for @streakDays.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =0{Sin racha} =1{1 día} other{{count} días}}'**
  String streakDays(int count);

  /// No description provided for @streakLabel.
  ///
  /// In es, this message translates to:
  /// **'Racha'**
  String get streakLabel;

  /// No description provided for @sessionPhaseFocus.
  ///
  /// In es, this message translates to:
  /// **'Enfoque'**
  String get sessionPhaseFocus;

  /// No description provided for @sessionPhaseRest.
  ///
  /// In es, this message translates to:
  /// **'Descanso'**
  String get sessionPhaseRest;

  /// No description provided for @sessionPhaseDone.
  ///
  /// In es, this message translates to:
  /// **'Terminado'**
  String get sessionPhaseDone;

  /// No description provided for @sessionCycle.
  ///
  /// In es, this message translates to:
  /// **'Bloque {current} de {total}'**
  String sessionCycle(int current, int total);

  /// No description provided for @sessionRemainingTotal.
  ///
  /// In es, this message translates to:
  /// **'Quedan {time} en total'**
  String sessionRemainingTotal(String time);

  /// No description provided for @sessionDistractions.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =0{Sin intentos de distracción} =1{1 intento de distracción} other{{count} intentos de distracción}}'**
  String sessionDistractions(int count);

  /// No description provided for @sessionAllowedApps.
  ///
  /// In es, this message translates to:
  /// **'Apps permitidas'**
  String get sessionAllowedApps;

  /// No description provided for @sessionExitEarly.
  ///
  /// In es, this message translates to:
  /// **'Salir antes'**
  String get sessionExitEarly;

  /// No description provided for @sessionTimerSemantics.
  ///
  /// In es, this message translates to:
  /// **'{phase}, quedan {time}'**
  String sessionTimerSemantics(String phase, String time);

  /// No description provided for @exitTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Seguro que quieres salir?'**
  String get exitTitle;

  /// No description provided for @exitStep.
  ///
  /// In es, this message translates to:
  /// **'Paso {step} de 3'**
  String exitStep(int step);

  /// No description provided for @exitStep1Body.
  ///
  /// In es, this message translates to:
  /// **'Respira. Espera un minuto antes de decidir.'**
  String get exitStep1Body;

  /// No description provided for @exitStep1Countdown.
  ///
  /// In es, this message translates to:
  /// **'Puedes continuar en {seconds} s'**
  String exitStep1Countdown(int seconds);

  /// No description provided for @exitStep2Body.
  ///
  /// In es, this message translates to:
  /// **'Escribe por qué quieres salir (mínimo {min} caracteres).'**
  String exitStep2Body(int min);

  /// No description provided for @exitStep2Hint.
  ///
  /// In es, this message translates to:
  /// **'Quiero salir porque…'**
  String get exitStep2Hint;

  /// No description provided for @exitStep2Counter.
  ///
  /// In es, this message translates to:
  /// **'{current} / {min}'**
  String exitStep2Counter(int current, int min);

  /// No description provided for @exitStep3Body.
  ///
  /// In es, this message translates to:
  /// **'Si sales ahora, pierdes la racha de hoy y los puntos de esta sesión.'**
  String get exitStep3Body;

  /// No description provided for @exitConfirm.
  ///
  /// In es, this message translates to:
  /// **'Salir y perder la racha'**
  String get exitConfirm;

  /// No description provided for @exitKeepStudying.
  ///
  /// In es, this message translates to:
  /// **'Seguir estudiando'**
  String get exitKeepStudying;

  /// No description provided for @summaryCompletedTitle.
  ///
  /// In es, this message translates to:
  /// **'¡Sesión completada!'**
  String get summaryCompletedTitle;

  /// No description provided for @summaryEarlyExitTitle.
  ///
  /// In es, this message translates to:
  /// **'Saliste antes'**
  String get summaryEarlyExitTitle;

  /// No description provided for @summaryInterruptedTitle.
  ///
  /// In es, this message translates to:
  /// **'Sesión interrumpida'**
  String get summaryInterruptedTitle;

  /// No description provided for @summaryFocused.
  ///
  /// In es, this message translates to:
  /// **'Minutos concentrado'**
  String get summaryFocused;

  /// No description provided for @summaryPoints.
  ///
  /// In es, this message translates to:
  /// **'Puntos'**
  String get summaryPoints;

  /// No description provided for @summaryDistractions.
  ///
  /// In es, this message translates to:
  /// **'Intentos de distracción'**
  String get summaryDistractions;

  /// No description provided for @summaryBackHome.
  ///
  /// In es, this message translates to:
  /// **'Volver al inicio'**
  String get summaryBackHome;

  /// No description provided for @progressTitle.
  ///
  /// In es, this message translates to:
  /// **'Progreso'**
  String get progressTitle;

  /// No description provided for @statCurrentStreak.
  ///
  /// In es, this message translates to:
  /// **'Racha actual'**
  String get statCurrentStreak;

  /// No description provided for @statBestStreak.
  ///
  /// In es, this message translates to:
  /// **'Mejor racha'**
  String get statBestStreak;

  /// No description provided for @statToday.
  ///
  /// In es, this message translates to:
  /// **'Hoy'**
  String get statToday;

  /// No description provided for @statWeek.
  ///
  /// In es, this message translates to:
  /// **'Esta semana'**
  String get statWeek;

  /// No description provided for @statSessions.
  ///
  /// In es, this message translates to:
  /// **'Sesiones completas'**
  String get statSessions;

  /// No description provided for @statDistractions.
  ///
  /// In es, this message translates to:
  /// **'Distracciones (7 días)'**
  String get statDistractions;

  /// No description provided for @statWeekChart.
  ///
  /// In es, this message translates to:
  /// **'Minutos de los últimos 7 días'**
  String get statWeekChart;

  /// No description provided for @statHeatmap.
  ///
  /// In es, this message translates to:
  /// **'Últimas 12 semanas'**
  String get statHeatmap;

  /// No description provided for @statRecentSessions.
  ///
  /// In es, this message translates to:
  /// **'Sesiones recientes'**
  String get statRecentSessions;

  /// No description provided for @statEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'Aún no hay sesiones'**
  String get statEmptyTitle;

  /// No description provided for @statEmptyBody.
  ///
  /// In es, this message translates to:
  /// **'Cuando termines tu primera sesión, aquí verás tu progreso.'**
  String get statEmptyBody;

  /// No description provided for @sessionCardCompleted.
  ///
  /// In es, this message translates to:
  /// **'Completada'**
  String get sessionCardCompleted;

  /// No description provided for @sessionCardEarlyExit.
  ///
  /// In es, this message translates to:
  /// **'Salida anticipada'**
  String get sessionCardEarlyExit;

  /// No description provided for @sessionCardInterrupted.
  ///
  /// In es, this message translates to:
  /// **'Interrumpida'**
  String get sessionCardInterrupted;

  /// No description provided for @sessionCardActive.
  ///
  /// In es, this message translates to:
  /// **'En curso'**
  String get sessionCardActive;

  /// No description provided for @scheduleComingTitle.
  ///
  /// In es, this message translates to:
  /// **'Horario y exámenes'**
  String get scheduleComingTitle;

  /// No description provided for @scheduleComingBody.
  ///
  /// In es, this message translates to:
  /// **'Llega en la fase 2: materias, horario, exámenes y planificador automático.'**
  String get scheduleComingBody;

  /// No description provided for @roomsComingTitle.
  ///
  /// In es, this message translates to:
  /// **'Salas de estudio'**
  String get roomsComingTitle;

  /// No description provided for @roomsComingBody.
  ///
  /// In es, this message translates to:
  /// **'Llega en la fase 3: estudia en grupo con presencia en vivo.'**
  String get roomsComingBody;

  /// No description provided for @settingsTitle.
  ///
  /// In es, this message translates to:
  /// **'Ajustes'**
  String get settingsTitle;

  /// No description provided for @settingsDailyGoal.
  ///
  /// In es, this message translates to:
  /// **'Meta diaria'**
  String get settingsDailyGoal;

  /// No description provided for @settingsDailyGoalValue.
  ///
  /// In es, this message translates to:
  /// **'{minutes} minutos'**
  String settingsDailyGoalValue(int minutes);

  /// No description provided for @settingsStrictness.
  ///
  /// In es, this message translates to:
  /// **'Modo estricto'**
  String get settingsStrictness;

  /// No description provided for @settingsStrictnessBody.
  ///
  /// In es, this message translates to:
  /// **'Bloquea también durante los descansos.'**
  String get settingsStrictnessBody;

  /// No description provided for @settingsTheme.
  ///
  /// In es, this message translates to:
  /// **'Tema'**
  String get settingsTheme;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In es, this message translates to:
  /// **'Sistema'**
  String get settingsThemeSystem;

  /// No description provided for @settingsThemeLight.
  ///
  /// In es, this message translates to:
  /// **'Claro'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In es, this message translates to:
  /// **'Oscuro'**
  String get settingsThemeDark;

  /// No description provided for @settingsPermissions.
  ///
  /// In es, this message translates to:
  /// **'Permisos'**
  String get settingsPermissions;

  /// No description provided for @settingsAllowedApps.
  ///
  /// In es, this message translates to:
  /// **'Apps permitidas'**
  String get settingsAllowedApps;

  /// No description provided for @settingsPrivacy.
  ///
  /// In es, this message translates to:
  /// **'La lista de apps que abres nunca sale de tu celular.'**
  String get settingsPrivacy;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
