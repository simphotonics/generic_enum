library generic_enum_builder;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generators/json_generator.dart';
import 'src/generators/value_generator.dart';

/// Returns an instance of `SharedPartBuilder`.
///
/// Builds an extension providing the functions:
/// `toJson`, `toJsonEncoded` and `fromJson`.
Builder extensionBuilder(BuilderOptions options) {
  return SharedPartBuilder([
    ValueGenerator(),
    JsonGenerator(),
  ], 'extension_builder');
}
