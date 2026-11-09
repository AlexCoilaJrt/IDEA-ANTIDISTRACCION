import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permissions_view_model.g.dart';

/// Estado de los permisos. Se vuelve a leer al regresar de Ajustes.
@riverpod
class PermissionsViewModel extends _$PermissionsViewModel {
  @override
  Future<AppPermissions> build() async {
    ref.listen(appResumedProvider, (_, _) => ref.invalidateSelf());
    final result = await ref.read(blockerRepositoryProvider).permissions();
    return switch (result) {
      Ok(:final value) => value,
      Failure(:final error, :final stackTrace) => Error.throwWithStackTrace(
        error,
        stackTrace ?? StackTrace.current,
      ),
    };
  }

  Future<void> request(PermissionKind kind) async {
    await ref.read(blockerRepositoryProvider).requestPermission(kind);
  }
}
