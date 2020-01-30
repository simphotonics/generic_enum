import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:dart_style/dart_style.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_builder/src/class_element_visitor.dart';
import 'package:generic_enum_builder/src/generic_enum_visitor.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart';

/// Souce code generator that builds the ValueMap object [_$<ClassName>valueMap].
/// Extends [GeneratorForAnnotation<GenerateValueMap>] and as such
/// processes only classes annotated with [@GenerateValueMap].
class MapGenerator extends GeneratorForAnnotation<GenerateValueMap> {
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
    return (vis.instances.isNotEmpty) ? _generateValueMap() : null;
  }

  /// Generates code defining [_valueMap], a private variable of type [Map].
  String _generateValueMap() {
    var buffer = StringBuffer();
    // Map declaration
    //buffer.writeln('/*');
    buffer.writeln(
        'final _\$${classVis.thisType}ValueMap = Map<${classVis.superTypeArg},'
        '${classVis.thisType}>.unmodifiable({');

    // Map enties: generic enum Instances
    List<String> entries = [];
    for (var instance in vis.instances) {
      entries.add(
          '${classVis.thisType}.${instance.name}.value: ${classVis.thisType}.${instance.name}');
    }
    buffer.writeAll(entries, ',\n');

    // Closing brackets
    buffer.writeln('});');

    // Format source code
    return DartFormatter().format(buffer.toString());
  }
}
