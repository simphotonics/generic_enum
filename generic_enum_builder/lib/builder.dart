import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/generators/json_generator.dart';

/// Returns an instance of `SharedPartBuilder`.
///
/// Builds an extension providing the functions:
/// `toJson` and `fromJson`.
///
Builder jsonBuilder(BuilderOptions options) {
  return SharedPartBuilder([JsonGenerator()], 'json_builder');
}
