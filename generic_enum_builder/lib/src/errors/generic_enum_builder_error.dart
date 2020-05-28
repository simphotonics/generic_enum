/// Error thrown when the generic enum builders encounters an unexpected state.
class GenericEnumBuilderError extends Error {
  GenericEnumBuilderError({
    this.message,
    this.invalidState,
    this.expectedState,
  });

  /// Message added when the error is thrown.
  final Object message;

  /// Generic object conveying information about the invalid state.
  final Object invalidState;

  /// Generic object conveying information about an expected state.
  final Object expectedState;

  @override
  String toString() {
    final expected = (expectedState == null)
        ? ''
        : ' Expected: ' + Error.safeToString(expectedState);

    final found = (invalidState == null)
        ? ''
        : ' Found: ' + Error.safeToString(invalidState);

    return 'GeneratorError: ' +
        Error.safeToString(message) +
        found +
        expected +
        '\n' +
        super.stackTrace.toString();
  }
}
