import 'package:enfoque/app/app.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

/// Flujos completos de la app con dependencias falsas. Se usan como pruebas
/// de widgets (`flutter test`) y en `integration_test/` sobre un celular.

Future<void> _pumpApp(WidgetTester tester, TestDeps deps) async {
  tester.view
    ..physicalSize = const Size(1080, 2340)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(overrides: deps.overrides, child: const EnfoqueApp()),
  );
  await _settle(tester);
}

/// Como `pumpAndSettle`, pero no se queda esperando al reloj de la sesión.
Future<void> _settle(WidgetTester tester, [int frames = 20]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

Future<void> _tap(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pump();
  await tester.tap(finder);
  await _settle(tester);
}

/// Pasa los 3 pasos de la bienvenida.
Future<void> _passWelcome(WidgetTester tester) async {
  expect(find.text('Estudia sin distracciones'), findsOneWidget);
  await _tap(tester, find.text('Siguiente'));
  expect(find.text('Tu semana organizada'), findsOneWidget);
  await _tap(tester, find.text('Siguiente'));
  expect(find.text('Cada día cuenta'), findsOneWidget);
  await _tap(tester, find.text('Empezar'));
}

/// Abre la hoja de sesión rápida y empieza.
Future<void> _startQuick(WidgetTester tester) async {
  await _tap(tester, find.text('Sesión rápida'));
  await _tap(tester, find.text('Empezar sesión'));
}

Future<void> onboardingFlow(WidgetTester tester) async {
  final deps = TestDeps(settings: const AppSettings());
  await _pumpApp(tester, deps);

  await _passWelcome(tester);

  expect(find.text('Acceso a datos de uso'), findsOneWidget);
  expect(find.text('Activado'), findsNWidgets(5));
  await _tap(tester, find.text('Continuar'));

  expect(find.text('Apps permitidas'), findsOneWidget);
  // Calculadora y PDF quedan sugeridas.
  expect(find.text('2 apps permitidas'), findsOneWidget);
  await _tap(tester, find.text('Listo'));

  expect(find.text('Hola'), findsOneWidget);
  expect(deps.settings.settings.onboardingDone, isTrue);
}

/// Asistente de permisos: empieza sin ninguno, detecta cada permiso al
/// activarlo y permite omitir los recomendados.
Future<void> permissionsWizardFlow(WidgetTester tester) async {
  final deps = TestDeps(settings: const AppSettings());
  deps.blocker.perms = AppPermissions.none;
  await _pumpApp(tester, deps);
  await _passWelcome(tester);

  expect(find.text('Paso 1 de 5'), findsOneWidget);
  expect(
    find.text('Activa los dos permisos obligatorios para continuar.'),
    findsOneWidget,
  );
  await _tap(tester, find.text('Abrir ajustes'));
  expect(deps.blocker.requested, [PermissionKind.usageAccess]);

  // "Verificar" sin haberlo activado avisa que sigue desactivado.
  await _tap(tester, find.text('Ya lo activé, verificar'));
  expect(find.textContaining('Todavía aparece desactivado'), findsOneWidget);

  // El usuario lo activa en Android: se detecta solo y avanza.
  deps.blocker.perms = deps.blocker.perms.copyWith(usageAccess: true);
  await tester.pump(const Duration(seconds: 2));
  await _settle(tester);
  expect(find.text('Paso 2 de 5'), findsOneWidget);
  expect(find.text('Mostrar sobre otras apps'), findsWidgets);
  // Los obligatorios no se pueden omitir.
  expect(find.text('Omitir por ahora'), findsNothing);

  deps.blocker.perms = deps.blocker.perms.copyWith(overlay: true);
  await tester.pump(const Duration(seconds: 2));
  await _settle(tester);
  expect(find.text('Paso 3 de 5'), findsOneWidget);

  // Recomendado: se puede omitir.
  await _tap(tester, find.text('Omitir por ahora'));
  expect(find.text('Paso 4 de 5'), findsOneWidget);
  await _tap(tester, find.text('Omitir por ahora'));
  expect(find.text('Paso 5 de 5'), findsOneWidget);
  expect(find.text('Alarmas y recordatorios'), findsWidgets);
  await _tap(tester, find.text('Omitir por ahora'));
  expect(find.text('¡Todo listo! Ya puedes continuar.'), findsOneWidget);
  expect(find.text('Omitido'), findsNWidgets(3));

  await _tap(tester, find.text('Continuar'));
  expect(find.text('Apps permitidas'), findsOneWidget);
}

Future<void> earlyExitFlow(WidgetTester tester) async {
  final deps = TestDeps();
  await _pumpApp(tester, deps);

  await _startQuick(tester);
  expect(deps.blocker.active, isTrue);
  expect(find.text('Sesión activa'), findsOneWidget);
  expect(find.text('CONCENTRADO'), findsOneWidget);
  expect(find.text('Bloqueo activo'), findsOneWidget);
  expect(find.text('25:00'), findsOneWidget);

  // Un intento de distracción llega desde el motor nativo.
  deps.blocker.emitDistraction('com.instagram.android', deps.clock());
  await _settle(tester, 5);
  expect(find.text('1 intento de distracción'), findsOneWidget);

  await _tap(tester, find.text('Salir antes'));
  expect(find.text('Paso 1 de 3'), findsOneWidget);
  await tester.pump(const Duration(seconds: 61));
  await _tap(tester, find.text('Continuar'));

  expect(find.text('Paso 2 de 3'), findsOneWidget);
  await tester.enterText(find.byType(TextField), 'x' * 150);
  await _settle(tester, 3);
  await _tap(tester, find.text('Continuar'));

  expect(find.text('Paso 3 de 3'), findsOneWidget);
  await _tap(tester, find.text('Salir y perder la racha'));

  expect(find.text('Saliste antes'), findsOneWidget);
  expect(deps.blocker.active, isFalse);
  final session = deps.sessions.sessions.values.single;
  expect(session.outcome, SessionOutcome.earlyExit);
  expect(session.distractionCount, 1);
  expect(session.exitLevel, 3);

  await _tap(tester, find.text('Volver al inicio'));
  expect(find.text('Hola'), findsOneWidget);
}

/// 5 bloques de 25/5: después del 4.º viene el descanso largo de 15 min.
Future<void> longBreakFlow(WidgetTester tester) async {
  final deps = TestDeps(
    settings: const AppSettings(onboardingDone: true, cycles: 5),
  );
  await _pumpApp(tester, deps);
  await _tap(tester, find.text('Sesión rápida'));
  expect(
    find.text('Incluye un descanso largo de 15 min después del bloque 4.'),
    findsOneWidget,
  );
  await _tap(tester, find.text('Empezar sesión'));
  expect(deps.blocker.config!.plan.longBreakMinutes, 15);
  // 5 x 25 + 5 + 5 + 5 + 15 = 155 min.
  expect(deps.blocker.config!.endsAt, DateTime(2026, 11, 9, 11, 35));

  // Bloque 4 termina a los 115 min.
  deps.clock.advance(const Duration(minutes: 116));
  await _settle(tester, 15);
  expect(find.text('DESCANSO LARGO'), findsOneWidget);
  expect(find.text('14:00'), findsOneWidget);
  expect(find.text('Bloque 4 de 5 · Descanso largo'), findsOneWidget);
  // En modo estándar los descansos no bloquean.
  expect(find.text('Bloqueo en pausa'), findsOneWidget);

  deps.clock.advance(const Duration(minutes: 15));
  await _settle(tester, 15);
  expect(find.text('CONCENTRADO'), findsOneWidget);
  expect(find.text('Bloque 5 de 5 · Enfoque'), findsOneWidget);
}

/// Horario: crear un bloque, verlo en la agenda y empezar desde el aviso.
Future<void> scheduleFlow(WidgetTester tester) async {
  final deps = TestDeps();
  await _pumpApp(tester, deps);

  await _tap(tester, find.text('Horario'));
  expect(find.text('Aún no tienes horario'), findsOneWidget);
  await _tap(tester, find.text('Agregar bloque'));

  expect(find.text('Nuevo bloque'), findsOneWidget);
  await tester.enterText(find.byType(TextFormField), 'Matemáticas');
  await _settle(tester, 3);
  // Por defecto lunes a viernes 18:00, 2 x 25/5: termina 18:55.
  expect(find.text('50 min de enfoque · de 18:00 a 18:55'), findsOneWidget);
  await _tap(tester, find.text('Guardar'));

  // Agenda: aparece en lunes a viernes y como próxima sesión (hoy lunes).
  expect(find.text('Matemáticas'), findsWidgets);
  expect(find.text('Próxima sesión'), findsOneWidget);
  expect(find.text('Hoy a las 18:00'), findsOneWidget);
  expect(deps.blocker.reminderRules.single.title, 'Matemáticas');

  // Llega el aviso y el usuario toca "Empezar ahora".
  deps.blocker
    ..pendingStartBlock = deps.schedule.blocksById.keys.single
    ..emit(StartRequested());
  await _settle(tester);
  expect(find.text('CONCENTRADO'), findsOneWidget);
  expect(find.text('Bloque 1 de 2 · Enfoque'), findsOneWidget);
  // La materia del bloque llega a la sesión y al motor nativo.
  expect(find.text('MATEMÁTICAS'), findsOneWidget);
  expect(deps.blocker.config!.label, 'Matemáticas');
}

Future<void> completedFlow(WidgetTester tester) async {
  final deps = TestDeps();
  await _pumpApp(tester, deps);

  await _startQuick(tester);
  expect(find.text('CONCENTRADO'), findsOneWidget);

  // Pasa el tiempo: el ViewModel detecta el fin y cierra la sesión.
  deps.clock.advance(const Duration(minutes: 25, seconds: 1));
  await _settle(tester);

  expect(find.text('¡Sesión completada!'), findsOneWidget);
  final session = deps.sessions.sessions.values.single;
  expect(session.outcome, SessionOutcome.completed);
  expect(session.focusedMinutes, 25);
  expect(deps.streak.days.values.single.focusedMinutes, 25);

  await _tap(tester, find.text('Volver al inicio'));
  // Inicio muestra lo estudiado hoy.
  expect(find.text('25m'), findsOneWidget);
  expect(find.text('1 día seguido'), findsOneWidget);
}
