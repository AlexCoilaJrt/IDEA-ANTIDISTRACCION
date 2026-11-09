import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/logic/allowlist_suggestions.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'allowlist_view_model.freezed.dart';
part 'allowlist_view_model.g.dart';

@freezed
abstract class AllowlistState with _$AllowlistState {
  const factory({
    required List<InstalledApp> apps,
    required Set<String> allowed,
    @Default('') String query,
  }) = _AllowlistState;

  const new _();

  List<InstalledApp> get visibleApps {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return apps;
    return apps.where((a) => a.label.toLowerCase().contains(q)).toList();
  }
}

/// Elegir las apps que se pueden usar durante una sesión.
@riverpod
class AllowlistViewModel extends _$AllowlistViewModel {
  @override
  Future<AllowlistState> build() async {
    final repo = ref.read(allowedAppsRepositoryProvider);
    final apps = _unwrap(await repo.installedApps());

    // La primera vez se preseleccionan calculadora, diccionario, PDF y
    // teléfono.
    final settingsRepo = ref.read(settingsRepositoryProvider);
    final settings = _unwrap(await settingsRepo.load());
    if (!settings.allowlistSeeded) {
      final suggested = apps
          .where(
            (a) => AllowlistSuggestions.isSuggested(a.packageName, a.label),
          )
          .toList();
      await repo.addAll(suggested);
      await settingsRepo.save(settings.copyWith(allowlistSeeded: true));
    }

    final allowed = _unwrap(await repo.allowed());
    return AllowlistState(
      apps: apps,
      allowed: {for (final a in allowed) a.packageName},
    );
  }

  void search(String query) {
    final s = state.value;
    if (s != null) state = AsyncData(s.copyWith(query: query));
  }

  Future<void> toggle(InstalledApp app, {required bool allowed}) async {
    final s = state.value;
    if (s == null) return;
    final next = {...s.allowed};
    allowed ? next.add(app.packageName) : next.remove(app.packageName);
    state = AsyncData(s.copyWith(allowed: next));
    final result = await ref
        .read(allowedAppsRepositoryProvider)
        .setAllowed(app, allowed: allowed);
    if (result is Failure && ref.mounted) {
      // Revertir si no se pudo guardar.
      state = AsyncData(s);
    }
  }

  /// Último paso de la bienvenida.
  Future<void> finishOnboarding() async {
    final repo = ref.read(settingsRepositoryProvider);
    final settings = (await repo.load()).valueOrNull;
    if (settings == null) return;
    await repo.save(settings.copyWith(onboardingDone: true));
  }

  static T _unwrap<T>(Result<T> result) => switch (result) {
    Ok(:final value) => value,
    Failure(:final error, :final stackTrace) => Error.throwWithStackTrace(
      error,
      stackTrace ?? StackTrace.current,
    ),
  };
}
