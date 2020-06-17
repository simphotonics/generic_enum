import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:generic_enum_builder/src/collectors/generic_enum_collector.dart';

/// Writes source code representing a function with
/// name: _$<ClassName>Identifier that a returns the
/// identifier of a [GenericEnum] instance as a [String].
class IdentifierWriter {
  IdentifierWriter(ClassElement element)
      : type = element.thisType,
        instanceCollector = GenericEnumCollector(element);

  /// Visitor that collects instances of a class extending [GenericEnum].
  final GenericEnumCollector instanceCollector;

  /// Type of element.
  final DartType type;

  /// Return a list of [FieldElement]s representing static instances of
  /// the class extending [GenericEnum].
  UnmodifiableListView<FieldElement> get instances =>
      instanceCollector.collectedItems;

  /// Returns source code representing a function with
  /// name: _$<ClassName>Identifier that a returns the
  /// identifier of a [GenericEnum] instance as a [String].
  String get identifierFunction {
    final b = StringBuffer();
    if (instances.isEmpty) {
      b.writeln('// No static const instances of [$type] found!');
      b.writeln('// Skipped generating function _\$${type}Identifier.');
      b.writeln('');
      return b.toString();
    }
    String input = type.toString();
    input = input.substring(0, 1).toLowerCase() + input.substring(1);

    // Dart Doc.
    b.writeln(
      '/// Returns the [String] identifier of an instance of [$type].',
    );
    b.writeln(
        '/// Add the following static function to your class definition: ');
    b.writeln('/// ```');
    b.writeln(
      '/// static String identifier(${type} $input) => ',
    );
    b.writeln('///   _\$${type}Identifier($input);');
    b.writeln('/// ```');

    // Function declaration
    b.writeln('String _\$${type}Identifier('
        '${type} $input){');
    // Switch statement
    b.writeln('switch ($input){');
    // Cases:
    for (var instance in instances) {
      b.writeln('case ${type}.${instance.name}:');
      b.writeln('return \'${type}.${instance.name}\'; ');
      b.writeln('break;');
    }
    // Default case:
    b.writeln('default:');
    b.writeln('return \'\';');
    // Closing bracket switch statement.
    b.writeln('}');
    // Closing bracket function.
    b.writeln('}');

    return b.toString();
  }
}
