import 'dart:typed_data';

import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Grilla de métricas cuyas filas crecen con el contenido (texto grande).
class StatGrid extends StatelessWidget {
  const new({required this.columns, required this.children, super.key});

  final int columns;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i += columns) {
      final cells = <Widget>[];
      for (var c = 0; c < columns; c++) {
        if (c > 0) cells.add(const SizedBox(width: AppSpacing.sm));
        final index = i + c;
        cells.add(
          Expanded(
            child: index < children.length
                ? children[index]
                : const SizedBox.shrink(),
          ),
        );
      }
      if (rows.isNotEmpty) rows.add(const SizedBox(height: AppSpacing.sm));
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cells,
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}

/// Fila con interruptor para permitir o bloquear una app.
class AppToggleTile extends StatelessWidget {
  const new({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
    this.subtitle,
    this.icon,
  });

  final String label;
  final String? subtitle;
  final Uint8List? icon;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      subtitle: subtitle == null ? null : Text(subtitle!),
      secondary: SizedBox.square(
        dimension: AppSizes.appIcon,
        child: icon == null
            ? Icon(Icons.android, color: scheme.onSurfaceVariant)
            : ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.sm),
                child: Image.memory(icon!, gaplessPlayback: true),
              ),
      ),
    );
  }
}
