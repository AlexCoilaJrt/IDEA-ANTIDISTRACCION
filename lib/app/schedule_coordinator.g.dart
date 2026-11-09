// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_coordinator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Mantiene los recordatorios nativos al día con el horario y atiende el
/// botón "Empezar ahora" de los avisos.

@ProviderFor(ScheduleCoordinator)
final scheduleCoordinatorProvider = ScheduleCoordinatorProvider._();

/// Mantiene los recordatorios nativos al día con el horario y atiende el
/// botón "Empezar ahora" de los avisos.
final class ScheduleCoordinatorProvider
    extends $NotifierProvider<ScheduleCoordinator, ScheduledStartProblem?> {
  /// Mantiene los recordatorios nativos al día con el horario y atiende el
  /// botón "Empezar ahora" de los avisos.
  ScheduleCoordinatorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleCoordinatorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleCoordinatorHash();

  @$internal
  @override
  ScheduleCoordinator create() => ScheduleCoordinator();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScheduledStartProblem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScheduledStartProblem?>(value),
    );
  }
}

String _$scheduleCoordinatorHash() =>
    r'c73ed78d3370ecd133e85ae2ebf2a6cffc0a942c';

/// Mantiene los recordatorios nativos al día con el horario y atiende el
/// botón "Empezar ahora" de los avisos.

abstract class _$ScheduleCoordinator extends $Notifier<ScheduledStartProblem?> {
  ScheduledStartProblem? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<ScheduledStartProblem?, ScheduledStartProblem?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ScheduledStartProblem?, ScheduledStartProblem?>,
              ScheduledStartProblem?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
