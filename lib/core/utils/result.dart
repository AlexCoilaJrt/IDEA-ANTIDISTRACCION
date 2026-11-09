/// Resultado de una operación: éxito con un valor o error.
///
/// Los repositorios devuelven `Result` en lugar de lanzar excepciones hacia
/// la UI (ver CLAUDE.md §4).
sealed class Result<T> {
  const new();

  const factory ok(T value) = Ok<T>;

  const factory error(Object error, [StackTrace? stackTrace]) = Failure<T>;

  bool get isOk => this is Ok<T>;

  /// Valor si fue éxito; `null` si fue error.
  T? get valueOrNull => switch (this) {
    Ok<T>(:final value) => value,
    Failure<T>() => null,
  };
}

final class Ok<T> extends Result<T> {
  const new(this.value);

  final T value;

  @override
  String toString() => 'Result.ok($value)';
}

final class Failure<T> extends Result<T> {
  const new(this.error, [this.stackTrace]);

  final Object error;
  final StackTrace? stackTrace;

  @override
  String toString() => 'Result.error($error)';
}

/// Ejecuta [body] y convierte cualquier excepción en [Failure].
Future<Result<T>> guard<T>(Future<T> Function() body) async {
  try {
    return Result.ok(await body());
  } on Object catch (error, stackTrace) {
    return Result.error(error, stackTrace);
  }
}
