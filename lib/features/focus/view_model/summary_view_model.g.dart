// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Resumen de la sesión recién terminada.

@ProviderFor(SummaryViewModel)
final summaryViewModelProvider = SummaryViewModelFamily._();

/// Resumen de la sesión recién terminada.
final class SummaryViewModelProvider
    extends $AsyncNotifierProvider<SummaryViewModel, FocusSession> {
  /// Resumen de la sesión recién terminada.
  SummaryViewModelProvider._({
    required SummaryViewModelFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'summaryViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$summaryViewModelHash();

  @override
  String toString() {
    return r'summaryViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SummaryViewModel create() => SummaryViewModel();

  @override
  bool operator ==(Object other) {
    return other is SummaryViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$summaryViewModelHash() => r'0d56da54d5e423d3a06ab17b8f371a1d1de883d1';

/// Resumen de la sesión recién terminada.

final class SummaryViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          SummaryViewModel,
          AsyncValue<FocusSession>,
          FocusSession,
          FutureOr<FocusSession>,
          int
        > {
  SummaryViewModelFamily._()
    : super(
        retry: null,
        name: r'summaryViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Resumen de la sesión recién terminada.

  SummaryViewModelProvider call(int sessionId) =>
      SummaryViewModelProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'summaryViewModelProvider';
}

/// Resumen de la sesión recién terminada.

abstract class _$SummaryViewModel extends $AsyncNotifier<FocusSession> {
  late final _$args = ref.$arg as int;
  int get sessionId => _$args;

  FutureOr<FocusSession> build(int sessionId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<FocusSession>, FocusSession>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FocusSession>, FocusSession>,
              AsyncValue<FocusSession>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
