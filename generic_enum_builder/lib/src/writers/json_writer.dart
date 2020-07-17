import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

/// Writes source code representing an extension on an enumeration.
/// The extension provides the functions: `fromJson` and `toJson`.
class JsonWriter {
  JsonWriter(ClassElement element) : enumType = element.thisType;

  final InterfaceType enumType;

  /// Returns a `String` representation of the extension `<EnumName>Json`.
  String get jsonExtension {
    final b = StringBuffer();
    b.writeln('/// Extension providing the functions `fromJson` and `toJson`.');
    b.writeln('extension To${enumType} on ${enumType}{');
    b.writeln(fromJson);
    b.writeln(toJson);
    b.writeln(jsonEncoded);
    b.writeln('}');
    return b.toString();
  }

  /// Returns a `String` representing the static function `fromJson`.
  String get fromJson {
    final b = StringBuffer();
    // Dart Doc.
    b.writeln(
      '/// Converts [json] to an instance of `${enumType}`.',
    );
    // Function declaration
    b.writeln(
      'static ${enumType} fromJson(Map<String, dynamic> json){',
    );

    // Function body
    b.writeln(
      'final index = (json[\'index\']) as int;',
    );
    // Checking if index is null.
    b.writeln('if (index == null){');
    b.writeln('throw ErrorOf<$enumType>(');
    b.writeln('message: \'Error deserializing json to $enumType.\',');
    b.writeln(
        'invalidState: \'json[index] returned null.\',');
    b.writeln('expectedState: \'A map entry: {index: int value}.\'');
    b.writeln(');}');
    // Checking if index is out of bounds.
    b.writeln('if( index >= 0 && index < ${enumType}.values.length ) {');
    b.writeln('return ${enumType}.values[index];');
    b.writeln('} else {');
    b.writeln('throw ErrorOf<${enumType}>(');
    b.writeln('message: '
        '\'Function fromJson could not find \'\'an instance of type ${enumType}.\',');
    b.writeln('invalidState: '
        ' \'${enumType}.values[\$index] out of bounds.\'');
    b.writeln(');');
    b.writeln('}');

    // Closing brackets
    b.writeln('}');

    return b.toString();
  }

  /// Returns a `String` representing the function `toJson()`.
  String get toJson {
    var b = StringBuffer();
    // Dart Doc.
    b.writeln(
      '/// Converts `this` to a map `Map<String, dynamic>`.',
    );

    // Function declaration
    b.writeln('Map<String, dynamic> toJson() => ');
    b.writeln('{\'index\': ${enumType}.values.indexOf(this)};');
    return b.toString();
  }

  /// Returns a `String` representing the function `toJsonEncoded()`.
  String get jsonEncoded {
    var b = StringBuffer();
    // Dart Doc.
    b.writeln('/// Converts `this` to a json encoded `String`.');

    // Function declaration
    b.writeln('String get jsonEncoded => ');
    b.writeln('\'{\"index\":\${${enumType}.values.indexOf(this)}}\';');
    return b.toString();
  }
}
