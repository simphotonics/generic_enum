import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generic_enum/generic_enum.dart' show GenerateIdentifier;

import 'package:generic_enum_builder/src/writers/identifier_writer.dart';

/// Source code generator that builds the function [_$<ClassName>Identifier].
/// Extends [GeneratorForAnnotation<GenerateIdentifier>] and as such
/// processes only classes annotated with [@GenerateIdentifier].
class IdentifierGenerator extends GeneratorForAnnotation<GenerateIdentifier> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    return IdentifierWriter(element).identifierFunction;
  }
}
