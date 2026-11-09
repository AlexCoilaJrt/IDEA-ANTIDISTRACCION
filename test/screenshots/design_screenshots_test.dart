// Herramienta: capturas reales (fuente e íconos de verdad) para comparar con
// el diseño. No corre en `flutter test` normal; usar:
//   flutter test --run-skipped --update-goldens --tags screenshots test/screenshots
@Tags(['screenshots'])
library;

import 'dart:io';

import 'package:enfoque/app/app.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../helpers.dart';

Future<void> _loadFonts() async {
  final jakarta = FontLoader('PlusJakartaSans');
  for (final w in ['Regular', 'Medium', 'SemiBold', 'Bold']) {
    jakarta.addFont(rootBundle.load('assets/fonts/PlusJakartaSans-$w.ttf'));
  }
  await jakarta.load();
  final flutterRoot =
      Platform.environment['FLUTTER_ROOT'] ??
      '${Platform.environment['HOME']}/develop/flutter';
  final icons = File(
    '$flutterRoot/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf',
  );
  final loader = FontLoader('MaterialIcons')
    ..addFont(Future.value(ByteData.sublistView(icons.readAsBytesSync())));
  await loader.load();
}

Future<TestDeps> _seed() async {
  final deps = TestDeps(
    settings: const AppSettings(
      onboardingDone: true,
      displayName: 'Alex',
      dailyGoalMinutes: 180,
    ),
  );
  // Miércoles 11 nov 2026, 9:00.
  deps.clock.now = DateTime(2026, 11, 11, 9);
  const plan = PomodoroPlan(
    focusMinutes: 25,
    breakMinutes: 5,
    cycles: 4,
    longBreakMinutes: 15,
  );
  final data = [
    (DateTime(2026, 11, 9, 16), 100, 'Cálculo', SessionOutcome.completed),
    (DateTime(2026, 11, 10, 16), 75, 'Física', SessionOutcome.completed),
    (DateTime(2026, 11, 10, 19), 50, 'Historia', SessionOutcome.completed),
    (DateTime(2026, 11, 11, 7), 50, 'Cálculo', SessionOutcome.completed),
    (DateTime(2026, 11, 11, 8), 10, null, SessionOutcome.earlyExit),
    (DateTime(2026, 11, 3, 16), 90, 'Física', SessionOutcome.completed),
  ];
  for (final (start, minutes, label, outcome) in data) {
    final s = (await deps.sessions.create(
      startedAt: start,
      plan: plan,
      label: label,
    )).valueOrNull!;
    await deps.sessions.complete(
      s.id,
      outcome: outcome,
      endedAt: start.add(Duration(minutes: minutes)),
      focusedMinutes: minutes,
      distractions: [
        for (var i = 0; i < minutes ~/ 25; i++)
          DistractionEvent(packageName: 'com.instagram.android', at: start),
      ],
    );
  }
  for (final d in [8, 9, 10, 11]) {
    await deps.streak.upsertDay(
      DayFocus(
        day: DateTime(2026, 11, d),
        focusedMinutes: 120,
        hadEarlyExit: false,
      ),
    );
  }
  await deps.schedule.save(
    const StudyBlock(
      weekdays: {1, 3, 5},
      startMinute: 16 * 60,
      cycles: 4,
      label: 'Cálculo',
    ),
  );
  await deps.allowed.addAll(deps.allowed.installed);
  return deps;
}

Future<void> _shot(
  WidgetTester tester,
  String name,
  Future<void> Function(TestDeps deps) navigate,
) async {
  await _loadFonts();
  await initializeDateFormatting('es');
  final deps = await _seed();
  tester.view
    ..physicalSize = const Size(412 * 3, 1800 * 3)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(overrides: deps.overrides, child: const EnfoqueApp()),
  );
  for (var i = 0; i < 20; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
  await navigate(deps);
  for (var i = 0; i < 20; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
  await expectLater(
    find.byType(EnfoqueApp),
    matchesGoldenFile('out/$name.png'),
  );
}

void main() {
  testWidgets('inicio', (t) => _shot(t, 'inicio', (_) async {}));
  testWidgets(
    'progreso',
    (t) => _shot(t, 'progreso', (_) async {
      await t.tap(find.text('Progreso'));
    }),
  );
  testWidgets(
    'horario',
    (t) => _shot(t, 'horario', (_) async {
      await t.tap(find.text('Horario'));
    }),
  );
  testWidgets(
    'salas',
    (t) => _shot(t, 'salas', (_) async {
      await t.tap(find.text('Salas'));
    }),
  );
  testWidgets(
    'sesion',
    (t) => _shot(t, 'sesion', (deps) async {
      await t.tap(find.text('Empezar ahora'));
      for (var i = 0; i < 10; i++) {
        await t.pump(const Duration(milliseconds: 100));
      }
      deps.clock.advance(const Duration(minutes: 31, seconds: 20));
    }),
  );
  testWidgets('bienvenida', (t) async {
    await _loadFonts();
    await initializeDateFormatting('es');
    final deps = TestDeps(settings: const AppSettings());
    t.view
      ..physicalSize = const Size(412 * 3, 915 * 3)
      ..devicePixelRatio = 3;
    addTearDown(t.view.reset);
    await t.pumpWidget(
      ProviderScope(overrides: deps.overrides, child: const EnfoqueApp()),
    );
    for (var i = 0; i < 20; i++) {
      await t.pump(const Duration(milliseconds: 100));
    }
    await expectLater(
      find.byType(EnfoqueApp),
      matchesGoldenFile('out/bienvenida.png'),
    );
  });
}
