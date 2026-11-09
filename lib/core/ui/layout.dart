import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Scaffold base: ancho máximo, márgenes y área segura comunes.
class FocusScaffold extends StatelessWidget {
  const new({
    required this.body,
    super.key,
    this.title,
    this.actions,
    this.bottom,
    this.leading,
    this.header,
    this.scrollable = true,
  });

  /// Cabecera propia (p. ej. `BrandHeader`) en lugar de la AppBar.
  final Widget? header;

  final String? title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? leading;

  /// Contenido fijo abajo (por ejemplo, el botón principal).
  final Widget? bottom;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: body,
    );
    return Scaffold(
      appBar: title == null && actions == null && leading == null
          ? null
          : AppBar(
              title: title == null ? null : Text(title!),
              actions: actions,
              leading: leading,
            ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSizes.maxContentWidth,
            ),
            child: Column(
              children: [
                ?header,
                Expanded(
                  child: scrollable
                      ? SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSpacing.lg,
                          ),
                          child: content,
                        )
                      : content,
                ),
                if (bottom != null)
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: bottom,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Separador vertical de la escala de espaciado.
class Gap extends StatelessWidget {
  const new(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(height: size, width: size);
}

/// Título de sección.
class SectionTitle extends StatelessWidget {
  const new(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: AppSpacing.xl, bottom: AppSpacing.sm),
    child: Semantics(
      header: true,
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    ),
  );
}
