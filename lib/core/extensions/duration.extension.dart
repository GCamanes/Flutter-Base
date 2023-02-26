extension DurationExtension on Duration {
  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  String get toTime {
    String twoDigitMinutes = _twoDigits(inMinutes.remainder(60));
    if (inHours < 1) {
      return '${twoDigitMinutes}min';
    }
    return '${_twoDigits(inHours)}h ${twoDigitMinutes}min';
  }

  String get toTimeWithSeconds {
    String twoDigitMinutes = _twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = _twoDigits(inSeconds.remainder(60));
    return '${_twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }
}
