/// Library providing the builder [extensionBuilder].
library generic_enum_builder;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generators/json_generator.dart';
import 'src/generators/value_generator.dart';

/// Returns an instance of [SharedPartBuilder].
///
/// * [JsonGenerator] builds an extension providing the functions:
/// `toJson`, `toJsonEncoded` and `fromJson`.
/// * [ValueGenerator] builds an extension providing enum value getters.
Builder extensionBuilder(BuilderOptions options) {
  return SharedPartBuilder([
    ValueGenerator(),
    JsonGenerator(),
  ], 'extension_builder');
}
