// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Sesiones de las últimas 12 semanas (para estadísticas).

@ProviderFor(statsSessions)
final statsSessionsProvider = StatsSessionsProvider._();

/// Sesiones de las últimas 12 semanas (para estadísticas).

final class StatsSessionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<FocusSession>>,
          List<FocusSession>,
          Stream<List<FocusSession>>
        >
    with
        $FutureModifier<List<FocusSession>>,
        $StreamProvider<List<FocusSession>> {
  /// Sesiones de las últimas 12 semanas (para estadísticas).
  StatsSessionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'statsSessionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$statsSessionsHash();

  @$internal
  @override
  $StreamProviderElement<List<FocusSession>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<FocusSession>> create(Ref ref) {
    return statsSessions(ref);
  }
}

String _$statsSessionsHash() => r'a9d72734324cefc2aa577fbe0bff1734e2de46fa';

/// Racha y estadísticas locales.

@ProviderFor(StatsViewModel)
final statsViewModelProvider = StatsViewModelProvider._();

/// Racha y estadísticas locales.
final class StatsViewModelProvider
    extends $AsyncNotifierProvider<StatsViewModel, StatsState> {
  /// Racha y estadísticas locales.
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

String _$statsViewModelHash() => r'89b5393a8849e6baa3d01df500ab90e5504b7012';

/// Racha y estadísticas locales.

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
