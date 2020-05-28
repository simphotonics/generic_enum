import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generic_enum_builder/src/writers/json_writer.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart'
    show GenerateFromJson;

/// Source code generator that builds the function [_$<ClassName>FromJson].
/// Extends [GeneratorForAnnotation<GenerateFromJson>] and as such
/// processes only classes annotated with [@GenerateFromJson].
class JsonGenerator extends GeneratorForAnnotation<GenerateFromJson> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    return JsonWriter(element).fromJson;
  }
}
