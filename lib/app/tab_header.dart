import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Cabecera de las pestañas con la racha real del usuario.
class TabHeader extends ConsumerWidget {
  const new({required this.section, super.key, this.actions = const []});

  final String section;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final days = ref.watch(streakSummaryProvider).value?.current ?? 0;
    return BrandHeader(
      title: l10n.appTitle,
      section: section,
      trailing: [
        StreakChip(
          label: l10n.streakChip(days),
          semanticsLabel: l10n.streakSemantics(days),
        ),
        ...actions,
      ],
    );
  }
}
