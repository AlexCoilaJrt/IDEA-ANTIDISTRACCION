/// Reglas de la salida con costo (CLAUDE.md §7).
abstract final class ExitCost {
  /// Escalón 1: espera con cuenta regresiva.
  static const waitDuration = Duration(seconds: 60);

  /// Escalón 2: largo mínimo del motivo.
  static const minReasonLength = 150;

  static const lastStep = 3;

  static bool reasonIsValid(String reason) =>
      reason.trim().length >= minReasonLength;
}
