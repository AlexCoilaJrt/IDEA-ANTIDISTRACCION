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
            _component('Marca y estado', {
              'Cabecera': (_) =>
                  const BrandHeader(title: 'Enfoque', section: 'Inicio'),
              'Racha': (_) => const StreakChip(
                label: '12 d',
                semanticsLabel: '12 días de racha',
              ),
              'Píldoras': (_) => const Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  StatusPill(
                    label: 'Bloqueo activo',
                    color: Color(0xFF3DDBB4),
                    icon: Icons.lock_outline,
                  ),
                  StatusPill(
                    label: 'Cálculo diferencial',
                    color: Color(0xFFC1C1FF),
                    dot: true,
                    uppercase: true,
                  ),
                  SubjectTag(label: 'Cálculo', filled: true),
                  SubjectTag(label: 'Física'),
                ],
              ),
            }),
            _component('MetricTile / StatGrid', {
              'Hoy': (_) => const StatGrid(
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
                  ),
                  MetricTile(
                    icon: Icons.shield_outlined,
                    value: '0',
                    label: 'salidas',
                    color: Color(0xFF3DDBB4),
                  ),
                ],
              ),
            }),
            _component('Gráficos', {
              'Semana': (_) => const WeekBars(
                values: [40, 90, 30, 120, 0, 0, 0],
                labels: ['L', 'M', 'X', 'J', 'V', 'S', 'D'],
                highlight: 3,
                semanticsLabel: 'Esta semana',
              ),
              'Barras por materia': (_) => const StackedBarChart(
                bars: [
                  [
                    (color: Color(0xFF3B82F6), value: 50),
                    (color: Color(0xFF8B5CF6), value: 30),
                  ],
                  [(color: Color(0xFF10B981), value: 70)],
                  [],
                ],
                labels: ['L', 'M', 'X'],
                semanticsLabel: 'Horas',
              ),
              'Dona': (_) => const SubjectDonut(
                slices: [
                  (color: Color(0xFF8B5CF6), value: 45),
                  (color: Color(0xFF3B82F6), value: 30),
                  (color: Color(0xFF10B981), value: 25),
                ],
                centerValue: '3',
                centerLabel: 'materias',
                semanticsLabel: 'Por materia',
              ),
              'Calendario': (_) => MonthCalendar(
                month: DateTime(2026, 11),
                today: DateTime(2026, 11, 18),
                minutesByDay: {
                  for (var d = 1; d <= 18; d++)
                    DateTime(2026, 11, d): (d * 23) % 200,
                },
                weekdayInitials: const ['L', 'M', 'X', 'J', 'V', 'S', 'D'],
                lessLabel: 'Menos tiempo',
                moreLabel: 'Más de 3 h',
                semanticsLabel: 'Consistencia',
              ),
            }),
            _component('Bienvenida', {
              'Ilustración': (_) => const OnboardingIllustration(
                icon: Icons.eco,
                accent: Color(0xFF3DDBB4),
              ),
              'Puntos': (_) => const PageDots(count: 3, index: 1),
              'Bloques': (_) => const BlockSegments(total: 4, done: 1),
            }),
            _component('AppBubble', {
              'Apps permitidas': (_) => Row(
                children: [
                  AppBubble(label: 'Calculadora', onTap: () {}),
                  AppBubble(label: 'PDF Lector', onTap: () {}),
                ],
              ),
            }),
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
              'Menta': (_) => FocusButton(
                label: 'Volver a estudiar',
                icon: Icons.play_arrow_rounded,
                variant: FocusButtonVariant.mint,
                onPressed: () {},
              ),
              'Peligro': (_) => FocusButton(
                label: 'Salir y perder la racha',
                variant: FocusButtonVariant.danger,
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
