import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:dart_style/dart_style.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_generator/src/class_element_visitor.dart';
import 'package:generic_enum_generator/src/generic_enum_visitor.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart';

class MapGenerator extends GeneratorForAnnotation<GenerateBuiltMap> {
  static const GenericEnumChecker = TypeChecker.fromRuntime(GenericEnum);

  ClassElementVisitor classVis;
  GenericEnumVisitor vis;

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

  /// Generates code defining a private BuiltMap variable [_valueMap].
  String _generateValueMap() {
    var buffer = StringBuffer();
    // BuiltMap declaration
    //buffer.writeln('/*');
    buffer.writeln('final _valueMap = BuiltMap<${classVis.superTypeArg},'
        '${classVis.thisType}>({');

    // BuiltMap enties: generic enum Instances
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
