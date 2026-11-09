import 'package:enfoque/app/schedule_coordinator.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/features/schedule/view_model/block_editor_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  const math = StudyBlock(
    weekdays: {1, 3, 5},
    startMinute: 18 * 60,
    cycles: 2,
    label: 'Matemáticas',
  );

  group('BlockEditorViewModel', () {
    test(
      'un bloque nuevo trae valores por defecto y se puede guardar',
      () async {
        final deps = TestDeps();
        final container = ProviderContainer.test(overrides: deps.overrides);
        final provider = blockEditorViewModelProvider(0);
        container.listen(provider, (_, _) {});
        final state = await container.read(provider.future);
        expect(state.isNew, isTrue);
        expect(state.block.weekdays, {1, 2, 3, 4, 5});
        expect(state.canSave, isTrue);

        final vm = container.read(provider.notifier)
          ..setLabel('Inglés')
          ..toggleDay(2)
          ..setStart(7 * 60 + 30);
        final saved = (await vm.save()).valueOrNull!;
        expect(saved.label, 'Inglés');
        expect(saved.weekdays, {1, 3, 4, 5});
        expect(deps.schedule.blocksById, hasLength(1));
      },
    );

    test('sin días o con cruce no se puede guardar', () async {
      final deps = TestDeps();
      await deps.schedule.save(math);
      final container = ProviderContainer.test(overrides: deps.overrides);
      final provider = blockEditorViewModelProvider(0);
      container.listen(provider, (_, _) {});
      await container.read(provider.future);
      final vm = container.read(provider.notifier)..setStart(18 * 60 + 30);

      expect(
        container.read(provider).value!.overlaps.single.label,
        'Matemáticas',
      );
      expect(container.read(provider).value!.canSave, isFalse);
      expect((await vm.save()).isOk, isFalse);

      vm.setStart(20 * 60);
      expect(container.read(provider).value!.canSave, isTrue);
      [1, 2, 3, 4, 5].forEach(vm.toggleDay);
      expect(container.read(provider).value!.hasDays, isFalse);
      expect(container.read(provider).value!.canSave, isFalse);
    });

    test('editar un bloque no choca consigo mismo y se puede borrar', () async {
      final deps = TestDeps();
      final saved = (await deps.schedule.save(math)).valueOrNull!;
      final container = ProviderContainer.test(overrides: deps.overrides);
      final provider = blockEditorViewModelProvider(saved.id);
      container.listen(provider, (_, _) {});
      final state = await container.read(provider.future);
      expect(state.isNew, isFalse);
      expect(state.canSave, isTrue);
      await container.read(provider.notifier).delete();
      expect(deps.schedule.blocksById, isEmpty);
    });
  });

  group('ScheduleCoordinator', () {
    test('envía una regla por bloque activo con textos en español', () async {
      final deps = TestDeps();
      await deps.schedule.save(math);
      await deps.schedule.save(
        const StudyBlock(weekdays: {2}, startMinute: 600, enabled: false),
      );
      ProviderContainer.test(overrides: deps.overrides)
          .listen(scheduleCoordinatorProvider, (_, _) {});
      await pumpEventQueue();

      final rule = deps.blocker.reminderRules.single;
      expect(rule.title, 'Matemáticas');
      expect(rule.weekdays, {1, 3, 5});
      expect(rule.startMinute, 18 * 60);
      expect(rule.detail, '2 bloques de 25/5 · termina a las 18:55');
    });

    test('"Empezar ahora" inicia la sesión con el plan del bloque', () async {
      final deps = TestDeps();
      final saved = (await deps.schedule.save(math)).valueOrNull!;
      deps.blocker.pendingStartBlock = saved.id;
      final container = ProviderContainer.test(overrides: deps.overrides)
        ..listen(scheduleCoordinatorProvider, (_, _) {});
      await pumpEventQueue();

      expect(deps.blocker.active, isTrue);
      expect(deps.blocker.config!.plan, math.plan);
      expect(container.read(scheduleCoordinatorProvider), isNull);
    });

    test('sin permisos avisa el problema', () async {
      final deps = TestDeps();
      final saved = (await deps.schedule.save(math)).valueOrNull!;
      deps.blocker
        ..perms = AppPermissions.none
        ..pendingStartBlock = saved.id;
      final container = ProviderContainer.test(overrides: deps.overrides)
        ..listen(scheduleCoordinatorProvider, (_, _) {});
      await pumpEventQueue();

      expect(
        container.read(scheduleCoordinatorProvider),
        ScheduledStartProblem.missingPermissions,
      );
    });

    test('reminderRuleFor: modo libre y bloque sin nombre', () {
      final l10n = lookupAppLocalizations(const Locale('es'));
      final rule = reminderRuleFor(
        const StudyBlock(
          id: 9,
          weekdays: {7},
          startMinute: 23 * 60,
          preset: PomodoroPreset.free,
          freeMinutes: 90,
        ),
        l10n,
      );
      expect(rule.title, 'Sesión de estudio');
      expect(rule.detail, '90 min seguidos · termina a las 00:30');
    });
  });
}
