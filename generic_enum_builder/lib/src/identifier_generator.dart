import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:dart_style/dart_style.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_builder/src/class_element_visitor.dart';
import 'package:generic_enum_builder/src/generic_enum_visitor.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart'
    show GenerateIdentifier;

/// Souce code generator that builds the function [_$<ClassName>Identifier].
/// Extends [GeneratorForAnnotation<GenerateIdentifier>] and as such
/// processes only classes annotated with [@GenerateIdentifier].
class IdentifierGenerator extends GeneratorForAnnotation<GenerateIdentifier> {
  static const GenericEnumChecker = TypeChecker.fromRuntime(GenericEnum);

  /// Visits a [ClassElement] and extracts static type information.
  ClassElementVisitor classVis;

  /// Visits an element with a static type that is assignable from [GenericEnum].
  GenericEnumVisitor vis;

  /// Function called by [generate] during the build process. Provides
  /// access to the current element, its annotations, and the buildStep.
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    // Check if element is GenericEnum
    if (!GenericEnumChecker.isAssignableFrom(element)) return null;

    // Get static types
    classVis = ClassElementVisitor();
    element.accept(classVis);

    // Collect const static fields
    vis = GenericEnumVisitor(classType: classVis.thisType);
    element.visitChildren(vis);

    // Check if static const instances are defined
    return (vis.instances.isNotEmpty) ? _generateIdentifier() : null;
  }

  /// Generates code defining the function [_$<ClassName>Identifier].
  String _generateIdentifier() {
    var buffer = StringBuffer();
    var input = classVis.thisType.toString();
    input = input.replaceRange(0, 1, input[0].toLowerCase());
    // Function declaration
    buffer.writeln('String _\$${classVis.thisType}Identifier('
        '${classVis.thisType} $input){');
    // Switch statement
    buffer.writeln('switch ($input){');
    // Cases:
    for (var instance in vis.instances) {
      buffer.writeln('case ${classVis.thisType}.${instance.name}:');
      buffer.writeln('return \'${classVis.thisType}.${instance.name}\'; ');
      buffer.writeln('break;');
    }
    // Default case:
    buffer.writeln('default:');
    buffer.writeln('return \'\';');
    // Closing bracket switch statement.
    buffer.writeln('}');
    // Closing bracket function.
    buffer.writeln('}');

    // Format source code
    return DartFormatter().format(buffer.toString());
  }
}