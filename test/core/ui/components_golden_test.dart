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
    'permission_guide_card': SingleChildScrollView(
      child: PermissionGuideCard(
        icon: Icons.query_stats,
        title: 'Acceso a datos de uso',
        reason: 'Para saber qué app está abierta durante una sesión.',
        badge: 'Obligatorio',
        howToTitle: 'Qué vas a hacer',
        steps: const [
          'Toca «Abrir ajustes».',
          'Busca «Enfoque (local)» y tócala.',
          'Activa el interruptor.',
        ],
        safetyNote: 'Solo toca lo que se indica aquí.',
        primaryLabel: 'Abrir ajustes',
        onPrimary: () {},
        verifyLabel: 'Ya lo activé, verificar',
        onVerify: () {},
        help: const HelpExpansion(
          title: '¿Aparece «Ajuste restringido»?',
          body: 'Pasa en Android 13+.',
          steps: ['Abre la información de la app.'],
        ),
      ),
    ),
    'permission_status_row': const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PermissionStatusRow(
          icon: Icons.query_stats,
          title: 'Acceso a datos de uso',
          status: PermissionRowStatus.granted,
          statusLabel: 'Activado',
        ),
        PermissionStatusRow(
          icon: Icons.layers_outlined,
          title: 'Mostrar sobre otras apps',
          status: PermissionRowStatus.pending,
          statusLabel: 'Pendiente',
          selected: true,
        ),
        PermissionStatusRow(
          icon: Icons.battery_saver_outlined,
          title: 'Batería',
          status: PermissionRowStatus.skipped,
          statusLabel: 'Omitido',
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
