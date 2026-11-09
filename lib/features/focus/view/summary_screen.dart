import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/features/focus/view_model/summary_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Resumen al terminar una sesión.
class SummaryScreen extends ConsumerWidget {
  const new({required this.sessionId, super.key});

  final int sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final provider = summaryViewModelProvider(sessionId);
    final state = ref.watch(provider);
    void close() => ref.read(provider.notifier).close();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) close();
      },
      child: FocusScaffold(
        body: switch (state) {
          AsyncData(:final value) => _SummaryBody(session: value),
          AsyncError() => ErrorState(
            message: l10n.commonGenericError,
            retryLabel: l10n.commonRetry,
            onRetry: () => ref.invalidate(provider),
          ),
          _ => LoadingState(label: l10n.commonLoading),
        },
        bottom: FocusButton(label: l10n.summaryBackHome, onPressed: close),
      ),
    );
  }
}

class _SummaryBody extends StatelessWidget {
  const new({required this.session});

  final FocusSession session;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.semanticColors;
    final (title, icon, color) = switch (session.outcome) {
      SessionOutcome.earlyExit => (
        l10n.summaryEarlyExitTitle,
        Icons.logout,
        colors.away,
      ),
      SessionOutcome.interrupted => (
        l10n.summaryInterruptedTitle,
        Icons.warning_amber_rounded,
        colors.onBreak,
      ),
      _ => (l10n.summaryCompletedTitle, Icons.celebration, colors.focus),
    };

    return Column(
      children: [
        const Gap(AppSpacing.xxxl),
        Icon(icon, size: AppSizes.iconXl, color: color),
        const Gap(AppSpacing.lg),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const Gap(AppSpacing.xxl),
        StatGrid(
          columns: 3,
          children: [
            StatTile(
              label: l10n.summaryFocused,
              value: '${session.focusedMinutes}',
              icon: Icons.timer_outlined,
              color: colors.focus,
            ),
            StatTile(
              label: l10n.summaryPoints,
              value: '${session.points}',
              icon: Icons.star_outline,
            ),
            StatTile(
              label: l10n.summaryDistractions,
              value: '${session.distractionCount}',
              icon: Icons.block,
              color: colors.away,
            ),
          ],
        ),
      ],
    );
  }
}
