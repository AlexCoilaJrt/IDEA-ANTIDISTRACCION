// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Semana, mes o año seleccionado en Progreso.

@ProviderFor(SelectedStatsPeriod)
final selectedStatsPeriodProvider = SelectedStatsPeriodProvider._();

/// Semana, mes o año seleccionado en Progreso.
final class SelectedStatsPeriodProvider
    extends $NotifierProvider<SelectedStatsPeriod, StatsPeriod> {
  /// Semana, mes o año seleccionado en Progreso.
  SelectedStatsPeriodProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedStatsPeriodProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedStatsPeriodHash();

  @$internal
  @override
  SelectedStatsPeriod create() => SelectedStatsPeriod();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StatsPeriod value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StatsPeriod>(value),
    );
  }
}

String _$selectedStatsPeriodHash() =>
    r'7fd21572fc7556339f640b232fac70e9f23e2434';

/// Semana, mes o año seleccionado en Progreso.

abstract class _$SelectedStatsPeriod extends $Notifier<StatsPeriod> {
  StatsPeriod build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<StatsPeriod, StatsPeriod>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StatsPeriod, StatsPeriod>,
              StatsPeriod,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Progreso: métricas del período, gráficos, consistencia y distracciones.

@ProviderFor(StatsViewModel)
final statsViewModelProvider = StatsViewModelProvider._();

/// Progreso: métricas del período, gráficos, consistencia y distracciones.
final class StatsViewModelProvider
    extends $AsyncNotifierProvider<StatsViewModel, StatsState> {
  /// Progreso: métricas del período, gráficos, consistencia y distracciones.
  StatsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'statsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$statsViewModelHash();

  @$internal
  @override
  StatsViewModel create() => StatsViewModel();
}

String _$statsViewModelHash() => r'a91c3a21522d29985e961ba0e5a312b7fe5c279c';

/// Progreso: métricas del período, gráficos, consistencia y distracciones.

abstract class _$StatsViewModel extends $AsyncNotifier<StatsState> {
  FutureOr<StatsState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<StatsState>, StatsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<StatsState>, StatsState>,
              AsyncValue<StatsState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
