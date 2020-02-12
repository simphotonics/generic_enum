import 'package:generic_enum_builder/src/generator_exception.dart';
import 'package:generic_enum_builder/src/identifier_generator.dart';
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

  /// Read library num_type.dart.
  final readerNumType =
      await initializeLibraryReaderForDirectory('test/src', 'num_type.dart');

  /// Instantiate generators:
  final mapGenerator = MapGenerator();
  final jsonGenerator = JsonGenerator();
  final identifierGenerator = IdentifierGenerator();

  /// Run MapGenerator.
  String generatedMapDirection =
      await mapGenerator.generate(readerDirection, null);
  String expectedMapDirection =
      'final _\$DirectionValueMap = Map<String, Direction>.unmodifiable({\n'
      '  Direction.NORTH.value: Direction.NORTH,\n'
      '  Direction.EAST.value: Direction.EAST,\n'
      '  Direction.SOUTH.value: Direction.SOUTH,\n'
      '  Direction.WEST.value: Direction.WEST\n'
      '});';

  String generatedMapVector = await mapGenerator.generate(readerVector, null);
  String expectedMapVector =
      'final _\$VectorEnumValueMap = Map<Vector<double>, VectorEnum>.unmodifiable(\n'
      '    {VectorEnum.V1.value: VectorEnum.V1, VectorEnum.V2.value: VectorEnum.V2});';

  /// Run Json Generator.
  String generatedJsonDirection =
      await jsonGenerator.generate(readerDirection, null);
  String expectedJsonDirection =
      'Direction _\$DirectionFromJson(Map<String, dynamic> json) {\n'
      '  String value = GenericEnum.fromJson(json).value;\n'
      '  Direction instance = Direction.valueMap[value];\n'
      '  if (instance == null) {\n'
      '    throw GenericEnumException(\n'
      '      \'Could not find Direction instance with value: \$value.\',\n'
      '    );\n'
      '  }\n'
      '  return instance;\n'
      '}';

  String generatedJsonVector = await jsonGenerator.generate(readerVector, null);
  String expectedJsonVector = '';

  String generatedIdentifierFct =
      await identifierGenerator.generate(readerVector, null);
  String expectedIdentifierFct =
      'String _\$VectorEnumIdentifier(VectorEnum vectorEnum) {\n'
      '  switch (vectorEnum) {\n'
      '    case VectorEnum.V1:\n'
      '      return \'VectorEnum.V1\';\n'
      '      break;\n'
      '    case VectorEnum.V2:\n'
      '      return \'VectorEnum.V2\';\n'
      '      break;\n'
      '    default:\n'
      '      return \'\';\n'
      '  }\n'
      '}';

  group('MapGenerator:', () {
    test('ValueMap for direction.dart.', () {
      expect(generatedMapDirection, expectedMapDirection);
    });
    test('ValueMap for vector.dart.', () {
      expect(generatedMapVector, expectedMapVector);
    });
  });

  group('JsonGenerator:', () {
    test('FromJson for direction.dart.', () {
      expect(generatedJsonDirection, expectedJsonDirection);
    });
    test('FromJson for vector.dart.', () {
      expect(generatedJsonVector, expectedJsonVector);
    });
  });

  group('IdentifierGenerator', () {
    test('Identifier for vector.dart.', () {
      expect(generatedIdentifierFct, expectedIdentifierFct);
    });
  });

  group('GeneratorException:', () {
    test('Non-const Constructor in num_type.dart', () {
      expect(() async => await mapGenerator.generate(readerNumType, null),
          throwsA(TypeMatcher<GeneratorException>()));
    });
  });
}
