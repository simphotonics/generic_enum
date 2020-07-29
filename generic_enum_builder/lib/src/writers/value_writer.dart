import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:exception_templates/exception_templates.dart';
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
        getterName = annotation.peek('getterName')?.stringValue,
        mappedGetterName = annotation.peek('mappedGetterName')?.stringValue,
        mappedValueType = annotation
            .peek('mappedValueType')
            ?.objectValue
            ?.type
            ?.typeArguments
            ?.first,
        mappedValues = annotation
            .peek('mappedValues')
            ?.setValue
            ?.map((item) => item?.toStringValue())
            ?.toList() {
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

  /// Name of string value getter.
  final String getterName;

  /// Name of mapped value getter.
  final String mappedGetterName;

  /// Static type of mapped value.
  final DartType mappedValueType;

  /// Names of getters returning an enum instance.
  final names = <String>[];

  /// Encoded mapped values.
  final mappedValues;

  /// Returns a `String` representation of the extension `<EnumName>Value`.
  String get valueExtension {
    final b = StringBuffer();
    b.writeln('/// Extension on `$enumType` providing value-getters.');
    b.writeln('extension ${enumType}Value on $enumType{');
    b.writeln(mappedValue);
    b.writeln(stringValue);
    b.writeln(valueMap);
    b.writeln('}');
    return b.toString();
  }

  /// Returns a `String` representing the getter `getterName`.
  String get stringValue {
    final b = StringBuffer();
    if (!isValidIdentifier(getterName)) {
      b.write('\\ Getter name $getterName is not a valid identfier.');
      b.write('\\ Skipped writing getter: $getterName.');
      return b.toString();
    }
    // Dart Doc.
    b.writeln(
      '/// Returns the String identifier of an instance of `${enumType}`.',
    );
    // Function declaration
    b.writeln(
      'String get $getterName => const <$enumType, String>{',
    );
    for (final name in names ?? <String>[]) {
      b.write('$enumType.$name:');
      b.writeQ(name);
      b.write(',');
    }
    b.writeln('}[this];');
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
    for (final name in names ?? <String>[]) {
      b.writeQ(name);
      b.write(':$enumType.$name');
      b.write(',');
    }
    b.writeln('};');
    return b.toString();
  }

  /// Returns a `String` representing the getter `mappedGetterName`.
  String get mappedValue {
    final b = StringBuffer();
    final message = validateInput();
    // Validate input:
    if (message != null) {
      if (message.isNotEmpty) {
        b.writeln(message);
        b.writeln('// Skipped writing getter: $mappedGetterName.');
      }
      return b.toString();
    }
    // Dart Docs.
    b.writeln('/// Returns the mapped $mappedValueType value of ');
    b.writeln('/// an instance of `${enumType}`.');
    // Function declaration.
    b.writeln(
      '$mappedValueType get $mappedGetterName => const <$enumType, $mappedValueType>{',
    );
    // Function body
    for (var i = 0; i < names.length; i++) {
      b.write('$enumType.${names[i]}:');
      b.write(mappedValues[i]);
      b.write(',');
    }
    b.writeln('}[this];');
    return b.toString();
  }

  /// Returns a non-empty `String` if the following variables are invalid:
  /// * [mappedValueType]
  /// * [mappedValues]
  /// * [mappedGetterName]
  ///
  /// Returns `null` if the variables are valid.
  /// Returns an empty `String` if `mappedValueType`
  /// and `mappedValues` are both null.
  String validateInput() {
    if (mappedValueType == null && mappedValues == null) {
      return '';
    }
    if (mappedValueType == null) {
      return '// Found mappedValueType == null. ';
    }
    if (mappedValues == null) {
      return '// Found mappedValues == null. ';
    } else if (mappedValues.length != names.length) {
      return '// Can\'t map $names to $mappedValues.';
    }
    if (!isValidIdentifier(mappedGetterName)) {
      return '// Found mappedGetterName == $mappedGetterName.';
    }
    return null;
  }
}
