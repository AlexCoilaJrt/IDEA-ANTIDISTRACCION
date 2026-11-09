// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_editor_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Crear o editar un bloque del horario. `blockId == 0` es uno nuevo.

@ProviderFor(BlockEditorViewModel)
final blockEditorViewModelProvider = BlockEditorViewModelFamily._();

/// Crear o editar un bloque del horario. `blockId == 0` es uno nuevo.
final class BlockEditorViewModelProvider
    extends $AsyncNotifierProvider<BlockEditorViewModel, BlockEditorState> {
  /// Crear o editar un bloque del horario. `blockId == 0` es uno nuevo.
  BlockEditorViewModelProvider._({
    required BlockEditorViewModelFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'blockEditorViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$blockEditorViewModelHash();

  @override
  String toString() {
    return r'blockEditorViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BlockEditorViewModel create() => BlockEditorViewModel();

  @override
  bool operator ==(Object other) {
    return other is BlockEditorViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$blockEditorViewModelHash() =>
    r'f7080aa840884801feae47d9653399a400d52092';

/// Crear o editar un bloque del horario. `blockId == 0` es uno nuevo.

final class BlockEditorViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          BlockEditorViewModel,
          AsyncValue<BlockEditorState>,
          BlockEditorState,
          FutureOr<BlockEditorState>,
          int
        > {
  BlockEditorViewModelFamily._()
    : super(
        retry: null,
        name: r'blockEditorViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Crear o editar un bloque del horario. `blockId == 0` es uno nuevo.

  BlockEditorViewModelProvider call(int blockId) =>
      BlockEditorViewModelProvider._(argument: blockId, from: this);

  @override
  String toString() => r'blockEditorViewModelProvider';
}

/// Crear o editar un bloque del horario. `blockId == 0` es uno nuevo.

abstract class _$BlockEditorViewModel extends $AsyncNotifier<BlockEditorState> {
  late final _$args = ref.$arg as int;
  int get blockId => _$args;

  FutureOr<BlockEditorState> build(int blockId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<BlockEditorState>, BlockEditorState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BlockEditorState>, BlockEditorState>,
              AsyncValue<BlockEditorState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
