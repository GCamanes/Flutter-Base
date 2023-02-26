class BasicException implements Exception {
  const BasicException(this.message);

  final String message;

  @override
  String toString() => message;
}
