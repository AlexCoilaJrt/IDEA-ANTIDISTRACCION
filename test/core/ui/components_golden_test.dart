// Goldens de los componentes en claro y oscuro.
// Regenerar con: flutter test --update-goldens test/core/ui
import 'package:enfoque/core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers.dart';

void main() {
  final components = <String, Widget>{
    'focus_button': Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FocusButton(
          label: 'Empezar sesión',
          icon: Icons.play_arrow,
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        FocusButton(
          label: 'Secundario',
          variant: FocusButtonVariant.secondary,
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        const FocusButton(label: 'Cargando', loading: true, onPressed: null),
      ],
    ),
    'focus_timer_ring': const FocusTimerRing(
      progress: 0.4,
      timeText: '15:00',
      label: 'Enfoque',
      caption: 'Bloque 1 de 2',
      color: Colors.green,
      semanticsLabel: 'Enfoque, quedan 15:00',
    ),
    'streak_badge': const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreakBadge(label: '5 días', active: true),
        SizedBox(width: 8),
        StreakBadge(label: 'Sin racha', active: false),
      ],
    ),
    'stat_grid': const StatGrid(
      columns: 2,
      children: [
        StatTile(label: 'Hoy', value: '45 min', icon: Icons.today),
        StatTile(label: 'Mejor racha', value: '12 días', icon: Icons.star),
        StatTile(label: 'Sesiones', value: '30'),
      ],
    ),
    'session_card': const SessionCard(
      title: 'lun 9 nov, 09:00',
      minutesLabel: '25 min',
      statusLabel: 'Completada',
      statusColor: Colors.green,
      detail: 'Sin intentos de distracción',
    ),
    'permission_step_card': Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PermissionStepCard(
          title: 'Acceso a datos de uso',
          body: 'Para saber qué app está abierta.',
          badge: 'Obligatorio',
          state: PermissionStepState.pending,
          actionLabel: 'Activar',
          grantedLabel: 'Activado',
          icon: Icons.query_stats,
          onRequest: () {},
        ),
        const SizedBox(height: 8),
        PermissionStepCard(
          title: 'Notificaciones',
          body: 'Aviso fijo con el tiempo.',
          badge: 'Recomendado',
          state: PermissionStepState.granted,
          actionLabel: 'Activar',
          grantedLabel: 'Activado',
          icon: Icons.notifications,
          onRequest: () {},
        ),
      ],
    ),
    'app_toggle_tile': AppToggleTile(
      label: 'Calculadora',
      value: true,
      onChanged: (_) {},
    ),
    'heatmap_calendar': HeatmapCalendar(
      minutesByDay: {
        for (var i = 0; i < 40; i += 2) DateTime(2026, 11, 9 - i): (i * 7) % 60,
      },
      endDay: DateTime(2026, 11, 9),
      goalMinutes: 25,
      semanticsLabel: 'Calendario',
    ),
    'empty_state': const EmptyState(
      title: 'Aún no hay sesiones',
      message: 'Termina tu primera sesión.',
    ),
    'error_state': ErrorState(
      message: 'Algo salió mal.',
      retryLabel: 'Reintentar',
      onRetry: () {},
    ),
    for (final step in [1, 2, 3])
      'exit_cost_sheet_$step': ExitCostSheet(
        step: step,
        secondsLeft: step == 1 ? 42 : 0,
        reasonLength: 80,
        minReasonLength: 150,
        onReasonChanged: (_) {},
        onContinue: null,
        onConfirmExit: () {},
        onKeepStudying: () {},
      ),
  };

  for (final MapEntry(key: name, value: widget) in components.entries) {
    for (final brightness in Brightness.values) {
      testWidgets('$name ${brightness.name}', (tester) async {
        tester.view
          ..physicalSize = const Size(400, 640)
          ..devicePixelRatio = 1;
        addTearDown(tester.view.reset);
        await tester.pumpWidget(themed(widget, brightness: brightness));
        await tester.pump(const Duration(milliseconds: 500));
        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile('goldens/${name}_${brightness.name}.png'),
        );
      });
    }
  }
}
