import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

/// Pestaña Horario: se implementa en la fase 2.
class ScheduleScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return FocusScaffold(
      title: l10n.navSchedule,
      scrollable: false,
      body: EmptyState(
        title: l10n.scheduleComingTitle,
        message: l10n.scheduleComingBody,
        icon: Icons.calendar_month_outlined,
      ),
    );
  }
}
