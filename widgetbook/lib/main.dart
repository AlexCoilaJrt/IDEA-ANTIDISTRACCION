// Catálogo de componentes de `lib/core/ui/`.
// Ejecutar: cd widgetbook && flutter run -d chrome   (o -d macos / un celular)
import 'package:enfoque/app/theme/app_theme.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() => runApp(const EnfoqueWidgetbook());

class EnfoqueWidgetbook extends StatelessWidget {
  const EnfoqueWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Oscuro', data: AppTheme.dark()),
            WidgetbookTheme(name: 'Claro', data: AppTheme.light()),
          ],
        ),
        LocalizationAddon(
          locales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
        ),
        TextScaleAddon(),
        AlignmentAddon(),
      ],
      directories: [
        WidgetbookCategory(
          name: 'Componentes',
          children: [
            _component('FocusButton', {
              'Principal': (_) => FocusButton(
                label: 'Empezar sesión',
                icon: Icons.play_arrow_rounded,
                onPressed: () {},
              ),
              'Secundario': (_) => FocusButton(
                label: 'Apps permitidas',
                variant: FocusButtonVariant.secondary,
                onPressed: () {},
              ),
              'Cargando': (_) => const FocusButton(
                label: 'Empezar sesión',
                loading: true,
                onPressed: null,
              ),
            }),
            _component('FocusTimerRing', {
              'Enfoque': (_) => const FocusTimerRing(
                progress: 0.35,
                timeText: '16:15',
                label: 'Enfoque',
                caption: 'Bloque 1 de 2',
                color: Color(0xFF5FD99A),
                semanticsLabel: 'Enfoque, quedan 16:15',
              ),
              'Descanso': (_) => const FocusTimerRing(
                progress: 0.8,
                timeText: '01:00',
                label: 'Descanso',
                color: Color(0xFFFFC56B),
                semanticsLabel: 'Descanso, queda 1 minuto',
              ),
            }),
            _component('StreakBadge', {
              'Activa': (_) => const StreakBadge(label: '5 días', active: true),
              'Pendiente': (_) =>
                  const StreakBadge(label: '4 días', active: false),
            }),
            _component('StatTile / StatGrid', {
              'Grilla': (_) => const StatGrid(
                columns: 2,
                children: [
                  StatTile(label: 'Hoy', value: '45 min', icon: Icons.today),
                  StatTile(
                    label: 'Racha actual',
                    value: '5 días',
                    icon: Icons.local_fire_department,
                  ),
                  StatTile(label: 'Sesiones completas', value: '30'),
                ],
              ),
            }),
            _component('SessionCard', {
              'Completada': (_) => const SessionCard(
                title: 'lun 9 nov, 09:00',
                minutesLabel: '25 min',
                statusLabel: 'Completada',
                statusColor: Color(0xFF5FD99A),
                detail: 'Sin intentos de distracción',
              ),
              'Salida anticipada': (_) => const SessionCard(
                title: 'lun 9 nov, 15:00',
                minutesLabel: '12 min',
                statusLabel: 'Salida anticipada',
                statusColor: Color(0xFFFF8A75),
              ),
            }),
            _component('AppToggleTile', {
              'Permitida': (_) => AppToggleTile(
                label: 'Calculadora',
                value: true,
                onChanged: (_) {},
              ),
              'Bloqueada': (_) => AppToggleTile(
                label: 'Instagram',
                value: false,
                onChanged: (_) {},
              ),
            }),
            _component('PermissionGuideCard', {
              'Paso': (_) => SingleChildScrollView(
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
              'Resumen': (_) => const Column(
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
            }),
            _component('HeatmapCalendar', {
              '12 semanas': (_) => HeatmapCalendar(
                minutesByDay: {
                  for (var i = 0; i < 80; i++)
                    DateTime(2026, 11, 9 - i): (i * 13) % 70,
                },
                endDay: DateTime(2026, 11, 9),
                goalMinutes: 25,
                semanticsLabel: 'Últimas 12 semanas',
              ),
            }),
            _component('WeekBarChart', {
              '7 días': (_) => const WeekBarChart(
                values: [10, 30, 0, 55, 25, 40, 20],
                labels: ['mar', 'mié', 'jue', 'vie', 'sáb', 'dom', 'lun'],
                goalMinutes: 25,
                semanticsLabel: 'Minutos de los últimos 7 días',
              ),
            }),
            _component('ExitCostSheet', {
              for (final step in [1, 2, 3])
                'Escalón $step': (_) => ExitCostSheet(
                  step: step,
                  secondsLeft: step == 1 ? 42 : 0,
                  reasonLength: 80,
                  minReasonLength: 150,
                  onReasonChanged: (_) {},
                  onContinue: null,
                  onConfirmExit: () {},
                  onKeepStudying: () {},
                ),
            }),
            _component('EmptyState / ErrorState', {
              'Vacío': (_) => const EmptyState(
                title: 'Aún no hay sesiones',
                message:
                    'Cuando termines tu primera sesión, verás tu progreso.',
              ),
              'Error': (_) => ErrorState(
                message: 'Algo salió mal. Inténtalo de nuevo.',
                retryLabel: 'Reintentar',
                onRetry: () {},
              ),
            }),
          ],
        ),
      ],
    );
  }

  static WidgetbookComponent _component(
    String name,
    Map<String, Widget Function(BuildContext)> cases,
  ) => WidgetbookComponent(
    name: name,
    useCases: [
      for (final e in cases.entries)
        WidgetbookUseCase(
          name: e.key,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(16),
            child: e.value(context),
          ),
        ),
    ],
  );
}
