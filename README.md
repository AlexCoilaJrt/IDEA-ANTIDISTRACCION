# Enfoque

App **solo para Android** que bloquea las distracciones del celular durante el estudio.
Esta versión es la **fase 1 (núcleo sin conexión)**: todo funciona en el celular, sin Firebase ni servicios externos.

> La guía completa del proyecto (arquitectura, reglas, fases) está en [`CLAUDE.md`](CLAUDE.md).

## Qué incluye la fase 1

| Área | Qué hay |
| --- | --- |
| Motor de bloqueo (Kotlin) | Servicio en primer plano `specialUse`, detección de la app al frente con `UsageStatsManager` cada 700 ms, pantalla de bloqueo `TYPE_APPLICATION_OVERLAY`, reinicio con `START_STICKY` + `BOOT_COMPLETED` + alarma vigilante inexacta. Sin `AccessibilityService` ni `QUERY_ALL_PACKAGES`. |
| Contrato Dart ↔ Kotlin | Pigeon (`pigeons/blocker.dart`). |
| Sesiones | Pomodoro 25/5, 50/10 y libre, con varios bloques. Modo estricto opcional (bloquea también los descansos). |
| Salida con costo | Escalón 1: espera de 60 s · Escalón 2: motivo de 150+ caracteres · Escalón 3: confirmar pérdida de racha. También desde el botón "Salir antes" de la pantalla de bloqueo. |
| Apps permitidas | Lista de apps del lanzador; sugiere calculadora, diccionario, PDF y teléfono. Llamadas y pantalla de inicio siempre funcionan. |
| Racha y estadísticas | Racha actual y mejor, minutos de hoy/semana, gráfico de 7 días, calendario de calor de 12 semanas, sesiones recientes. |
| Bienvenida | Pantalla inicial, permisos guiados y elección de apps. |
| Datos | drift (SQLite) local. La lista de apps abiertas **nunca sale del celular**. |
| Diseño | Material 3, modo oscuro primero, tokens en `lib/app/theme/`, componentes en `lib/core/ui/`, textos en español (ARB). |

Las pestañas **Horario** (fase 2) y **Salas** (fase 3) ya existen, pero por ahora solo muestran "próximamente".

## Requisitos

- Flutter estable (probado con 3.47) y un JDK 17 o superior.
- Android SDK con `platform-tools` (para `adb`).
- Un celular Android 8.0+ (API 26) con depuración USB, o un emulador.

## Ejecutar

```bash
flutter pub get
flutter run --flavor local -t lib/main_local.dart
```

APK de depuración: `flutter build apk --flavor local -t lib/main_local.dart --debug`
(queda en `build/app/outputs/flutter-apk/app-local-debug.apk`).

### Permisos en el celular

La app guía al usuario, pero estos son los permisos:

1. **Acceso a datos de uso** (obligatorio): Ajustes → Acceso a datos de uso → Enfoque (local).
2. **Mostrar sobre otras apps** (obligatorio).
3. **Notificaciones** (recomendado): aviso fijo con la cuenta regresiva.
4. **Sin optimización de batería** (recomendado): evita que Android detenga el bloqueo.

## Calidad

```bash
dart format . && flutter analyze && flutter test                 # Flutter: 88 pruebas
cd android && ./gradlew :app:testLocalDebugUnitTest -Ptarget=lib/main_local.dart   # Kotlin (JUnit)
flutter test integration_test --flavor local                   # en un celular/emulador
cd widgetbook && flutter test                                  # catálogo de componentes
```

- Goldens de componentes en claro y oscuro: `flutter test --update-goldens test/core/ui`.
- Catálogo Widgetbook: `cd widgetbook && flutter run -d chrome` (requiere `flutter create --platforms web .` dentro de `widgetbook/` la primera vez) o en un celular.

## Generar código

```bash
dart run build_runner build --delete-conflicting-outputs   # freezed, riverpod, drift
dart run pigeon --input pigeons/blocker.dart               # canal Dart ↔ Kotlin
flutter gen-l10n                                           # textos (lib/l10n/app_es.arb)
```

El código generado está versionado, así el proyecto compila apenas se clona.

## Estructura

```
lib/
  main_local.dart main_dev.dart main_prod.dart
  app/            router (guardas), DI (dependencies.dart), estado global, tema y tokens
  core/ui/        sistema de diseño (componentes sin estado)
  core/utils/     Result<T>, formatos
  data/services/  blocker/ (Pigeon), db/ (drift)
  data/repositories/  sesiones, racha, ajustes, apps permitidas, bloqueador
  domain/models/  modelos freezed
  domain/logic/   lógica pura: reloj Pomodoro, racha, salida con costo, sugerencias
  domain/use_cases/   iniciar, terminar y conciliar sesiones
  features/       onboarding, focus, allowlist, stats, settings, schedule, rooms
android/app/src/main/kotlin/com/alexcoila/enfoque/blocker/   motor de bloqueo
test/             unitarias, repositorios (SQLite en memoria), ViewModels, goldens, flujos
integration_test/ flujos completos sobre un dispositivo
widgetbook/       catálogo de componentes (paquete aparte)
```

## Próximo: fase 2 (estudiante)

Materias, horario, exámenes, importación .ics y planificador automático con notificaciones.
