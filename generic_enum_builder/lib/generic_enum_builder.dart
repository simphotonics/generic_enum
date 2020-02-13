/// Library providing the builders [mapBuilder] and [jsonBuilder].
/// These functions are used to build
/// generic enumeration classes extending [GenericEnum<T>].
library generic_enum_builder;

import 'package:build/build.dart';
import 'package:generic_enum_builder/src/identifier_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generic_enum_builder/src/json_generator.dart';
import 'package:generic_enum_builder/src/map_generator.dart';

/// Builder calling the method [generate] on a [MapGenerator]
/// instance.
/// [MapGenerator] processes classes annotated with [@GenerateValueMap].
/// It generates an unmodifiable [Map] instance mapping each [GenericEnum]
/// value to the static const [GenericEnum] instance with that value.
Builder mapBuilder(BuilderOptions options) =>
    SharedPartBuilder([MapGenerator()], 'map_builder');

/// Builder calling the method [generate] on a [JsonGenerator]
/// instance.
/// [JsonGenerator] processes classes annotated with [@GenerateFromJson].
/// It generates the function [_$<ClassName>FromJson].
Builder jsonBuilder(BuilderOptions options) =>
    SharedPartBuilder([JsonGenerator()], 'json_builder');

/// Builder calling the method [generate] on a [IdentifierGenerator]
/// instance.
/// [IdentifierGenerator] processes classes annotated with [@GenerateIdentifier].
/// It generates the function [_$<ClassName>Identifier()].
Builder identifierBuilder(BuilderOptions options) =>
    SharedPartBuilder([IdentifierGenerator()], 'identifier_builder');
