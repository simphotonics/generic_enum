import 'package:dart_style/dart_style.dart';
import 'package:generic_enum_builder/src/generators/json_generator.dart';
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

  String generatedJsonVector = await jsonGenerator.generate(readerVector, null);
  generatedJsonVector = DartFormatter().format(generatedJsonVector);
  String expectedJsonVector =
      '/// Extension providing the functions `fromJson` and `toJson`.\n'
      'extension VectorJson on Vector {\n'
      '  /// Converts [json] to an instance of `Vector`.\n'
      '  static Vector fromJson(Map<String, dynamic> json) {\n'
      '    final index = (json[\'index\']) as int;\n'
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
      '  Map<String, dynamic> toJson() => {\'key\': Vector.values.indexOf(this)};\n'
      '}\n'
      '';

  group('JsonGenerator:', () {
    test('FromJson for vector.dart.', () {
      expect(generatedJsonVector, expectedJsonVector);
    });
  });
}
