import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/app/theme/app_theme.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/misc.dart' show Override;

import 'fakes/fakes.dart';

/// Conjunto de dependencias falsas para una prueba.
class TestDeps {
  new({AppSettings settings = const AppSettings(onboardingDone: true)})
    : settings = FakeSettingsRepository(settings);

  final sessions = FakeSessionRepository();
  final streak = FakeStreakRepository();
  final FakeSettingsRepository settings;
  final allowed = FakeAllowedAppsRepository();
  final schedule = FakeScheduleRepository();
  final blocker = FakeBlockerRepository();
  final clock = FakeClock(DateTime(2026, 11, 9, 9));

  List<Override> get overrides => [
    sessionRepositoryProvider.overrideWithValue(sessions),
    streakRepositoryProvider.overrideWithValue(streak),
    settingsRepositoryProvider.overrideWithValue(settings),
    allowedAppsRepositoryProvider.overrideWithValue(allowed),
    scheduleRepositoryProvider.overrideWithValue(schedule),
    blockerRepositoryProvider.overrideWithValue(blocker),
    clockProvider.overrideWithValue(clock.call),
    appResumedProvider.overrideWith((ref) => const Stream.empty()),
  ];
}

/// Envuelve un widget con tema y localización para pruebas de componentes.
Widget themed(Widget child, {Brightness brightness = Brightness.dark}) =>
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.dark ? AppTheme.dark() : AppTheme.light(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: Center(
          child: Padding(padding: const EdgeInsets.all(16), child: child),
        ),
      ),
    );
