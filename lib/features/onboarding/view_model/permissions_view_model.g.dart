// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Estado de los permisos. Se vuelve a leer al regresar de Ajustes.

@ProviderFor(PermissionsViewModel)
final permissionsViewModelProvider = PermissionsViewModelProvider._();

/// Estado de los permisos. Se vuelve a leer al regresar de Ajustes.
final class PermissionsViewModelProvider
    extends $AsyncNotifierProvider<PermissionsViewModel, AppPermissions> {
  /// Estado de los permisos. Se vuelve a leer al regresar de Ajustes.
  PermissionsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionsViewModelHash();

  @$internal
  @override
  PermissionsViewModel create() => PermissionsViewModel();
}

String _$permissionsViewModelHash() =>
    r'0411c0e42dff7d7e236164c230beca1cb3032030';

/// Estado de los permisos. Se vuelve a leer al regresar de Ajustes.

abstract class _$PermissionsViewModel extends $AsyncNotifier<AppPermissions> {
  FutureOr<AppPermissions> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AppPermissions>, AppPermissions>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppPermissions>, AppPermissions>,
              AsyncValue<AppPermissions>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
