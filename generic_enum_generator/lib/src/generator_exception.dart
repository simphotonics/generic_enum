class GeneratorException implements Exception {
  const GeneratorException([this.message]);

  final String message;

  @override
  String toString() {
    return 'GeneratorException: $message';
  }
}
