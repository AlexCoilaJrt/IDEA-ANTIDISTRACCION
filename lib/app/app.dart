import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/app/router.dart';
import 'package:enfoque/app/schedule_coordinator.dart';
import 'package:enfoque/app/theme/app_theme.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _messengerKey = GlobalKey<ScaffoldMessengerState>();

class EnfoqueApp extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mantiene drift y el motor nativo de acuerdo mientras la app vive.
    ref.watch(sessionSupervisorProvider);
    final router = ref.watch(routerProvider);

    // Recordatorios del horario y "Empezar ahora". Si no se pudo empezar,
    // se avisa con un mensaje.
    ref.listen(scheduleCoordinatorProvider, (_, problem) {
      if (problem == null) return;
      ref.read(scheduleCoordinatorProvider.notifier).clearProblem();
      final context = _messengerKey.currentContext;
      if (context == null) return;
      final l10n = AppLocalizations.of(context);
      _messengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(switch (problem) {
            ScheduledStartProblem.missingPermissions =>
              l10n.scheduleProblemPermissions,
            ScheduledStartProblem.alreadyActive => l10n.scheduleProblemActive,
            ScheduledStartProblem.other => l10n.scheduleProblemOther,
          }),
          action: problem == ScheduledStartProblem.missingPermissions
              ? SnackBarAction(
                  label: l10n.scheduleReview,
                  onPressed: () => router.push(Routes.permissions),
                )
              : null,
        ),
      );
    });
    final themeMode =
        ref.watch(settingsStreamProvider).value?.themeMode ?? AppThemeMode.dark;

    return MaterialApp.router(
      scaffoldMessengerKey: _messengerKey,
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: switch (themeMode) {
        AppThemeMode.system => ThemeMode.system,
        AppThemeMode.light => ThemeMode.light,
        AppThemeMode.dark => ThemeMode.dark,
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
