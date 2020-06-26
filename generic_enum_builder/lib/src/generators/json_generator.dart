import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generic_enum/generic_enum.dart' show GenerateFromToJson;
import 'package:source_gen/source_gen.dart';

import 'package:generic_enum_builder/src/writers/json_writer.dart';

/// Source code generator that builds the function [_$<ClassName>FromJson].
/// Extends [GeneratorForAnnotation<GenerateFromToJson>] and as such
/// processes only classes annotated with [@GenerateFromToJson].
class JsonGenerator extends GeneratorForAnnotation<GenerateFromToJson> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    return JsonWriter(element).fromToJson;
  }
}
