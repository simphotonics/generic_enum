import 'package:dart_style/dart_style.dart';
import 'package:generic_enum_builder/src/generators/json_generator.dart';
import 'package:generic_enum_builder/src/generators/value_generator.dart';
import 'package:test/test.dart';
import 'package:source_gen_test/src/init_library_reader.dart';

/// Testing MapGenerator and JsonGenerator.
Future<void> main() async {
  /// Read library vector.dart.
  final readerVector = await initializeLibraryReaderForDirectory(
    'test/src',
    'vector.dart',
  );

  /// Instantiate generators:
  final jsonGenerator = JsonGenerator();
  final valueGenerator = ValueGenerator();

  String generatedJsonVector = await jsonGenerator.generate(readerVector, null);
  generatedJsonVector = DartFormatter().format(generatedJsonVector);

  String generatedValueVector =
      await valueGenerator.generate(readerVector, null);
  generatedValueVector = DartFormatter().format(generatedValueVector);

  String expectedJsonVector =
      '/// Extension providing the functions `fromJson()`, `toJson()`,\n'
      '/// and the getter `jsonEncoded`.\n'
      'extension ToVector on Vector {\n'
      '  /// Converts [json] to an instance of `Vector`.\n'
      '  static Vector fromJson(Map<String, dynamic> json) {\n'
      '    final index = (json[\'index\']) as int;\n'
      '    if (index == null) {\n'
      '      throw ErrorOf<Vector>(\n'
      '          message: \'Error deserializing json to Vector.\',\n'
      '          invalidState: \'json[index] returned null.\',\n'
      '          expectedState: \'A map entry: {index: int value}.\');\n'
      '    }\n'
      '    if (index >= 0 && index < Vector.values.length) {\n'
      '      return Vector.values[index];\n'
      '    } else {\n'
      '      throw ErrorOf<Vector>(\n'
      '          message:\n'
      '              \'Function fromJson could not find \' \'an instance of type Vector.\',\n'
      '          invalidState: \'Vector.values[\$index] out of bounds.\');\n'
      '    }\n'
      '  }\n'
      '\n'
      '  /// Converts `this` to a map `Map<String, dynamic>`.\n'
      '  Map<String, dynamic> toJson() => {\'index\': Vector.values.indexOf(this)};\n'
      '\n'
      '  /// Converts `this` to a json encoded `String`.\n'
      '  String get jsonEncoded => \'{"index":\${Vector.values.indexOf(this)}}\';\n'
      '}\n'
      '';

  String expectedValueVector =
      '/// Extension on `Vector` providing value-getters.\n'
      'extension VectorValue on Vector {\n'
      '  /// Returns the mapped double value of\n'
      '  /// an instance of `Vector`.\n'
      '  double get value => const <Vector, double>{\n'
      '        Vector.alpha: 3.14,\n'
      '        Vector.beta: 6.98,\n'
      '      }[this];\n'
      '\n'
      '  /// Returns the String identifier of an instance of `Vector`.\n'
      '  String get stringValue => const <Vector, String>{\n'
      '        Vector.alpha: \'alpha\',\n'
      '        Vector.beta: \'beta\',\n'
      '      }[this];\n'
      '}\n'
      '';

  group('JsonGenerator:', () {
    test('JsonExtension for vector.dart.', () {
      expect(generatedJsonVector, expectedJsonVector);
    });
  });
  group('VectorGenerator:', () {
    test('ValueExtension for vector.dart.', () {
      expect(generatedValueVector, expectedValueVector);
    });
  });
}
