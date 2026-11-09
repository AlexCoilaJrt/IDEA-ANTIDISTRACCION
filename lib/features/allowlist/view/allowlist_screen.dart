import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/app/router.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/features/allowlist/view_model/allowlist_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AllowlistScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(allowlistViewModelProvider);
    final vm = ref.read(allowlistViewModelProvider.notifier);
    final onboardingDone =
        ref.watch(settingsStreamProvider).value?.onboardingDone ?? false;

    return FocusScaffold(
      title: l10n.allowlistTitle,
      scrollable: false,
      body: switch (state) {
        AsyncData(:final value) => _AllowlistBody(state: value),
        AsyncError() => ErrorState(
          message: l10n.commonGenericError,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(allowlistViewModelProvider),
        ),
        _ => LoadingState(label: l10n.commonLoading),
      },
      bottom: FocusButton(
        label: l10n.allowlistDone,
        onPressed: () async {
          if (onboardingDone) {
            context.pop();
          } else {
            await vm.finishOnboarding();
            if (context.mounted) context.go(Routes.home);
          }
        },
      ),
    );
  }
}

class _AllowlistBody extends ConsumerWidget {
  const new({required this.state});

  final AllowlistState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final vm = ref.read(allowlistViewModelProvider.notifier);
    final apps = state.visibleApps;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(AppSpacing.sm),
        Text(l10n.allowlistBody),
        const Gap(AppSpacing.md),
        TextField(
          onChanged: vm.search,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: l10n.allowlistSearch,
          ),
        ),
        const Gap(AppSpacing.sm),
        Text(
          l10n.allowlistCount(state.allowed.length),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Expanded(
          child: apps.isEmpty
              ? EmptyState(
                  title: l10n.allowlistEmpty,
                  message: '',
                  icon: Icons.search_off,
                )
              : ListView.builder(
                  itemCount: apps.length,
                  itemBuilder: (context, i) {
                    final app = apps[i];
                    return AppToggleTile(
                      label: app.label,
                      icon: app.icon,
                      value: state.allowed.contains(app.packageName),
                      onChanged: (v) => vm.toggle(app, allowed: v),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
