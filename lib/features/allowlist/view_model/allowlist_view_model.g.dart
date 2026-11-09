// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allowlist_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Elegir las apps que se pueden usar durante una sesión.

@ProviderFor(AllowlistViewModel)
final allowlistViewModelProvider = AllowlistViewModelProvider._();

/// Elegir las apps que se pueden usar durante una sesión.
final class AllowlistViewModelProvider
    extends $AsyncNotifierProvider<AllowlistViewModel, AllowlistState> {
  /// Elegir las apps que se pueden usar durante una sesión.
  AllowlistViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allowlistViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allowlistViewModelHash();

  @$internal
  @override
  AllowlistViewModel create() => AllowlistViewModel();
}

String _$allowlistViewModelHash() =>
    r'5e1e542053b4e94296268978292ff9a02de27894';

/// Elegir las apps que se pueden usar durante una sesión.

abstract class _$AllowlistViewModel extends $AsyncNotifier<AllowlistState> {
  FutureOr<AllowlistState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AllowlistState>, AllowlistState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AllowlistState>, AllowlistState>,
              AsyncValue<AllowlistState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
