import 'dart:async';

import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/logic/stats_calculator.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/domain/use_cases/session_use_cases.dart';
import 'package:enfoque/features/allowlist/view_model/allowlist_view_model.dart';
import 'package:enfoque/features/focus/view_model/exit_cost_view_model.dart';
import 'package:enfoque/features/focus/view_model/home_view_model.dart';
import 'package:enfoque/features/stats/view_model/stats_view_model.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  group('HomeViewModel', () {
    test('suma los minutos de hoy y calcula la racha', () async {
      final deps = TestDeps();
      await deps.streak.upsertDay(
        DayFocus(
          day: DateTime(2026, 11, 8),
          focusedMinutes: 30,
          hadEarlyExit: false,
        ),
      );
      await deps.streak.upsertDay(
        DayFocus(
          day: DateTime(2026, 11, 9),
          focusedMinutes: 10,
          hadEarlyExit: false,
        ),
      );
      // Hoy (lunes 9): una completada de 10 min y una salida anticipada.
      const plan = PomodoroPlan(focusMinutes: 25, breakMinutes: 5, cycles: 1);
      final done = (await deps.sessions.create(
        startedAt: DateTime(2026, 11, 9, 7),
        plan: plan,
      )).valueOrNull!;
      await deps.sessions.complete(
        done.id,
        outcome: SessionOutcome.completed,
        endedAt: DateTime(2026, 11, 9, 7, 25),
        focusedMinutes: 10,
        distractions: const [],
      );
      final quit = (await deps.sessions.create(
        startedAt: DateTime(2026, 11, 9, 8),
        plan: plan,
      )).valueOrNull!;
      await deps.sessions.complete(
        quit.id,
        outcome: SessionOutcome.earlyExit,
        endedAt: DateTime(2026, 11, 9, 8, 5),
        focusedMinutes: 5,
        distractions: const [],
      );
      // Riverpod 3 pausa los providers sin oyentes.
      final container = ProviderContainer.test(overrides: deps.overrides)
        ..listen(homeViewModelProvider, (_, _) {});

      final state = await container.read(homeViewModelProvider.future);

      expect(state.todayMinutes, 15);
      expect(state.todaySessions, 1);
      expect(state.todayExits, 1);
      expect(state.week, [15, 0, 0, 0, 0, 0, 0]);
      expect(state.weekTotal, 15);
      expect(state.weekChange, isNull);
      expect(state.todayIndex, 0);
      expect(state.bestDayIndex, 0);
      expect(state.streak.current, 1);
      expect(state.goalReached, isFalse);
      expect(state.now, DateTime(2026, 11, 9, 9));
    });

    test('empezar desde un bloque del horario usa su plan y materia', () async {
      final deps = TestDeps();
      final container = ProviderContainer.test(overrides: deps.overrides)
        ..listen(homeViewModelProvider, (_, _) {});
      await container.read(homeViewModelProvider.future);
      const block = StudyBlock(
        id: 3,
        weekdays: {1},
        startMinute: 600,
        cycles: 2,
        label: 'Cálculo',
      );

      final session =
          (await container
                  .read(homeViewModelProvider.notifier)
                  .startSession(block: block))
              .valueOrNull!;

      expect(session.label, 'Cálculo');
      expect(session.plan, block.plan);
      expect(deps.blocker.config!.label, 'Cálculo');
    });

    test('cambiar el preset guarda los ajustes', () async {
      final deps = TestDeps();
      final container = ProviderContainer.test(overrides: deps.overrides)
        ..listen(homeViewModelProvider, (_, _) {});
      await container.read(homeViewModelProvider.future);

      await container
          .read(homeViewModelProvider.notifier)
          .selectPreset(PomodoroPreset.long);
      await container.read(homeViewModelProvider.notifier).setCycles(99);

      expect(deps.settings.settings.preset, PomodoroPreset.long);
      expect(deps.settings.settings.cycles, 8);
    });

    test('empezar sin permisos devuelve el error correspondiente', () async {
      final deps = TestDeps();
      deps.blocker.perms = AppPermissions.none;
      final container = ProviderContainer.test(overrides: deps.overrides)
        ..listen(homeViewModelProvider, (_, _) {});
      await container.read(homeViewModelProvider.future);

      final result = await container
          .read(homeViewModelProvider.notifier)
          .startSession();

      expect((result as Failure).error, isA<MissingPermissionsException>());
      expect(container.read(homeViewModelProvider).value!.starting, isFalse);
    });
  });

  group('ExitCostViewModel', () {
    test('tres escalones: espera, motivo y confirmación', () {
      fakeAsync((async) {
        final deps = TestDeps();
        final container = ProviderContainer.test(overrides: deps.overrides);
        late FocusSession session;
        unawaited(
          deps.sessions
              .create(startedAt: deps.clock(), plan: const AppSettings().plan)
              .then((r) => session = r.valueOrNull!),
        );
        async.flushMicrotasks();
        final provider = exitCostViewModelProvider(session.id);
        container.listen(provider, (_, _) {});
        final vm = container.read(provider.notifier);

        // Escalón 1: no se puede seguir hasta que pasen 60 s.
        expect(container.read(provider).step, 1);
        expect(container.read(provider).canContinue, isFalse);
        vm.next();
        expect(container.read(provider).step, 1);
        async.elapse(const Duration(seconds: 59));
        expect(container.read(provider).secondsLeft, 1);
        async.elapse(const Duration(seconds: 1));
        expect(container.read(provider).canContinue, isTrue);

        // Escalón 2: motivo de 150 caracteres o más.
        vm.next();
        async.flushMicrotasks();
        expect(container.read(provider).step, 2);
        expect(deps.sessions.sessions[session.id]!.exitLevel, 2);
        vm.updateReason('a' * 149);
        expect(container.read(provider).canContinue, isFalse);
        vm.updateReason('a' * 150);
        expect(container.read(provider).canContinue, isTrue);
        vm.next();
        async.flushMicrotasks();
        expect(container.read(provider).step, 3);

        // Escalón 3: confirmar cierra la sesión como salida anticipada.
        late Result<FocusSession> result;
        unawaited(vm.confirmExit().then((r) => result = r));
        async.flushMicrotasks();
        expect(result.valueOrNull!.outcome, SessionOutcome.earlyExit);
        expect(result.valueOrNull!.exitLevel, 3);
        expect(container.read(finishedSessionProvider), session.id);
        expect(container.read(provider).exited, isTrue);
        expect(deps.blocker.stopCalls, 1);
      });
    });

    test('no confirma antes del último escalón', () async {
      final deps = TestDeps();
      final container = ProviderContainer.test(overrides: deps.overrides);
      await deps.sessions.create(
        startedAt: deps.clock(),
        plan: const AppSettings().plan,
      );
      final provider = exitCostViewModelProvider(1);
      container.listen(provider, (_, _) {});
      final result = await container.read(provider.notifier).confirmExit();
      expect(result.isOk, isFalse);
    });
  });

  group('AllowlistViewModel', () {
    test('la primera vez sugiere calculadora y PDF', () async {
      final deps = TestDeps();
      final container = ProviderContainer.test(overrides: deps.overrides);
      final state = await container.read(allowlistViewModelProvider.future);
      expect(state.allowed, {'com.android.calculator2', 'com.adobe.reader'});
      expect(deps.settings.settings.allowlistSeeded, isTrue);
    });

    test('buscar filtra y permitir guarda', () async {
      final deps = TestDeps(settings: const AppSettings(allowlistSeeded: true));
      final container = ProviderContainer.test(overrides: deps.overrides)
        ..listen(allowlistViewModelProvider, (_, _) {});
      final state = await container.read(allowlistViewModelProvider.future);
      expect(state.allowed, isEmpty);
      final vm = container.read(allowlistViewModelProvider.notifier)
        ..search('ins');
      expect(
        container
            .read(allowlistViewModelProvider)
            .value!
            .visibleApps
            .single
            .label,
        'Insta',
      );
      await vm.toggle(deps.allowed.installed[1], allowed: true);
      expect(deps.allowed.allowedApps.keys, ['com.instagram.android']);
    });
  });

  test('StatsViewModel resume la semana', () async {
    final deps = TestDeps();
    final plan = const AppSettings().plan;
    final s = (await deps.sessions.create(
      startedAt: DateTime(2026, 11, 9, 8),
      plan: plan,
    )).valueOrNull!;
    await deps.sessions.complete(
      s.id,
      outcome: SessionOutcome.completed,
      endedAt: DateTime(2026, 11, 9, 8, 25),
      focusedMinutes: 25,
      distractions: [
        DistractionEvent(packageName: 'x', at: DateTime(2026, 11, 9, 8, 5)),
      ],
    );
    await deps.streak.upsertDay(
      DayFocus(
        day: DateTime(2026, 11, 9),
        focusedMinutes: 25,
        hadEarlyExit: false,
      ),
    );
    final container = ProviderContainer.test(overrides: deps.overrides)
      ..listen(statsViewModelProvider, (_, _) {});

    final state = await container.read(statsViewModelProvider.future);

    expect(state.period, StatsPeriod.week);
    expect(state.totalMinutes, 25);
    expect(state.completionRate, 100);
    expect(state.streak.current, 1);
    expect(state.bars, hasLength(7));
    expect(state.bars.first.total, 25);
    expect(state.subjects.single.key, isNull);
    expect(state.distractionTotal, 1);
    expect(state.topDistraction!.label, 'x');
    expect(state.topDistraction!.attempts, 1);
    expect(state.isEmpty, isFalse);

    // Cambiar a "Año" recalcula con 12 barras.
    container
        .read(statsViewModelProvider.notifier)
        .selectPeriod(StatsPeriod.year);
    final year = await container.read(statsViewModelProvider.future);
    expect(year.bars, hasLength(12));
    expect(year.bars[10].total, 25);
  });
}
