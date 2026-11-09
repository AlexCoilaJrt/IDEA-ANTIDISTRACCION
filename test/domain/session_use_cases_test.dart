import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/domain/use_cases/session_use_cases.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fakes/fakes.dart';

void main() {
  late FakeSessionRepository sessions;
  late FakeStreakRepository streak;
  late FakeSettingsRepository settings;
  late FakeAllowedAppsRepository allowed;
  late FakeBlockerRepository blocker;
  late FakeClock clock;
  late StartSessionUseCase start;
  late FinishSessionUseCase finish;
  late ReconcileSessionUseCase reconcile;

  setUp(() {
    sessions = FakeSessionRepository();
    streak = FakeStreakRepository();
    settings = FakeSettingsRepository(
      const AppSettings(onboardingDone: true, strictness: Strictness.strict),
    );
    allowed = FakeAllowedAppsRepository();
    blocker = FakeBlockerRepository();
    clock = FakeClock(DateTime(2026, 11, 9, 9));
    start = StartSessionUseCase(
      sessions: sessions,
      allowedApps: allowed,
      settings: settings,
      blocker: blocker,
      clock: clock.call,
    );
    finish = FinishSessionUseCase(
      sessions: sessions,
      streak: streak,
      blocker: blocker,
      clock: clock.call,
    );
    reconcile = ReconcileSessionUseCase(
      sessions: sessions,
      blocker: blocker,
      finish: finish,
      clock: clock.call,
    );
  });

  group('StartSessionUseCase', () {
    test('crea la sesión y arranca el motor con apps y rigurosidad', () async {
      await allowed.setAllowed(allowed.installed.first, allowed: true);

      final result = await start();

      expect(result.isOk, isTrue);
      final session = result.valueOrNull!;
      expect(session.isActive, isTrue);
      expect(blocker.active, isTrue);
      expect(blocker.config!.sessionId, session.id);
      expect(blocker.config!.allowedPackages, ['com.android.calculator2']);
      expect(blocker.config!.strictness, Strictness.strict);
      expect(blocker.config!.endsAt, DateTime(2026, 11, 9, 9, 25));
    });

    test('sin permisos de bloqueo no empieza', () async {
      blocker.perms = AppPermissions.none;
      final result = await start();
      expect((result as Failure).error, isA<MissingPermissionsException>());
      expect(sessions.sessions, isEmpty);
    });

    test('no permite dos sesiones a la vez', () async {
      await start();
      final second = await start();
      expect((second as Failure).error, isA<SessionAlreadyActiveException>());
    });

    test('si el motor falla, borra la sesión creada', () async {
      blocker.failStart = true;
      final result = await start();
      expect(result.isOk, isFalse);
      expect(sessions.sessions, isEmpty);
    });
  });

  group('FinishSessionUseCase', () {
    test(
      'al completar guarda minutos planeados, distracciones y racha',
      () async {
        final session = (await start()).valueOrNull!;
        blocker.emitDistraction('com.instagram.android', clock());
        clock.advance(const Duration(minutes: 26));

        final result = await finish(
          session.id,
          outcome: SessionOutcome.completed,
        );

        final done = result.valueOrNull!;
        expect(done.outcome, SessionOutcome.completed);
        expect(done.focusedMinutes, 25);
        expect(done.distractionCount, 1);
        expect(done.endedAt, session.plannedEnd);
        expect(blocker.active, isFalse);
        expect(
          sessions.distractions[session.id]!.single.packageName,
          'com.instagram.android',
        );
        final day = streak.days[DateTime(2026, 11, 9)]!;
        expect(day.focusedMinutes, 25);
        expect(day.hadEarlyExit, isFalse);
      },
    );

    test(
      'salida anticipada: minutos parciales, sin puntos y día marcado',
      () async {
        final session = (await start()).valueOrNull!;
        clock.advance(const Duration(minutes: 10, seconds: 30));

        final done = (await finish(
          session.id,
          outcome: SessionOutcome.earlyExit,
          exitReason: 'motivo',
        )).valueOrNull!;

        expect(done.focusedMinutes, 10);
        expect(done.points, 0);
        expect(done.exitReason, 'motivo');
        expect(streak.days[DateTime(2026, 11, 9)]!.hadEarlyExit, isTrue);
      },
    );

    test('es idempotente y serializa cierres simultáneos', () async {
      final session = (await start()).valueOrNull!;
      blocker.emitDistraction('x', clock());
      clock.advance(const Duration(minutes: 30));

      final results = await Future.wait([
        finish(session.id, outcome: SessionOutcome.completed),
        finish(session.id, outcome: SessionOutcome.earlyExit),
      ]);

      expect(results[0].valueOrNull!.outcome, SessionOutcome.completed);
      expect(results[1].valueOrNull!.outcome, SessionOutcome.completed);
      expect(sessions.sessions[session.id]!.distractionCount, 1);
      expect(blocker.stopCalls, 1);
    });
  });

  group('ReconcileSessionUseCase', () {
    test('sin sesión y con el motor encendido, lo apaga', () async {
      blocker.active = true;
      final result = await reconcile();
      expect(result.valueOrNull, isNull);
      expect(blocker.stopCalls, 1);
    });

    test('si ya pasó la hora de fin, la cierra como completada', () async {
      await start();
      clock.advance(const Duration(hours: 2));
      final closed = (await reconcile()).valueOrNull!;
      expect(closed.outcome, SessionOutcome.completed);
    });

    test('si el motor se detuvo antes de tiempo, queda interrumpida', () async {
      await start();
      blocker.active = false;
      clock.advance(const Duration(minutes: 5));
      final closed = (await reconcile()).valueOrNull!;
      expect(closed.outcome, SessionOutcome.interrupted);
      expect(closed.focusedMinutes, 5);
    });

    test('con el motor funcionando no hace nada', () async {
      await start();
      clock.advance(const Duration(minutes: 5));
      expect((await reconcile()).valueOrNull, isNull);
      expect(blocker.active, isTrue);
    });

    test('si no puede leer el motor, no cierra nada', () async {
      final session = (await start()).valueOrNull!;
      blocker.failStatus = true;
      await reconcile();
      expect(sessions.sessions[session.id]!.isActive, isTrue);
    });
  });
}
