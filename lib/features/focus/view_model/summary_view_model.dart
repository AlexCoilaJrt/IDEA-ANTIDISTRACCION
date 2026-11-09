import 'package:enfoque/app/app_state.dart';
import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'summary_view_model.g.dart';

/// Resumen de la sesión recién terminada.
@riverpod
class SummaryViewModel extends _$SummaryViewModel {
  @override
  Future<FocusSession> build(int sessionId) async {
    final result = await ref.read(sessionRepositoryProvider).getById(sessionId);
    return switch (result) {
      Ok(:final value) => value,
      Failure(:final error, :final stackTrace) => Error.throwWithStackTrace(
        error,
        stackTrace ?? StackTrace.current,
      ),
    };
  }

  void close() => ref.read(finishedSessionProvider.notifier).clear();
}
