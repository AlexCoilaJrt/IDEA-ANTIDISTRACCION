import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/features/onboarding/view_model/permissions_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PermissionsUiState state({
    bool usage = false,
    bool overlay = false,
    bool notifications = false,
    bool battery = false,
    Set<PermissionKind> skipped = const {},
    PermissionKind? selected,
  }) => PermissionsUiState(
    permissions: AppPermissions(
      usageAccess: usage,
      overlay: overlay,
      notifications: notifications,
      batteryOptimization: battery,
    ),
    skipped: skipped,
    selected: selected,
  );

  test('empieza por los obligatorios y avanza al activarlos', () {
    expect(state().current, PermissionKind.usageAccess);
    expect(state(usage: true).current, PermissionKind.overlay);
    expect(state(usage: true).stepNumber, 2);
    expect(
      state(usage: true, overlay: true).current,
      PermissionKind.notifications,
    );
  });

  test('los omitidos se saltan y al final no queda paso', () {
    final s = state(
      usage: true,
      overlay: true,
      skipped: {
        PermissionKind.notifications,
        PermissionKind.batteryOptimization,
      },
    );
    expect(s.current, isNull);
    expect(s.canContinue, isTrue);
  });

  test(
    'elegir un paso desde el resumen tiene prioridad si sigue pendiente',
    () {
      expect(
        state(selected: PermissionKind.batteryOptimization).current,
        PermissionKind.batteryOptimization,
      );
      // Si ya está activado, vuelve al orden normal.
      expect(
        state(
          battery: true,
          selected: PermissionKind.batteryOptimization,
        ).current,
        PermissionKind.usageAccess,
      );
    },
  );

  test('solo se puede continuar con los dos obligatorios', () {
    expect(state(usage: true).canContinue, isFalse);
    expect(state(usage: true, overlay: true).canContinue, isTrue);
    expect(PermissionsUiState.isRequired(PermissionKind.overlay), isTrue);
    expect(
      PermissionsUiState.isRequired(PermissionKind.notifications),
      isFalse,
    );
  });
}
