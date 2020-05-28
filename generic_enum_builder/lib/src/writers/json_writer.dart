import 'dart:collection';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:generic_enum_builder/src/collectors/generic_enum_collector.dart';

/// Writes source code representing a function with
/// name: _$<ClassName>Identifier that a returns the
/// identifier of a [GenericEnum] instance as a [String].
class JsonWriter {
  JsonWriter(ClassElement element)
      : type = element.thisType,
        superTypeArg = element.supertype.typeArguments?.first,
        instanceCollector = GenericEnumCollector(element);

  /// Type of [element].
  final DartType type;

  /// Type argument of superType of [element].
  final DartType superTypeArg;

  /// Collects static const instances of a class extending [GenericEnum].
  final GenericEnumCollector instanceCollector;

  /// Return a list of [FieldElement]s representing static instances of
  /// the class extending [GenericEnum].
  UnmodifiableListView<FieldElement> get instances =>
      instanceCollector.collectedItems;

  /// Returns a [String] representing the function [_$<ClassName>fromJson].
  String get fromJson {
    // Check if static const instances are defined.
    if (instances.isEmpty) return '';

    var b = StringBuffer();
    // Dart Doc.
    b.writeln(
      '/// Converts a map [Map<String, dynamic>] to an instance of [$type].',
    );
    b.writeln(
        '/// Add the following factory constructor to your class definition: ');
    b.writeln('/// ```');
    b.writeln(
      '/// factory $type.fromJson(Map<String, dynamic> json) => ',
    );
    b.writeln('///   _\$${type}FromJson(json);');
    b.writeln('/// ```');
    // Function declaration
    b.writeln(
      '$type _\$${type}FromJson(Map<String, dynamic> json){',
    );

    // Function body
    b.writeln(
      '${superTypeArg} value = GenericEnum.fromJson(json).value;',
    );
    b.writeln(
      '$type instance = _\$${type}ValueMap[value];',
    );
    b.writeln(
      'if( instance == null ) {',
    );
    b.writeln('throw GenericEnumException(');
    b.writeln(
      '\'Could not find $type instance with value: \$value.\',',
    );
    b.writeln(');');
    b.writeln('}');
    b.writeln('return instance;');

    // Closing brackets
    b.writeln('}');

    return b.toString();
  }
}
