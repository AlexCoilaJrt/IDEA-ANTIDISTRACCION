// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Ajustes: meta diaria, modo estricto y tema.

@ProviderFor(SettingsViewModel)
final settingsViewModelProvider = SettingsViewModelProvider._();

/// Ajustes: meta diaria, modo estricto y tema.
final class SettingsViewModelProvider
    extends $AsyncNotifierProvider<SettingsViewModel, AppSettings> {
  /// Ajustes: meta diaria, modo estricto y tema.
  SettingsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsViewModelHash();

  @$internal
  @override
  SettingsViewModel create() => SettingsViewModel();
}

String _$settingsViewModelHash() => r'f147a3d2e80cc607183681f52799ab659b7de87a';

/// Ajustes: meta diaria, modo estricto y tema.

abstract class _$SettingsViewModel extends $AsyncNotifier<AppSettings> {
  FutureOr<AppSettings> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AppSettings>, AppSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppSettings>, AppSettings>,
              AsyncValue<AppSettings>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
