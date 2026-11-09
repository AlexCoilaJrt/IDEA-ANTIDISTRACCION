import 'package:intl/intl.dart';

/// Formatos de tiempo compartidos por las vistas.
abstract final class Formatters {
  /// `25:00` o `1:05:00`.
  static String countdown(Duration d) {
    final total = d.inSeconds < 0 ? 0 : d.inSeconds;
    final h = total ~/ 3600;
    final m = (total % 3600) ~/ 60;
    final s = total % 60;
    String two(int v) => v.toString().padLeft(2, '0');
    return h > 0 ? '$h:${two(m)}:${two(s)}' : '${two(m)}:${two(s)}';
  }

  static String time(DateTime t, String locale) =>
      DateFormat.Hm(locale).format(t);

  static String dayAndTime(DateTime t, String locale) =>
      DateFormat('EEE d MMM, HH:mm', locale).format(t);

  static String weekdayShort(DateTime t, String locale) =>
      DateFormat.E(locale).format(t);
}
