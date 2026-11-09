# CLAUDE.md — Enfoque (app de estudio sin distracciones)

Guía permanente para Claude Code en este repositorio. Léela completa antes de cada tarea.

## 1. Qué es el proyecto

**Enfoque** (nombre provisional) es una app **solo para Android** que bloquea las distracciones del celular durante el estudio. Combina:

- Sesiones de enfoque con Pomodoro y bloqueo de apps no permitidas.
- Lista de apps permitidas (calculadora, diccionario, PDF, teléfono).
- **Salida con costo**: para cortar antes de tiempo hay que pasar por escalones.
- Racha diaria y estadísticas.
- Horario de clases y exámenes con un planificador automático de sesiones.
- Salas de estudio en grupo con presencia en vivo (presión social).
- Puntos, niveles, insignias y ranking.

Principios: la presión social pesa más que el bloqueo; cero configuración diaria; **primero sin conexión**; privacidad por defecto; cumplir desde el inicio las políticas de Google Play.

## 2. Restricción actual: SOLO uso local

- **No desplegar nada ni usar servicios de pago.** Nada de plan Blaze, nada de Play Store, nada de `firebase deploy`.
- El backend corre con **Firebase Local Emulator Suite** (Auth, Firestore, Realtime Database, Functions).
- La app se instala por cable (`flutter run`) o como APK de depuración.
- No hay FCM en local: los avisos de sala se simulan con notificaciones locales.
- App Check, Crashlytics y Remote Config van **apagados** en el flavor `local`.
- Si algo solo funciona desplegado, déjalo detrás de una interfaz y pregunta antes de seguir.

## 3. Stack

| Área | Tecnología |
| --- | --- |
| UI | Flutter (última estable), Dart 3, Material 3 |
| Estado y DI | riverpod + riverpod_generator (Notifier/AsyncNotifier) |
| Navegación | go_router (con guardas de permisos) |
| Base local | drift (SQLite) |
| Modelos | freezed + json_serializable |
| Canal nativo | **Pigeon** (contratos tipados Dart ↔ Kotlin) |
| Bloqueo | Módulo **Kotlin** en `android/` |
| Backend | Firebase vía FlutterFire (emuladores en local) |
| Functions | TypeScript en `functions/` |
| Notificaciones | flutter_local_notifications |
| Tareas en segundo plano | workmanager |
| Gráficos | fl_chart |
| Animaciones | flutter_animate (Rive opcional) |
| Catálogo de componentes | Widgetbook |
| Lints | very_good_analysis (o flutter_lints en modo estricto) |

No agregues dependencias fuera de esta lista sin explicar por qué en el mensaje del commit o en el PR.

## 4. Arquitectura (guía oficial de Flutter, MVVM)

Referencia: https://docs.flutter.dev/app-architecture/guide

- **Vista (widget):** solo dibuja y pasa eventos. Sin lógica de negocio.
- **ViewModel (Notifier de Riverpod):** convierte datos en estado de pantalla y expone comandos (`startSession()`, `requestEarlyExit()`). Uno por pantalla.
- **Caso de uso (opcional):** solo si la lógica cruza varios repositorios (`PlanWeekUseCase`, `FinishSessionUseCase`).
- **Repositorio:** fuente de verdad de un tipo de dato. Cachea, reintenta y devuelve modelos de dominio. **Un repositorio nunca depende de otro.**
- **Servicio:** envuelve una sola fuente (drift, Firestore, RTDB, el canal del bloqueador). Sin estado.

Dependencias siempre hacia abajo: Vista → ViewModel → (Caso de uso) → Repositorio → Servicio.

Reglas:

- Los repositorios devuelven `Result<T>` (éxito o error), sin lanzar excepciones hacia la UI.
- Toda pantalla maneja los estados de carga, vacío y error.
- drift es la fuente de verdad local; lo social se sincroniza con Firestore.
- Los repositorios se definen como clases abstractas, con una implementación real y otra falsa para las pruebas.

### Estructura de carpetas

```
lib/
  main_local.dart  main_dev.dart  main_prod.dart   # un main por flavor
  app/
    router.dart
    theme/            # tokens, ThemeData claro/oscuro, ThemeExtension
  core/
    ui/               # sistema de diseño (componentes reutilizables)
    utils/result.dart
  data/
    services/         # blocker/ (Pigeon), firestore/, rtdb/, db/ (drift)
    repositories/
    models/           # DTO y tablas drift
  domain/
    models/           # Session, Subject, ClassBlock, Exam, Room, Streak...
    use_cases/
  features/
    onboarding/ focus/ allowlist/ schedule/ planner/
    rooms/ rewards/ stats/ profile/ settings/
      <feature>/view/  <feature>/view_model/
pigeons/              # definiciones Pigeon
android/app/src/main/kotlin/<paquete>/blocker/
functions/            # Cloud Functions (TypeScript), solo para emuladores
test/  integration_test/
firebase.json  firestore.rules  database.rules.json
```

Flavors: `local` (emuladores, el único que se usa por ahora), `dev` y `prod` (preparados, sin usar).

## 5. Motor de bloqueo nativo (Kotlin)

Flujo:

1. Flutter llama a `startSession(endsAtMillis, allowedPackages, strictness)` (API Pigeon `BlockerHostApi`).
2. Arranca `FocusService`, un servicio en primer plano de tipo `specialUse`, con su notificación fija.
3. Cada 500 a 800 ms consulta `UsageStatsManager.queryEvents()` para saber qué app pasó a primer plano.
4. Si no está permitida, muestra la pantalla de bloqueo encima (`TYPE_APPLICATION_OVERLAY` o `BlockActivity`), con el tiempo restante, accesos a las apps permitidas y el botón "Salir antes".
5. Eventos hacia Flutter (`BlockerFlutterApi` o un EventChannel): `DistractionAttempt`, `EarlyExit`, `SessionInterrupted`, `SessionFinished`.
6. El estado se guarda en almacenamiento nativo. Usar `START_STICKY`, `AlarmManager` de respaldo y `BOOT_COMPLETED` para retomar.

Permisos: `PACKAGE_USAGE_STATS`, `SYSTEM_ALERT_WINDOW`, `FOREGROUND_SERVICE` + `FOREGROUND_SERVICE_SPECIAL_USE`, `POST_NOTIFICATIONS`, `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` y `RECEIVE_BOOT_COMPLETED`. Para listar apps, usa `<queries>` con el intent del lanzador, **no** `QUERY_ALL_PACKAGES`.

Prohibido:

- **No usar AccessibilityService** en la v1.
- No usar Device Admin para impedir la desinstalación.
- La lista de apps abiertas **nunca sale del celular**. A Firebase solo llega "salió de la sesión" y cuánto tiempo.

## 6. Datos

### drift (local)

Tablas: `subjects`, `class_blocks`, `exams`, `sessions` (startedAt, endedAt, plannedMin, focusedMin, subjectId, earlyExit, exitLevel 0-3, distractionCount, roomId?), `distraction_events`, `allowed_apps`, `streak_days`, `settings`.

### Firestore (emulador)

```
users/{uid}                       displayName, photoUrl, timezone, stats{...}, privacy{...}
users/{uid}/sessions/{id}         resumen al terminar
users/{uid}/subjects|classes|exams/{id}
friendships/{uidA_uidB}           members[], status
rooms/{roomId}                    name, code, ownerId, members[], schedule{}, state
rooms/{roomId}/events/{id}        exit | join | reaction
leaderboards/{weekId}_{scope}     entries[] (solo lo escribe una Function)
```

### Realtime Database (emulador): presencia

```
roomPresence/{roomId}/{uid}: { state: focus|break|away|offline, since }
```

Usa `onDisconnect().set(offline)`.

### Reglas de seguridad

- Cada usuario solo escribe su propio `users/{uid}`.
- `stats`, `points` y `leaderboards` **solo los escribe el servidor** (Functions).
- Una sala la leen solo sus miembros, y solo el dueño cambia `schedule` y `state`.
- Las reglas se prueban con el emulador (`@firebase/rules-unit-testing`).

## 7. Reglas de negocio

- Pomodoro por defecto de 25/5, con opciones 50/10 y libre.
- **Salida con costo:**
  - Escalón 1: espera de 60 s con cuenta regresiva.
  - Escalón 2: escribir un motivo de 150 caracteres o más.
  - Escalón 3: confirmar que se pierde la racha. Si hay sala, se avisa a la sala.
- Un día cuenta para la racha con al menos 25 min (configurable) y sin salidas anticipadas.
- Una salida anticipada anula los puntos de esa sesión.
- Puntos: 1 por minuto concentrado. En modo social, se calculan en la Function `onSessionFinished`, nunca en el cliente.
- Planificador: busca huecos libres entre clases, prioriza los exámenes más cercanos y difíciles, reparte bloques Pomodoro y se reajusta si se salta una sesión. Es lógica Dart pura y probada.
- Privacidad: por defecto la sala ve solo "salió" y la duración (ajuste `showExitsToRoom`).

## 8. Sistema de diseño

- Material 3, **modo oscuro primero**, `ColorScheme.fromSeed(seedColor: Color(0xFF5B5BD6))`, con opción de color dinámico.
- Colores semánticos en una `ThemeExtension`: `focus` (verde), `onBreak` (ámbar), `away` (coral), `streak` (naranja).
- Tipografía: Plus Jakarta Sans o Inter; números tabulares grandes para el temporizador.
- Espaciado en escala de 4 (4, 8, 12, 16, 24, 32, 48). Radios: 8, 16, 28 y círculo.
- Movimiento: 150, 250 y 400 ms; respetar "reducir animaciones".
- **Ninguna pantalla define colores, tamaños o estilos sueltos**: todo sale de los tokens.

Componentes en `lib/core/ui/` (sin estado, sin Riverpod ni Firebase; reciben datos y callbacks):

`FocusButton`, `FocusTimerRing`, `SessionCard`, `SubjectChip`, `AppToggleTile`, `StreakBadge`, `MemberAvatar`, `RoomMemberGrid`, `StatTile`, `HeatmapCalendar`, `LeaderboardRow`, `ExitCostSheet`, `PermissionStepCard`, `EmptyState`, `ErrorState`, `FocusScaffold`.

Cada componente tiene una historia en Widgetbook y una prueba golden en claro y oscuro.

Navegación: `NavigationBar` con 4 pestañas (Inicio, Horario, Salas, Progreso). La sesión activa se abre como pantalla completa.

Accesibilidad: contraste AA, objetivos táctiles de 48 dp, `Semantics` y texto grande.

Idioma: **español** primero, con ARB y `flutter_localizations`. Nada de textos fijos en los widgets.

## 9. Plan por fases (seguir en orden)

1. **F1, núcleo sin conexión:** base del proyecto, tema y componentes, bienvenida y permisos, motor de bloqueo + Pigeon, apps permitidas, Pomodoro, salida con costo, racha y estadísticas locales.
2. **F2, estudiante:** materias, horario, exámenes, importación .ics y planificador automático con notificaciones.
3. **F3, social (emuladores):** Auth, amigos, salas en vivo con presencia, avisos de salida y sincronización de sesiones.
4. **F4, motivación:** puntos en Functions, niveles, insignias, rankings y retos.

**No empieces una fase sin terminar la anterior.** Divide cada fase en tareas pequeñas y verificables.

## 10. Calidad y forma de trabajo

- Antes de dar por terminada una tarea: `dart format .`, `flutter analyze` sin advertencias y `flutter test` en verde.
- Pruebas unitarias para ViewModels, casos de uso, planificador y racha. Escribe primero las pruebas del planificador y de la racha.
- Pruebas de widgets o golden para los componentes, e `integration_test` para el flujo de sesión.
- Kotlin: pruebas con JUnit y Robolectric para la detección de app en primer plano y el reinicio del servicio.
- Functions y reglas: pruebas con el Emulator Suite.
- Código generado (`build_runner`, Pigeon): regenerar con `dart run build_runner build --delete-conflicting-outputs` y `dart run pigeon --input pigeons/blocker.dart`.
- Commits pequeños y en español, con el formato `feat(focus): ...`, `fix(blocker): ...`, `test(planner): ...`.
- No inventes APIs: si no estás seguro de una API de Android o de un paquete, revisa la documentación oficial.
- Cuando una decisión cambie la arquitectura de este documento, pregunta primero y luego actualiza este archivo.

## 11. Comandos útiles

```bash
# Emuladores de Firebase (con datos persistentes)
firebase emulators:start --import=./emulator-data --export-on-exit

# App contra emuladores en un celular por USB
adb reverse tcp:8080 tcp:8080 && adb reverse tcp:9099 tcp:9099 && adb reverse tcp:9000 tcp:9000 && adb reverse tcp:5001 tcp:5001
flutter run --flavor local -t lib/main_local.dart

# Generar código
dart run build_runner watch --delete-conflicting-outputs
dart run pigeon --input pigeons/blocker.dart

# Calidad
dart format . && flutter analyze && flutter test
```

Puertos de los emuladores: Auth 9099, Firestore 8080, Realtime Database 9000, Functions 5001 y UI 4000.
