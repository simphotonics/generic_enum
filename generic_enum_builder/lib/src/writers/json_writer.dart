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

  /// Returns a [String] representing the function [toJson] and [fromJson].
  String get fromToJson => toJson + fromJson;

  /// Returns a [String] representing the function [_$<ClassName>FromJson].
  String get fromJson {
    var b = StringBuffer();
    if (instances.isEmpty) {
      b.writeln('// No static const instances of [$type] found!');
      b.writeln('// Skipped generating function _\$${type}FromJson.');
      b.writeln('');
      return b.toString();
    }
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
      'final key = (json[\'key\']) as int;',
    );
    b.writeln(
      '$type instance = _\$${type}ValueMap.values.toList()[key];',
    );
    b.writeln(
      'if( instance == null ) {',
    );
    b.writeln('throw GenericEnumException(');
    b.writeln(
      '\'.fromJson constructor: Could not find a matching instance of type $type.\'',
    );
    b.writeln(');');
    b.writeln('}');
    b.writeln('return instance;');

    // Closing brackets
    b.writeln('}');

    return b.toString();
  }

  /// Returns a [String] representing the function [_$<ClassName>toJson].
  String get toJson {
    var b = StringBuffer();
    if (instances.isEmpty) {
      b.writeln('// No static const instances of [$type] found!');
      b.writeln('// Skipped generating function _\$${type}ToJson.');
      b.writeln('');
      return b.toString();
    }
    // Dart Doc.
    b.writeln(
      '/// Converts an instance of [$type] to a map [Map<String, dynamic>].',
    );
    b.writeln('/// Add the following method to your class definition: ');
    b.writeln('/// ```');
    b.writeln(
      '///  Map<String, dynamic> toJson() => _\$${type}ToJson(this); ',
    );
    b.writeln('/// ```');
    // Function declaration
    b.writeln('Map<String, dynamic> _\$${type}ToJson($type instance) => ');
    b.writeln(
        '{\'key\': _\$${type}ValueMap.values.toList().indexOf(instance)};');
    return b.toString();
  }
}
