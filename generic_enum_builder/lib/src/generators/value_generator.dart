import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:source_gen/source_gen.dart';

import '../writers/value_writer.dart';

/// Source code generator that builds the extension `<EnumName>Value`.
class ValueGenerator extends GeneratorForAnnotation<GenerateValueExtension> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is ClassElement && element.isEnum) {
      return ValueWriter(element, annotation).valueExtension;
    } else {
      return '';
    }
  }
}
