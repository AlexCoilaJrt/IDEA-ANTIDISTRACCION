// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Sesión activa a pantalla completa. Se actualiza cada segundo.

@ProviderFor(SessionViewModel)
final sessionViewModelProvider = SessionViewModelProvider._();

/// Sesión activa a pantalla completa. Se actualiza cada segundo.
final class SessionViewModelProvider
    extends $NotifierProvider<SessionViewModel, SessionUiState?> {
  /// Sesión activa a pantalla completa. Se actualiza cada segundo.
  SessionViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionViewModelHash();

  @$internal
  @override
  SessionViewModel create() => SessionViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionUiState? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionUiState?>(value),
    );
  }
}

String _$sessionViewModelHash() => r'090daffa7ebd2dfa9f64ba8c06346b84d7c01ff5';

/// Sesión activa a pantalla completa. Se actualiza cada segundo.

abstract class _$SessionViewModel extends $Notifier<SessionUiState?> {
  SessionUiState? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SessionUiState?, SessionUiState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SessionUiState?, SessionUiState?>,
              SessionUiState?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
