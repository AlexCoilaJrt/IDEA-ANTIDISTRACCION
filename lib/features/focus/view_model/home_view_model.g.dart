// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Pantalla de inicio: elegir el tipo de sesión y empezar.

@ProviderFor(HomeViewModel)
final homeViewModelProvider = HomeViewModelProvider._();

/// Pantalla de inicio: elegir el tipo de sesión y empezar.
final class HomeViewModelProvider
    extends $AsyncNotifierProvider<HomeViewModel, HomeState> {
  /// Pantalla de inicio: elegir el tipo de sesión y empezar.
  HomeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeViewModelHash();

  @$internal
  @override
  HomeViewModel create() => HomeViewModel();
}

String _$homeViewModelHash() => r'ffc7d1e0ae73c5c3b5c38ae2ae2461d7a72d65d5';

/// Pantalla de inicio: elegir el tipo de sesión y empezar.

abstract class _$HomeViewModel extends $AsyncNotifier<HomeState> {
  FutureOr<HomeState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HomeState>, HomeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HomeState>, HomeState>,
              AsyncValue<HomeState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
