class GenericEnumException implements Exception {
  /// Exception message
  final String message;

  /// Constructs a `GenericEnumException`.
  /// Add a message that is useful when debugging.
  const GenericEnumException([this.message]);

  /// Converts [GenericEnumException] instance to [String].
  @override
  String toString() => message ?? 'GenericEnumException';
}
