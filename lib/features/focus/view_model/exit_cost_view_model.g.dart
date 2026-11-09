// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exit_cost_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// "Salir antes" con costo: espera de 60 s, motivo y confirmación.

@ProviderFor(ExitCostViewModel)
final exitCostViewModelProvider = ExitCostViewModelFamily._();

/// "Salir antes" con costo: espera de 60 s, motivo y confirmación.
final class ExitCostViewModelProvider
    extends $NotifierProvider<ExitCostViewModel, ExitCostState> {
  /// "Salir antes" con costo: espera de 60 s, motivo y confirmación.
  ExitCostViewModelProvider._({
    required ExitCostViewModelFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'exitCostViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exitCostViewModelHash();

  @override
  String toString() {
    return r'exitCostViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ExitCostViewModel create() => ExitCostViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExitCostState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExitCostState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExitCostViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exitCostViewModelHash() => r'62309af489d9f4f923c4a895a22b2b5d033cc2f3';

/// "Salir antes" con costo: espera de 60 s, motivo y confirmación.

final class ExitCostViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ExitCostViewModel,
          ExitCostState,
          ExitCostState,
          ExitCostState,
          int
        > {
  ExitCostViewModelFamily._()
    : super(
        retry: null,
        name: r'exitCostViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// "Salir antes" con costo: espera de 60 s, motivo y confirmación.

  ExitCostViewModelProvider call(int sessionId) =>
      ExitCostViewModelProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'exitCostViewModelProvider';
}

/// "Salir antes" con costo: espera de 60 s, motivo y confirmación.

abstract class _$ExitCostViewModel extends $Notifier<ExitCostState> {
  late final _$args = ref.$arg as int;
  int get sessionId => _$args;

  ExitCostState build(int sessionId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ExitCostState, ExitCostState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ExitCostState, ExitCostState>,
              ExitCostState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
