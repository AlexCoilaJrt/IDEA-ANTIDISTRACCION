import 'package:enfoque/app/app_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Regresión: cada regreso a la app debe notificar, no solo el primero.
void main() {
  testWidgets('appResumed notifica en cada regreso a la app', (tester) async {
    final container = ProviderContainer.test();
    var notifications = 0;
    container.listen(appResumedProvider, (_, _) => notifications++);
    await tester.pump();

    for (var i = 0; i < 3; i++) {
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pump();
    }

    expect(notifications, 3);
  });
}
