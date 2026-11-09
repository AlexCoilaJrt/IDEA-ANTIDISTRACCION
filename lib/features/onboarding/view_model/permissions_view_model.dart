import 'dart:async';

import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permissions_view_model.freezed.dart';
part 'permissions_view_model.g.dart';

@freezed
abstract class PermissionsUiState with _$PermissionsUiState {
  const factory({
    required AppPermissions permissions,
    @Default(<PermissionKind>{}) Set<PermissionKind> skipped,

    /// Paso elegido a mano desde el resumen.
    PermissionKind? selected,
  }) = _PermissionsUiState;

  const new _();

  /// Orden del asistente: primero los obligatorios.
  static const List<PermissionKind> order = [
    PermissionKind.usageAccess,
    PermissionKind.overlay,
    PermissionKind.notifications,
    PermissionKind.batteryOptimization,
    PermissionKind.exactAlarms,
  ];

  static bool isRequired(PermissionKind kind) =>
      kind == PermissionKind.usageAccess || kind == PermissionKind.overlay;

  bool isGranted(PermissionKind kind) => switch (kind) {
    PermissionKind.usageAccess => permissions.usageAccess,
    PermissionKind.overlay => permissions.overlay,
    PermissionKind.notifications => permissions.notifications,
    PermissionKind.batteryOptimization => permissions.batteryOptimization,
    PermissionKind.exactAlarms => permissions.exactAlarms,
  };

  /// Permiso que se está guiando ahora; `null` si no queda ninguno.
  PermissionKind? get current {
    final chosen = selected;
    if (chosen != null && !isGranted(chosen)) return chosen;
    for (final kind in order) {
      if (!isGranted(kind) && !skipped.contains(kind)) return kind;
    }
    return null;
  }

  int get stepNumber {
    final c = current;
    return c == null ? order.length : order.indexOf(c) + 1;
  }

  bool get canContinue => permissions.canBlock;
}

/// Asistente de permisos: uno a la vez, con detección automática al volver
/// de Ajustes.
@riverpod
class PermissionsViewModel extends _$PermissionsViewModel {
  static const _pollInterval = Duration(seconds: 2);

  @override
  Future<PermissionsUiState> build() async {
    // Al volver de Ajustes, y cada 2 s por si el celular no avisa del regreso.
    ref.listen(appResumedProvider, (_, _) => unawaited(refresh()));
    final timer = Timer.periodic(_pollInterval, (_) => unawaited(refresh()));
    ref.onDispose(timer.cancel);
    return PermissionsUiState(permissions: await _read());
  }

  /// Vuelve a leer los permisos sin mostrar "cargando".
  Future<void> refresh() async {
    final result = await ref.read(blockerRepositoryProvider).permissions();
    if (!ref.mounted) return;
    final current = state.value;
    if (result case Ok(:final value) when current != null) {
      if (value != current.permissions) {
        state = AsyncData(current.copyWith(permissions: value));
      }
    }
  }

  /// Abre la pantalla de Android para [kind].
  Future<void> open(PermissionKind kind) async {
    await ref.read(blockerRepositoryProvider).requestPermission(kind);
  }

  Future<void> openAppDetails() async {
    await ref.read(blockerRepositoryProvider).openAppDetails();
  }

  /// Comprueba ahora mismo. Devuelve `true` si [kind] ya está activado.
  Future<bool> verify(PermissionKind kind) async {
    await refresh();
    return state.value?.isGranted(kind) ?? false;
  }

  void skip(PermissionKind kind) {
    final s = state.value;
    if (s == null || PermissionsUiState.isRequired(kind)) return;
    state = AsyncData(
      s.copyWith(skipped: {...s.skipped, kind}, selected: null),
    );
  }

  /// Volver a un paso desde el resumen.
  void select(PermissionKind kind) {
    final s = state.value;
    if (s == null || s.isGranted(kind)) return;
    state = AsyncData(
      s.copyWith(selected: kind, skipped: {...s.skipped}..remove(kind)),
    );
  }

  Future<AppPermissions> _read() async {
    final result = await ref.read(blockerRepositoryProvider).permissions();
    return switch (result) {
      Ok(:final value) => value,
      Failure(:final error, :final stackTrace) => Error.throwWithStackTrace(
        error,
        stackTrace ?? StackTrace.current,
      ),
    };
  }
}
