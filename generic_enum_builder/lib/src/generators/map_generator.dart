import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generic_enum/generic_enum.dart' show GenerateValueMap;
import 'package:source_gen/source_gen.dart';

import 'package:generic_enum_builder/src/writers/map_writer.dart';

/// Source code generator that builds the ValueMap object [_$<ClassName>valueMap].
/// Extends [GeneratorForAnnotation<GenerateValueMap>] and as such
/// processes only classes annotated with [@GenerateValueMap].
class MapGenerator extends GeneratorForAnnotation<GenerateValueMap> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    return MapWriter(element).valueMap;
  }
}
