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

  /// Read library empty_generic_enum.dart.
  final readerEmptyGenericEnum =
      await initializeLibraryReaderForDirectory('test/src', 'num_type.dart');

  /// Instantiate generators:
  final mapGenerator = MapGenerator();
  final jsonGenerator = JsonGenerator();
  final identifierGenerator = IdentifierGenerator();

  /// Run MapGenerator.
  String generatedMapDirection =
      await mapGenerator.generate(readerDirection, null);
  String expectedMapDirection = '';

  String generatedMapVector = await mapGenerator.generate(readerVector, null);
  String expectedMapVector =
      '/// Maps a value of type [Vector<double>] to an instance of [VectorEnum].\n'
      '/// Add the following getter to your class definition:\n'
      '/// ```\n'
      '/// static Map<Vector<double>,VectorEnum> get valueMap => _\$VectorEnumValueMap;\n'
      '/// ```\n'
      'final _\$VectorEnumValueMap = Map<Vector<double>, VectorEnum>.unmodifiable(\n'
      '    {VectorEnum.V1.value: VectorEnum.V1, VectorEnum.V2.value: VectorEnum.V2});';

  /// Run Json Generator.
  String generatedJsonDirection =
      await jsonGenerator.generate(readerDirection, null);
  String expectedJsonDirection =
      '/// Maps a value of type [String] to an instance of [Direction].\n'
      '/// Add the following getter to your class definition:\n'
      '/// ```\n'
      '/// static Map<String,Direction> get valueMap => _\$DirectionValueMap;\n'
      '/// ```\n'
      'final _\$DirectionValueMap = Map<String, Direction>.unmodifiable({\n'
      '  Direction.NORTH.value: Direction.NORTH,\n'
      '  Direction.EAST.value: Direction.EAST,\n'
      '  Direction.SOUTH.value: Direction.SOUTH,\n'
      '  Direction.WEST.value: Direction.WEST\n'
      '});\n'
      '\n'
      '/// Converts a map [Map<String, dynamic>] to an instance of [Direction].\n'
      '/// Add the following factory constructor to your class definition:\n'
      '/// ```\n'
      '/// factory Direction.fromJson(Map<String, dynamic> json) =>\n'
      '///   _\$DirectionFromJson(json);\n'
      '/// ```\n'
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
      '/// Returns the [String] identifier of an instance of [VectorEnum].\n'
      '/// Add the following static function to your class definition:\n'
      '/// ```\n'
      '/// static String identifier(VectorEnum vectorEnum) =>\n'
      '///   _\$VectorEnumIdentifier(vectorEnum);\n'
      '/// ```\n'
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

  String generatedJsonEmpty =
      await jsonGenerator.generate(readerEmptyGenericEnum, null);
  String expectedJsonEmpty = '';
  String generatedEmptyIdentifier =
      await identifierGenerator.generate(readerEmptyGenericEnum, null);
  String expectedEmptyIdentifier = '';

  group('MapGenerator:', () {
    test('ValueMap for direction.dart.', () {
      expect(
        generatedMapDirection,
        expectedMapDirection,
        reason:
            'MapGenerator returns \'\' if the class is annotated with GeneratorFromJson()',
      );
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
    test('FromJson for empty_generic_enum.dart.', () {
      expect(generatedJsonEmpty, expectedJsonEmpty);
    });
  });

  group('IdentifierGenerator', () {
    test('Identifier for vector.dart.', () {
      expect(generatedIdentifierFct, expectedIdentifierFct);
    });
    test('Identifier for empty_generic_enum.dart.', () {
      expect(generatedEmptyIdentifier, expectedEmptyIdentifier);
    });
  });

  group('GeneratorException:', () {
    test('Non-const Constructor in num_type.dart', () {
      expect(() async => await mapGenerator.generate(readerNumType, null),
          throwsA(TypeMatcher<GeneratorException>()));
    });
  });
}
