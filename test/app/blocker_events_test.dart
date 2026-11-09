import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/data/repositories/blocker_repository.dart';
import 'package:enfoque/data/services/blocker/blocker_service.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Regresión: dos eventos iguales seguidos (p. ej. tocar "Salir antes" dos
/// veces) deben llegar los dos. Usa el servicio y el repositorio reales.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('los eventos repetidos del motor no se pierden', () async {
    final service = BlockerService();
    addTearDown(service.dispose);
    final container = ProviderContainer.test(
      overrides: [
        blockerRepositoryProvider.overrideWithValue(
          BlockerRepositoryImpl(service),
        ),
      ],
    );
    final received = <BlockerEvent>[];
    container.listen(blockerEventsProvider, (_, next) {
      if (next.value case final e?) received.add(e);
    });
    await Future<void>.delayed(Duration.zero);

    service
      ..onEarlyExitRequested()
      ..onEarlyExitRequested()
      ..onStartRequested()
      ..onStartRequested();
    await Future<void>.delayed(Duration.zero);

    expect(received, hasLength(4));
  });
}
