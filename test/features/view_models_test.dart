import 'dart:async';

import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/core/utils/result.dart';
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
      // Riverpod 3 pausa los providers sin oyentes.
      final container = ProviderContainer.test(overrides: deps.overrides)
        ..listen(homeViewModelProvider, (_, _) {});

      final state = await container.read(homeViewModelProvider.future);

      expect(state.todayMinutes, 10);
      expect(state.streak.current, 1);
      expect(state.goalReached, isFalse);
      expect(state.plannedEnd, DateTime(2026, 11, 9, 9, 25));
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

    expect(state.todayMinutes, 25);
    expect(state.weekMinutes, 25);
    expect(state.completedSessions, 1);
    expect(state.weekDistractions, 1);
    expect(state.streak.current, 1);
    expect(state.lastWeekMinutes, [0, 0, 0, 0, 0, 0, 25]);
    expect(state.isEmpty, isFalse);
  });
}
