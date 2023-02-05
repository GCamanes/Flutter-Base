extension DurationExtension on Duration {
  String get toTime {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    return '${twoDigits(inHours)}h ${twoDigitMinutes}min';
  }
}
