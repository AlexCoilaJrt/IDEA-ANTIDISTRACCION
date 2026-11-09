import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

/// Pestaña Salas: se implementa en la fase 3.
class RoomsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return FocusScaffold(
      title: l10n.navRooms,
      scrollable: false,
      body: EmptyState(
        title: l10n.roomsComingTitle,
        message: l10n.roomsComingBody,
        icon: Icons.groups_outlined,
      ),
    );
  }
}
