import 'dart:collection';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:generic_enum_builder/src/collectors/generic_enum_collector.dart';

/// Writes source code representing a function with
/// name: _$<ClassName>Identifier that a returns the
/// identifier of a [GenericEnum] instance as a [String].
class MapWriter {
  MapWriter(ClassElement element)
      : type = element.thisType,
        superTypeArg = element.supertype.typeArguments?.first,
        instanceCollector = GenericEnumCollector(element);

  /// Visitor that collects instances of a class extending [GenericEnum].
  final GenericEnumCollector instanceCollector;

  /// Type of element.
  final DartType type;

  /// Type argument of superType;
  final DartType superTypeArg;

  /// Return a list of [FieldElement]s representing static instances of
  /// the class extending [GenericEnum].
  UnmodifiableListView<FieldElement> get instances =>
      instanceCollector.collectedItems;

  /// Returns a [String] representing source code
  /// defining [_${GenericEnumType}ValueMap], a private variable
  /// of type [Map<ValueType,GenericEnumType>].
  String get valueMap {
    // Check if static const instances are defined.
    if (instances.isEmpty) return null;

    var b = StringBuffer();
    // Dart docs.
    b.writeln(
      '/// Maps a value of type [${superTypeArg}] to an instance of [$type].',
    );
    b.writeln('/// Add the following getter to your class definition: ');
    b.writeln('/// ```');
    b.writeln(
      '/// static Map<$superTypeArg,$type> get valueMap => _\$${type}ValueMap; ',
    );
    b.writeln('/// ```');
    // Map declaration
    b.writeln('final _\$${type}ValueMap = Map<$superTypeArg,'
        '$type>.unmodifiable({');
    // Map enties: generic enum Instances
    List<String> entries = [];
    for (var instance in instances) {
      entries.add('$type.${instance.name}.value: $type.${instance.name}');
    }
    b.writeAll(entries, ',\n');
    // Trailing comma.
    b.write(',');
    // Closing brackets
    b.write('});');
    return b.toString();
  }
}
