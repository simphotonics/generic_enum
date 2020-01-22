import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generic_enum_generator/src/json_generator.dart';
import 'package:generic_enum_generator/src/map_generator.dart';

Builder mapBuilder(BuilderOptions options) =>
    SharedPartBuilder([MapGenerator()], 'map_builder');

Builder jsonBuilder(BuilderOptions options) =>
    SharedPartBuilder([JsonGenerator()], 'json_builder');
