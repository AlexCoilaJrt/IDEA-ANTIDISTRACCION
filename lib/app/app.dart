import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/app/router.dart';
import 'package:enfoque/app/theme/app_theme.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnfoqueApp extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mantiene drift y el motor nativo de acuerdo mientras la app vive.
    ref.watch(sessionSupervisorProvider);
    final router = ref.watch(routerProvider);
    final themeMode =
        ref.watch(settingsStreamProvider).value?.themeMode ?? AppThemeMode.dark;

    return MaterialApp.router(
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
