import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/features/allowlist/view/allowlist_screen.dart';
import 'package:enfoque/features/focus/view/home_screen.dart';
import 'package:enfoque/features/focus/view/session_screen.dart';
import 'package:enfoque/features/focus/view/summary_screen.dart';
import 'package:enfoque/features/onboarding/view/permissions_screen.dart';
import 'package:enfoque/features/onboarding/view/welcome_screen.dart';
import 'package:enfoque/features/rooms/view/rooms_screen.dart';
import 'package:enfoque/features/schedule/view/schedule_screen.dart';
import 'package:enfoque/features/settings/view/settings_screen.dart';
import 'package:enfoque/features/stats/view/stats_screen.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

abstract final class Routes {
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const permissions = '/permissions';
  static const allowlist = '/allowlist';
  static const home = '/home';
  static const schedule = '/schedule';
  static const rooms = '/rooms';
  static const progress = '/progress';
  static const session = '/session';
  static const summary = '/summary';
  static const settings = '/settings';

  static const Set<String> _onboarding = {welcome, permissions, allowlist};

  /// Guardas de navegación, como función pura para poder probarla.
  ///
  /// - Sin bienvenida terminada: solo bienvenida, permisos y apps permitidas.
  /// - Con una sesión recién cerrada: su resumen.
  /// - Con una sesión activa: la pantalla de sesión, siempre.
  static String? redirect({
    required String location,
    required AppSettings? settings,
    required bool loading,
    required FocusSession? activeSession,
    required int? finishedSessionId,
  }) {
    if (loading || settings == null) {
      return location == splash ? null : splash;
    }
    if (!settings.onboardingDone) {
      return _onboarding.contains(location) ? null : welcome;
    }
    if (finishedSessionId != null) {
      final target = '$summary/$finishedSessionId';
      return location == target ? null : target;
    }
    if (activeSession != null) {
      return location == session ? null : session;
    }
    if (location == splash ||
        location == welcome ||
        location == session ||
        location.startsWith(summary)) {
      return home;
    }
    return null;
  }
}

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final refresh = ValueNotifier(0);
  void bump() => refresh.value++;
  ref
    ..listen(settingsStreamProvider, (_, _) => bump())
    ..listen(activeSessionProvider, (_, _) => bump())
    ..listen(finishedSessionProvider, (_, _) => bump());

  final router = GoRouter(
    initialLocation: Routes.splash,
    refreshListenable: refresh,
    redirect: (context, state) {
      final settings = ref.read(settingsStreamProvider);
      final active = ref.read(activeSessionProvider);
      return Routes.redirect(
        location: state.matchedLocation,
        settings: settings.value,
        loading: !settings.hasValue || !active.hasValue,
        activeSession: active.value,
        finishedSessionId: ref.read(finishedSessionProvider),
      );
    },
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, _) => const _SplashScreen(),
      ),
      GoRoute(
        path: Routes.welcome,
        builder: (context, _) => const WelcomeScreen(),
      ),
      GoRoute(
        path: Routes.permissions,
        builder: (context, _) => const PermissionsScreen(),
      ),
      GoRoute(
        path: Routes.allowlist,
        builder: (context, _) => const AllowlistScreen(),
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, _) => const SettingsScreen(),
      ),
      GoRoute(
        path: Routes.session,
        builder: (context, _) => const SessionScreen(),
      ),
      GoRoute(
        path: '${Routes.summary}/:id',
        builder: (context, state) =>
            SummaryScreen(sessionId: int.parse(state.pathParameters['id']!)),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => _TabsShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (context, _) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.schedule,
                builder: (context, _) => const ScheduleScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.rooms,
                builder: (context, _) => const RoomsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.progress,
                builder: (context, _) => const StatsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
  ref.onDispose(() {
    router.dispose();
    refresh.dispose();
  });
  return router;
}

class _SplashScreen extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final settings = ref.watch(settingsStreamProvider);
    final active = ref.watch(activeSessionProvider);
    if (settings.hasError || active.hasError) {
      return Scaffold(
        body: ErrorState(
          message: l10n.commonGenericError,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref
            ..invalidate(settingsStreamProvider)
            ..invalidate(activeSessionProvider),
        ),
      );
    }
    return Scaffold(body: LoadingState(label: l10n.commonLoading));
  }
}

/// Barra de navegación con las 4 pestañas.
class _TabsShell extends StatelessWidget {
  const new({required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (i) =>
            shell.goBranch(i, initialLocation: i == shell.currentIndex),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l10n.navHome,
          ),
          NavigationDestination(
            icon: const Icon(Icons.calendar_month_outlined),
            selectedIcon: const Icon(Icons.calendar_month),
            label: l10n.navSchedule,
          ),
          NavigationDestination(
            icon: const Icon(Icons.groups_outlined),
            selectedIcon: const Icon(Icons.groups),
            label: l10n.navRooms,
          ),
          NavigationDestination(
            icon: const Icon(Icons.insights_outlined),
            selectedIcon: const Icon(Icons.insights),
            label: l10n.navProgress,
          ),
        ],
      ),
    );
  }
}
