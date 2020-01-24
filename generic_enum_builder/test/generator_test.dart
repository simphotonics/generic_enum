import 'package:generic_enum_builder/src/json_generator.dart';
import 'package:test/test.dart';
import 'package:source_gen_test/src/init_library_reader.dart';
import 'package:generic_enum_builder/src/map_generator.dart';

/// Testing MapGenerator and JsonGenerator.
Future<void> main() async {
  /// Read library direction.dart.
  final readerDirection =
      await initializeLibraryReaderForDirectory('test/src', 'direction.dart');

  /// Read library vector.dart.
  final readerVector =
      await initializeLibraryReaderForDirectory('test/src', 'vector.dart');

  /// Instantiate generators:
  final mapGenerator = MapGenerator();
  final jsonGenerator = JsonGenerator();

  /// Run MapGenerator.
  String generatedMapDirection =
      await mapGenerator.generate(readerDirection, null);
  String expectedMapDirection =
      'final _valueMap = BuiltMap<String, Direction>({\n'
      '  Direction.NORTH.value: Direction.NORTH,\n'
      '  Direction.EAST.value: Direction.EAST,\n'
      '  Direction.SOUTH.value: Direction.SOUTH,\n'
      '  Direction.WEST.value: Direction.WEST\n'
      '});';

  String generatedMapVector = await mapGenerator.generate(readerVector, null);
  String expectedMapVector =
      'final _valueMap = BuiltMap<Vector<double>, VectorEnum>(\n'
      '    {VectorEnum.V1.value: VectorEnum.V1, VectorEnum.V2.value: VectorEnum.V2});';

  /// Run Json Generator.
  String generatedJsonDirection =
      await jsonGenerator.generate(readerDirection, null);
  String expectedJsonDirection =
      'Map<String, dynamic> _toJson(Direction instance) => instance.toJson();\n'
      '\n'
      'Direction fromJson(Map<String, dynamic> json) {\n'
      '  String value = GenericEnum.fromJson(json).value;\n'
      '  return Direction.valueMap[value];\n'
      '}';

  String generatedJsonVector = await jsonGenerator.generate(readerVector, null);
  String expectedJsonVector = '';

  group('MapGenerator:', () {
    test('BuiltMap for direction.dart.', () {
      expect(generatedMapDirection, expectedMapDirection);
    });
    test('BuiltMap for vector.dart.', () {
      expect(generatedMapVector, expectedMapVector);
    });
  });

  group('JsonGenerator:', () {
    test('ToJson, FromJson for direction.dart.', () {
      expect(generatedJsonDirection, expectedJsonDirection);
    });
    test('ToJson, FromJson for for vector.dart.', () {
      expect(generatedJsonVector, expectedJsonVector);
    });
  });
}
