import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generic_enum_builder/src/json_generator.dart';
import 'package:generic_enum_builder/src/map_generator.dart';

Builder mapBuilder(BuilderOptions options) =>
    SharedPartBuilder([MapGenerator()], 'map_builder');

Builder jsonBuilder(BuilderOptions options) =>
    SharedPartBuilder([JsonGenerator()], 'json_builder');
