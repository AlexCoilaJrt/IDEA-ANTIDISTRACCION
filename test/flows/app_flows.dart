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

Future<void> onboardingFlow(WidgetTester tester) async {
  final deps = TestDeps(settings: const AppSettings());
  await _pumpApp(tester, deps);

  expect(find.text('Estudia sin distracciones'), findsOneWidget);
  await _tap(tester, find.text('Empezar'));

  expect(find.text('Acceso a datos de uso'), findsOneWidget);
  expect(find.text('Activado'), findsNWidgets(4));
  await _tap(tester, find.text('Continuar'));

  expect(find.text('Apps permitidas'), findsOneWidget);
  // Calculadora y PDF quedan sugeridas.
  expect(find.text('2 apps permitidas'), findsOneWidget);
  await _tap(tester, find.text('Listo'));

  expect(find.text('¿Listo para concentrarte?'), findsOneWidget);
  expect(deps.settings.settings.onboardingDone, isTrue);
}

Future<void> earlyExitFlow(WidgetTester tester) async {
  final deps = TestDeps();
  await _pumpApp(tester, deps);

  await _tap(tester, find.text('Empezar sesión'));
  expect(deps.blocker.active, isTrue);
  expect(find.text('Enfoque'), findsOneWidget);
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
  expect(find.text('¿Listo para concentrarte?'), findsOneWidget);
}

Future<void> completedFlow(WidgetTester tester) async {
  final deps = TestDeps();
  await _pumpApp(tester, deps);

  await _tap(tester, find.text('Empezar sesión'));
  expect(find.text('Enfoque'), findsOneWidget);

  // Pasa el tiempo: el ViewModel detecta el fin y cierra la sesión.
  deps.clock.advance(const Duration(minutes: 25, seconds: 1));
  await _settle(tester);

  expect(find.text('¡Sesión completada!'), findsOneWidget);
  final session = deps.sessions.sessions.values.single;
  expect(session.outcome, SessionOutcome.completed);
  expect(session.focusedMinutes, 25);
  expect(deps.streak.days.values.single.focusedMinutes, 25);

  await _tap(tester, find.text('Volver al inicio'));
  expect(find.text('¡Meta de hoy cumplida!'), findsOneWidget);
}
