import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:dart_style/dart_style.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_generator/src/class_element_visitor.dart';
import 'package:generic_enum_generator/src/generic_enum_visitor.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart';

/// Builds ToJson and FromJson functions
class JsonGenerator extends GeneratorForAnnotation<GenerateToFromJson> {
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
    if (vis.instances.isEmpty) return null;

    // Merge source code
    var source = StringBuffer();
    source.writeln(_generateToJson());
    source.writeln(_generateFromJson());

    // Format source code
    return DartFormatter().format(source.toString());
  }

  /// Generates toJson function.
  String _generateToJson() {
    var buffer = StringBuffer();
    // Function declaration
    buffer.writeln('Map<String, dynamic>'
        ' _toJson(${classVis.thisType} instance) => ');
    buffer.writeln('instance.toJson();');
    // Format source code
    return buffer.toString();
  }

  // factory GenericEnum.fromJson(Map<String, dynamic> json) =>
  //     _$GenericEnumFromJson<T>(json);
  /// Generates FromJson function
  String _generateFromJson() {
    var buffer = StringBuffer();
    // Function declaration
    buffer.writeln('${classVis.thisType} fromJson(Map<String, dynamic> json){');

    // Function body
    buffer.writeln(
        '${classVis.superTypeArg} value = GenericEnum.fromJson(json).value;');
    buffer.writeln('return ${classVis.thisType}.valueMap[value];');

    // Closing brackets
    buffer.writeln('}');

    return buffer.toString();
  }
}
