import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:dart_style/dart_style.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_builder/src/class_element_visitor.dart';
import 'package:generic_enum_builder/src/generic_enum_visitor.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart'
    show GenerateFromJson;

/// Souce code generator that builds _$<ClassName>FromJson function.
/// Extends [GeneratorForAnnotation<GenerateFromJson>] and as such
/// processes only classes annotated with [@GenerateFromJson].
class JsonGenerator extends GeneratorForAnnotation<GenerateFromJson> {
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
    if (vis.instances.isEmpty) return null;

    // Merge source code
    var source = StringBuffer();
    source.writeln(_generateFromJson());

    // Format source code
    return DartFormatter().format(source.toString());
  }

  // factory GenericEnum.fromJson(Map<String, dynamic> json) =>
  //     _$GenericEnumFromJson<T>(json);
  /// Generates the function FromJson.
  String _generateFromJson() {
    var buffer = StringBuffer();
    // Function declaration
    buffer.writeln(
      '${classVis.thisType} _\$${classVis.thisType}FromJson(Map<String, dynamic> json){',
    );

    // Function body
    buffer.writeln(
      '${classVis.superTypeArg} value = GenericEnum.fromJson(json).value;',
    );
    buffer.writeln(
      '${classVis.thisType} instance = ${classVis.thisType}.valueMap[value];',
    );
    buffer.writeln(
      'if( instance == null ) {',
    );
    buffer.writeln('throw GenericEnumException(');
    buffer.writeln(
      '\'Could not find ${classVis.thisType} instance with value: \$value.\',',
    );
    buffer.writeln(');');
    buffer.writeln('}');
    buffer.writeln('return instance;');

    // Closing brackets
    buffer.writeln('}');

    return buffer.toString();
  }
}
