// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// La próxima sesión del horario (también la usa Inicio).

@ProviderFor(nextScheduled)
final nextScheduledProvider = NextScheduledProvider._();

/// La próxima sesión del horario (también la usa Inicio).

final class NextScheduledProvider
    extends
        $FunctionalProvider<
          AsyncValue<ScheduledOccurrence?>,
          ScheduledOccurrence?,
          FutureOr<ScheduledOccurrence?>
        >
    with
        $FutureModifier<ScheduledOccurrence?>,
        $FutureProvider<ScheduledOccurrence?> {
  /// La próxima sesión del horario (también la usa Inicio).
  NextScheduledProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nextScheduledProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nextScheduledHash();

  @$internal
  @override
  $FutureProviderElement<ScheduledOccurrence?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ScheduledOccurrence?> create(Ref ref) {
    return nextScheduled(ref);
  }
}

String _$nextScheduledHash() => r'96b9fdc24aaa86223fd43e5889f1b8b54eaaa68d';

/// Pestaña Horario: agenda semanal.

@ProviderFor(ScheduleViewModel)
final scheduleViewModelProvider = ScheduleViewModelProvider._();

/// Pestaña Horario: agenda semanal.
final class ScheduleViewModelProvider
    extends $AsyncNotifierProvider<ScheduleViewModel, ScheduleState> {
  /// Pestaña Horario: agenda semanal.
  ScheduleViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleViewModelHash();

  @$internal
  @override
  ScheduleViewModel create() => ScheduleViewModel();
}

String _$scheduleViewModelHash() => r'd1b9ef02631ebed7f2001c068e3eb48dc041f367';

/// Pestaña Horario: agenda semanal.

abstract class _$ScheduleViewModel extends $AsyncNotifier<ScheduleState> {
  FutureOr<ScheduleState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ScheduleState>, ScheduleState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ScheduleState>, ScheduleState>,
              AsyncValue<ScheduleState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
