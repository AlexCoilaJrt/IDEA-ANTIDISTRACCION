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
      color: Color(0xFF3DDBB4),
      glow: true,
      semanticsLabel: 'Enfoque, quedan 15:00',
    ),
    'streak_chip_and_pills': const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreakChip(label: '12 d', semanticsLabel: '12 días de racha'),
        SizedBox(height: 8),
        StatusPill(
          label: 'Bloqueo activo',
          color: Color(0xFF3DDBB4),
          icon: Icons.lock_outline,
        ),
        SizedBox(height: 8),
        StatusPill(
          label: 'Cálculo',
          color: Color(0xFFC1C1FF),
          dot: true,
          uppercase: true,
        ),
        SizedBox(height: 8),
        SubjectTag(label: 'Cálculo', filled: true),
        SizedBox(height: 8),
        SubjectTag(label: 'Física'),
      ],
    ),
    'brand_header': const BrandHeader(title: 'Enfoque', section: 'Inicio'),
    'metric_grid': const StatGrid(
      columns: 3,
      children: [
        MetricTile(
          icon: Icons.schedule,
          value: '1h 45m',
          label: 'concentrado',
          color: Color(0xFF3DDBB4),
        ),
        MetricTile(
          icon: Icons.done_all,
          value: '3',
          label: 'sesiones',
          color: Color(0xFFC1C1FF),
          badge: '+18%',
        ),
        MetricTile(
          icon: Icons.shield_outlined,
          value: '0',
          label: 'salidas',
          color: Color(0xFF3DDBB4),
        ),
      ],
    ),
    'week_bars': const WeekBars(
      values: [40, 90, 30, 120, 0, 0, 0],
      labels: ['L', 'M', 'X', 'J', 'V', 'S', 'D'],
      highlight: 3,
      semanticsLabel: 'Esta semana',
    ),
    'stacked_bar_chart': const StackedBarChart(
      bars: [
        [
          (color: Color(0xFF3B82F6), value: 50),
          (color: Color(0xFF8B5CF6), value: 30),
        ],
        [(color: Color(0xFF3B82F6), value: 20)],
        [],
        [(color: Color(0xFF10B981), value: 90)],
      ],
      labels: ['L', 'M', 'X', 'J'],
      highlight: 3,
      semanticsLabel: 'Horas',
    ),
    'subject_donut': const SubjectDonut(
      slices: [
        (color: Color(0xFF8B5CF6), value: 45),
        (color: Color(0xFF3B82F6), value: 30),
        (color: Color(0xFF10B981), value: 25),
      ],
      centerValue: '3',
      centerLabel: 'materias',
      semanticsLabel: 'Por materia',
    ),
    'block_segments_and_dots': const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlockSegments(total: 4, done: 1),
        SizedBox(height: 16),
        PageDots(count: 3, index: 0),
      ],
    ),
    'onboarding_illustration': const OnboardingIllustration(
      icon: Icons.eco,
      accent: Color(0xFF3DDBB4),
    ),
    'app_bubble': Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBubble(label: 'Calculadora', onTap: () {}),
        AppBubble(label: 'PDF', onTap: () {}),
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
    'month_calendar': MonthCalendar(
      month: DateTime(2026, 11),
      today: DateTime(2026, 11, 18),
      minutesByDay: {
        for (var d = 1; d <= 18; d++) DateTime(2026, 11, d): (d * 23) % 200,
      },
      weekdayInitials: const ['L', 'M', 'X', 'J', 'V', 'S', 'D'],
      lessLabel: 'Menos tiempo',
      moreLabel: 'Más de 3 h',
      semanticsLabel: 'Consistencia',
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
          ..physicalSize = const Size(412, 760)
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
