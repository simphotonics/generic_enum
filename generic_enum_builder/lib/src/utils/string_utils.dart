/// [String] functions used by source code generators.
library string_utils;

import 'dart:collection' show UnmodifiableListView;

final dartKeywords = UnmodifiableListView<String>([
  'abstract',
  'as',
  'assert',
  'async',
  'await',
  'break',
  'case',
  'catch',
  'class',
  'const',
  'continue',
  'covariant',
  'default',
  'deferred',
  'do',
  'dynamic',
  'else',
  'enum',
  'export',
  'extends,',
  'extension',
  'external',
  'factory',
  'false',
  'final',
  'finally',
  'for',
  'Function',
  'get',
  'hide',
  'if',
  'implements',
  'import',
  'in',
  'interface',
  'is',
  'library',
  'mixin',
  'new',
  'null',
  'on',
  'operator',
  'part',
  'rethrow',
  'return',
  'set',
  'show',
  'static',
  'super',
  'switch',
  'sync',
  'this',
  'throw',
  'true',
  'try',
  'typedef',
  'var',
  'void',
  'while',
  'with',
  'yield',
]);

/// Converts a capital camel case Dart class name
/// to a lower case underscore separated Dart library name.
String classNameToLibraryName(String className) {
  final pattern = RegExp(r"(?<=[a-z])[A-Z]");
  String libraryName = className?.replaceAllMapped(
    pattern,
    (Match m) => '_${m[0]}',
  );
  return libraryName?.toLowerCase();
}

/// Returns [true] if [input] is a valid Dart variable identifier.
bool isValidIdentifier(String input) {
  if (input == null) return false;
  // Contains only valid characters and starts with a non-numeric character.
  final regExp = RegExp(r"^[A-Za-z_$][A-Za-z0-9_$]*");
  final match = regExp.stringMatch(input);
  if (match != input) return false;
  if (dartKeywords.contains(input)) {
    return false;
  } else {
    return true;
  }
}
