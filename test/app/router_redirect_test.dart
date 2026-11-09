import 'package:enfoque/app/router.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const done = AppSettings(onboardingDone: true);
  final active = FocusSession(
    id: 7,
    startedAt: DateTime(2026, 11, 9),
    plan: const PomodoroPlan(focusMinutes: 25, breakMinutes: 5, cycles: 1),
    outcome: SessionOutcome.active,
  );

  String? go(
    String location, {
    AppSettings? settings = done,
    bool loading = false,
    FocusSession? session,
    int? finished,
  }) => Routes.redirect(
    location: location,
    settings: settings,
    loading: loading,
    activeSession: session,
    finishedSessionId: finished,
  );

  test('mientras carga, muestra el splash', () {
    expect(go(Routes.home, loading: true), Routes.splash);
    expect(go(Routes.splash, loading: true), isNull);
  });

  test('sin bienvenida terminada, solo pantallas de bienvenida', () {
    const fresh = AppSettings();
    expect(go(Routes.home, settings: fresh), Routes.welcome);
    expect(go(Routes.permissions, settings: fresh), isNull);
    expect(go(Routes.allowlist, settings: fresh), isNull);
    expect(go(Routes.session, settings: fresh), Routes.welcome);
  });

  test('una sesión activa obliga a la pantalla de sesión', () {
    expect(go(Routes.home, session: active), Routes.session);
    expect(go(Routes.settings, session: active), Routes.session);
    expect(go(Routes.session, session: active), isNull);
  });

  test('una sesión recién cerrada muestra su resumen', () {
    expect(go(Routes.session, finished: 7), '${Routes.summary}/7');
    expect(go('${Routes.summary}/7', finished: 7), isNull);
  });

  test('sin sesión, la pantalla de sesión y el splash vuelven al inicio', () {
    expect(go(Routes.session), Routes.home);
    expect(go(Routes.splash), Routes.home);
    expect(go('${Routes.summary}/7'), Routes.home);
    expect(go(Routes.progress), isNull);
  });
}
