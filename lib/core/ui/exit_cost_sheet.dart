import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

/// Contenido de la hoja "Salir antes" con sus tres escalones. No guarda
/// estado: el ViewModel decide el escalón, la cuenta y si se puede seguir.
class ExitCostSheet extends StatelessWidget {
  const new({
    required this.step,
    required this.secondsLeft,
    required this.reasonLength,
    required this.minReasonLength,
    required this.onReasonChanged,
    required this.onContinue,
    required this.onConfirmExit,
    required this.onKeepStudying,
    super.key,
    this.busy = false,
  });

  /// 1, 2 o 3.
  final int step;
  final int secondsLeft;
  final int reasonLength;
  final int minReasonLength;
  final ValueChanged<String> onReasonChanged;

  /// `null` mientras no se pueda avanzar.
  final VoidCallback? onContinue;
  final VoidCallback onConfirmExit;
  final VoidCallback onKeepStudying;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final away = context.semanticColors.away;

    final body = switch (step) {
      1 => Column(
        children: [
          Text(l10n.exitStep1Body, textAlign: TextAlign.center),
          const SizedBox(height: AppSpacing.lg),
          Semantics(
            liveRegion: true,
            child: Text(
              l10n.exitStep1Countdown(secondsLeft),
              style: theme.textTheme.headlineSmall,
            ),
          ),
        ],
      ),
      2 => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.exitStep2Body(minReasonLength)),
          const SizedBox(height: AppSpacing.md),
          TextField(
            autofocus: true,
            minLines: 4,
            maxLines: 8,
            onChanged: onReasonChanged,
            decoration: InputDecoration(hintText: l10n.exitStep2Hint),
          ),
          const SizedBox(height: AppSpacing.xs),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              l10n.exitStep2Counter(reasonLength, minReasonLength),
              style: theme.textTheme.labelSmall,
            ),
          ),
        ],
      ),
      _ => Text(
        l10n.exitStep3Body,
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyLarge?.copyWith(color: away),
      ),
    };

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.xl,
        right: AppSpacing.xl,
        bottom: MediaQuery.viewInsetsOf(context).bottom + AppSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.exitStep(step),
            style: theme.textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.exitTitle,
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          body,
          const SizedBox(height: AppSpacing.xl),
          FilledButton(
            onPressed: onKeepStudying,
            child: Text(l10n.exitKeepStudying),
          ),
          const SizedBox(height: AppSpacing.sm),
          if (step < 3)
            OutlinedButton(
              onPressed: onContinue,
              child: Text(l10n.commonContinue),
            )
          else
            OutlinedButton(
              style: OutlinedButton.styleFrom(foregroundColor: away),
              onPressed: busy ? null : onConfirmExit,
              child: Text(l10n.exitConfirm),
            ),
        ],
      ),
    );
  }
}
