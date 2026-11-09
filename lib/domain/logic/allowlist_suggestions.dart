/// Sugiere apps permitidas por defecto: calculadora, diccionario, PDF y
/// teléfono.
abstract final class AllowlistSuggestions {
  static const _keywords = [
    'calculator',
    'calculadora',
    'calc',
    'dictionary',
    'diccionario',
    'pdf',
    'dialer',
    'phone',
    'contacts',
  ];

  static bool isSuggested(String packageName, String label) {
    final text = '${packageName.toLowerCase()} ${label.toLowerCase()}';
    return _keywords.any(text.contains);
  }
}
