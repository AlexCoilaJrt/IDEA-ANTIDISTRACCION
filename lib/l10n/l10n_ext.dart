import 'package:enfoque/l10n/gen/app_localizations.dart';

/// Duraciones en texto, con los formatos del diseño.
extension DurationText on AppLocalizations {
  /// `1h 45m` o `45m`.
  String shortDuration(int minutes) => minutes >= 60
      ? durationShortHm(minutes ~/ 60, minutes % 60)
      : durationShortM(minutes);

  /// `3 h 00 min` o `45 min`.
  String longDuration(int minutes) => minutes >= 60
      ? durationHm(minutes ~/ 60, (minutes % 60).toString().padLeft(2, '0'))
      : commonMinutesShort(minutes);

  /// `L`, `M`, `X`... (lunes = índice 0).
  List<String> get weekdayLetters => weekdayInitials.split(',');
}
