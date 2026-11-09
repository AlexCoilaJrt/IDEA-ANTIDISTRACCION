// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Emite cada vez que la app vuelve a primer plano.
///
/// Emite un contador y no `void`: Riverpod descarta valores repetidos, así
/// que con `null` solo se notificaba el primer regreso.

@ProviderFor(appResumed)
final appResumedProvider = AppResumedProvider._();

/// Emite cada vez que la app vuelve a primer plano.
///
/// Emite un contador y no `void`: Riverpod descarta valores repetidos, así
/// que con `null` solo se notificaba el primer regreso.

final class AppResumedProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  /// Emite cada vez que la app vuelve a primer plano.
  ///
  /// Emite un contador y no `void`: Riverpod descarta valores repetidos, así
  /// que con `null` solo se notificaba el primer regreso.
  AppResumedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appResumedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appResumedHash();

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    return appResumed(ref);
  }
}

String _$appResumedHash() => r'7033612431642f62e288a7ee8ff5633224701744';

/// Sesión recién cerrada cuyo resumen se debe mostrar.

@ProviderFor(FinishedSession)
final finishedSessionProvider = FinishedSessionProvider._();

/// Sesión recién cerrada cuyo resumen se debe mostrar.
final class FinishedSessionProvider
    extends $NotifierProvider<FinishedSession, int?> {
  /// Sesión recién cerrada cuyo resumen se debe mostrar.
  FinishedSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'finishedSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$finishedSessionHash();

  @$internal
  @override
  FinishedSession create() => FinishedSession();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$finishedSessionHash() => r'85f1eecaddca42072d0f7c5cb6bc7eb43ff50dd7';

/// Sesión recién cerrada cuyo resumen se debe mostrar.

abstract class _$FinishedSession extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Mantiene drift y el motor nativo de acuerdo: al abrir la app, al volver a
/// primer plano y cuando el motor avisa que terminó o se interrumpió.

@ProviderFor(SessionSupervisor)
final sessionSupervisorProvider = SessionSupervisorProvider._();

/// Mantiene drift y el motor nativo de acuerdo: al abrir la app, al volver a
/// primer plano y cuando el motor avisa que terminó o se interrumpió.
final class SessionSupervisorProvider
    extends $NotifierProvider<SessionSupervisor, void> {
  /// Mantiene drift y el motor nativo de acuerdo: al abrir la app, al volver a
  /// primer plano y cuando el motor avisa que terminó o se interrumpió.
  SessionSupervisorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionSupervisorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionSupervisorHash();

  @$internal
  @override
  SessionSupervisor create() => SessionSupervisor();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$sessionSupervisorHash() => r'7cd4b2aa51986bb8f1260be448d1004cdd483cd1';

/// Mantiene drift y el motor nativo de acuerdo: al abrir la app, al volver a
/// primer plano y cuando el motor avisa que terminó o se interrumpió.

abstract class _$SessionSupervisor extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Eventos del motor nativo como provider.

@ProviderFor(blockerEvents)
final blockerEventsProvider = BlockerEventsProvider._();

/// Eventos del motor nativo como provider.

final class BlockerEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<BlockerEvent>,
          BlockerEvent,
          Stream<BlockerEvent>
        >
    with $FutureModifier<BlockerEvent>, $StreamProvider<BlockerEvent> {
  /// Eventos del motor nativo como provider.
  BlockerEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'blockerEventsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$blockerEventsHash();

  @$internal
  @override
  $StreamProviderElement<BlockerEvent> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<BlockerEvent> create(Ref ref) {
    return blockerEvents(ref);
  }
}

String _$blockerEventsHash() => r'f32d0aa7780c2d683f7a0dbaa95153ec50ca38fe';
