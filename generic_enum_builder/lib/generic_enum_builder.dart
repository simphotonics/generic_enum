import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generic_enum_builder/src/json_generator.dart';
import 'package:generic_enum_builder/src/map_generator.dart';

/// Builder calling the method [generate] on a [MapGenerator]
/// instance.
///
/// [MapGenerator] processes classes annotated with [@GenerateBuiltMap].
/// It generates a [BuiltMap] instance mapping each [GenericEnum] value to
/// the static const [GenericEnum] instance with that value.
Builder mapBuilder(BuilderOptions options) =>
    SharedPartBuilder([MapGenerator()], 'map_builder');

/// Builder calling the method [generate] on a [JsonGenerator]
/// instance.
///
/// [JsonGenerator] processes classes annotated with [@GenerateToFromJson].
/// It generates the functions [_toJson] and [fromJson].
Builder jsonBuilder(BuilderOptions options) =>
    SharedPartBuilder([JsonGenerator()], 'json_builder');
