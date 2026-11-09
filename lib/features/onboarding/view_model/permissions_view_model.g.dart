// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Asistente de permisos: uno a la vez, con detección automática al volver
/// de Ajustes.

@ProviderFor(PermissionsViewModel)
final permissionsViewModelProvider = PermissionsViewModelProvider._();

/// Asistente de permisos: uno a la vez, con detección automática al volver
/// de Ajustes.
final class PermissionsViewModelProvider
    extends $AsyncNotifierProvider<PermissionsViewModel, PermissionsUiState> {
  /// Asistente de permisos: uno a la vez, con detección automática al volver
  /// de Ajustes.
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
    r'dc95de3da00e184f441fd44289085011e38bbb6f';

/// Asistente de permisos: uno a la vez, con detección automática al volver
/// de Ajustes.

abstract class _$PermissionsViewModel
    extends $AsyncNotifier<PermissionsUiState> {
  FutureOr<PermissionsUiState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<PermissionsUiState>, PermissionsUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PermissionsUiState>, PermissionsUiState>,
              AsyncValue<PermissionsUiState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
