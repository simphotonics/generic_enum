import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';
import 'package:quote_buffer/quote_buffer.dart';

/// Writes source code representing an extension on an enumeration.
/// The extension provides methods for accessing the `String`
/// values of the enum instances.
class ValueWriter {
  ValueWriter(
    ClassElement element,
    ConstantReader annotation,
  )   : enumType = element.thisType,
        valueType = annotation
            .read('valueType')
            .typeValue
            .toString()
            .replaceAll(
                '*', ''), // Workaround: Analyzer might end the type with a *.
        values = annotation
            .read('values')
            .setValue
            .map((item) => item.toStringValue() ?? '')
            .toList() {
    // Retrieve accessors returning enum instances.
    // The names `index` and `values` are used by Dart.
    for (final accessor in element.accessors) {
      if (accessor.name == 'values' || accessor.name == 'index') {
        continue;
      }
      names.add(accessor.name);
    }
  }

  /// Type induced by enum.
  final InterfaceType enumType;

  /// Static type of mapped value.
  final String valueType;

  /// Names of getters returning an enum instance.
  final names = <String>[];

  /// Encoded mapped values.
  final List<String> values;

  /// Returns a `String` representation of the extension `<EnumName>Value`.
  String get valueExtension {
    final b = StringBuffer();
    b.writeln('/// Extension on `$enumType` providing value-getters.');
    b.writeln('extension ${enumType}Value on $enumType{');
    b.writeln(value);
    b.writeln(stringValue);
    b.writeln(valueMap);
    b.writeln('}');
    return b.toString();
  }

  /// Returns a `String` representing the getter `stringValue`.
  String get stringValue {
    final b = StringBuffer();
    // Dart Doc.
    b.writeln(
      '/// Returns the String identifier of an instance of `${enumType}`.',
    );
    // Function declaration
    b.writeln(
      'String get stringValue => const <$enumType, String>{',
    );
    for (final name in names) {
      b.write('$enumType.$name:');
      b.writeQ(name);
      b.write(',');
    }
    b.writeln('}[this]!;');
    // Function body
    return b.toString();
  }

  /// Returns a `String` representing the getter `valueMap`.
  String get valueMap {
    final b = StringBuffer();
    // Dart Doc.
    b.writeln(
      '/// Returns a mapping of instance name to enum instance.',
    );
    // Function declaration
    b.writeln(
      'Map<String, $enumType> get valueMap => const <String, $enumType>{',
    );
    // Function body
    for (final name in names) {
      b.writeQ(name);
      b.write(':$enumType.$name');
      b.write(',');
    }
    b.writeln('};');
    return b.toString();
  }

  /// Returns a `String` representing the getter `mappedGetterName`.
  String get value {
    final b = StringBuffer();
    final message = validateInput();
    // Validate input:
    if (message.isNotEmpty) {
      b.writeln(message);
      b.writeln('// Skipped writing getter \'value\'.');
      return b.toString();
    }
    // Dart Docs.
    b.writeln('/// Returns value of type <$valueType> mapped to');
    b.writeln('/// an instance of `${enumType}`.');
    // Function declaration.
    b.writeln(
      '$valueType get value => const <$enumType, $valueType>{',
    );
    // Function body
    for (var i = 0; i < names.length; i++) {
      b.write('$enumType.${names[i]}:');
      b.write(values[i]);
      b.write(',');
    }
    b.writeln('}[this]!;');
    return b.toString();
  }

  /// Returns a non-empty `String` if the following variables are invalid:
  /// * `valueType`
  /// * `values`
  String validateInput() {
    if (valueType == 'null') {
      return '// Found valueType == null. Check the type parameter <T> '
          'of the annotation \'GenerateValueExtension<T>\'. ';
    } else if (values.length != names.length) {
      return '// Can\'t map $names to $values. '
          'Check the parameter \'values\' of the '
          'annotation \'GenerateValueExtension\'';
    }
    return '';
  }
}
