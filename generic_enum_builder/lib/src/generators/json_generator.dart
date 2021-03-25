import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:source_gen/source_gen.dart';

import '../writers/json_writer.dart';

/// Source code generator that builds the extension `<EnumName>Json`.
class JsonGenerator extends GeneratorForAnnotation<GenerateJsonExtension> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) return '';
    if (element.isEnum) {
      return JsonWriter(element).jsonExtension;
    } else {
      return '';
    }
  }
}
