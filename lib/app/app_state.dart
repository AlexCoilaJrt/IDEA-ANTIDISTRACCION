import 'dart:async';

import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state.g.dart';

/// Emite cada vez que la app vuelve a primer plano.
@Riverpod(keepAlive: true)
Stream<void> appResumed(Ref ref) {
  final controller = StreamController<void>.broadcast();
  final listener = AppLifecycleListener(onResume: () => controller.add(null));
  ref.onDispose(() {
    listener.dispose();
    unawaited(controller.close());
  });
  return controller.stream;
}

/// Sesión recién cerrada cuyo resumen se debe mostrar.
@Riverpod(keepAlive: true)
class FinishedSession extends _$FinishedSession {
  @override
  int? build() => null;

  // ignore: use_setters_to_change_properties, es un comando del notifier.
  void show(int sessionId) => state = sessionId;

  void clear() => state = null;
}

/// Mantiene drift y el motor nativo de acuerdo: al abrir la app, al volver a
/// primer plano y cuando el motor avisa que terminó o se interrumpió.
@Riverpod(keepAlive: true)
class SessionSupervisor extends _$SessionSupervisor {
  @override
  void build() {
    ref
      ..listen(appResumedProvider, (_, _) => unawaited(reconcile()))
      ..listen(blockerEventsProvider, (_, next) {
        final event = next.value;
        if (event is BlockerSessionFinished ||
            event is BlockerSessionInterrupted) {
          unawaited(reconcile());
        }
      });
    unawaited(Future.microtask(reconcile));
  }

  Future<void> reconcile() async {
    final result = await ref.read(reconcileSessionUseCaseProvider).call();
    if (!ref.mounted) return;
    if (result case Ok(:final value?)) {
      ref.read(finishedSessionProvider.notifier).show(value.id);
    }
  }
}

/// Eventos del motor nativo como provider.
@Riverpod(keepAlive: true)
Stream<BlockerEvent> blockerEvents(Ref ref) =>
    ref.watch(blockerRepositoryProvider).events;
