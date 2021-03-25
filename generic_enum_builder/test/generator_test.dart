import 'package:analyzer/dart/element/element.dart';
import 'dart:convert';

import 'dart:async';

import 'package:build/build.dart';
import 'package:crypto/src/digest.dart';
import 'package:dart_style/dart_style.dart';
import 'package:glob/glob.dart';
import 'package:test/test.dart';
import 'package:source_gen_test/src/init_library_reader.dart';

import 'package:generic_enum_builder/src/generators/json_generator.dart';
import 'package:generic_enum_builder/src/generators/value_generator.dart';

class MockBuildStep extends BuildStep {
  @override
  Future<bool> canRead(AssetId id) {
    throw UnimplementedError();
  }

  @override
  Future<Digest> digest(AssetId id) {
    throw UnimplementedError();
  }

  @override
  Future<T> fetchResource<T>(Resource<T> resource) {
    throw UnimplementedError();
  }

  @override
  Stream<AssetId> findAssets(Glob glob) {
    throw UnimplementedError();
  }

  @override
  AssetId get inputId => throw UnimplementedError();

  @override
  Future<LibraryElement> get inputLibrary => throw UnimplementedError();

  @override
  Future<List<int>> readAsBytes(AssetId id) {
    throw UnimplementedError();
  }

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) {
    throw UnimplementedError();
  }

  @override
  void reportUnusedAssets(Iterable<AssetId> ids) {}

  @override
  Resolver get resolver => throw UnimplementedError();

  @override
  T trackStage<T>(String label, T Function() action,
      {bool isExternal = false}) {
    throw UnimplementedError();
  }

  @override
  Future<void> writeAsBytes(AssetId id, FutureOr<List<int>> bytes) {
    throw UnimplementedError();
  }

  @override
  Future<void> writeAsString(AssetId id, FutureOr<String> contents,
      {Encoding encoding = utf8}) {
    throw UnimplementedError();
  }
}

/// Testing MapGenerator and JsonGenerator.
Future<void> main() async {
  /// Read library vector.dart.
  final readerVector = await initializeLibraryReaderForDirectory(
    'test/src',
    'dpi_resolution.dart',
  );

  /// Instantiate generators:
  final jsonGenerator = JsonGenerator();
  final valueGenerator = ValueGenerator();

  String generatedJsonVector =
      await jsonGenerator.generate(readerVector, MockBuildStep());
  generatedJsonVector = DartFormatter().format(generatedJsonVector);

  String generatedValueVector =
      await valueGenerator.generate(readerVector, MockBuildStep());
  generatedValueVector = DartFormatter().format(generatedValueVector);

  String expectedJsonVector =
      '/// Extension providing the functions `fromJson()`, `toJson()`,\n'
      '/// and the getter `jsonEncoded`.\n'
      'extension ToDpiResolution on DpiResolution {\n'
      '  /// Converts [json] to an instance of `DpiResolution`.\n'
      '  static DpiResolution fromJson(Map<String, dynamic> json) {\n'
      '    final index = (json[\'index\']) as int?;\n'
      '    if (index == null) {\n'
      '      throw ErrorOf<DpiResolution>(\n'
      '          message: \'Error deserializing json to DpiResolution.\',\n'
      '          invalidState: \'json[index] returned null.\',\n'
      '          expectedState: \'A map entry: {index: int value}.\');\n'
      '    }\n'
      '    if (index >= 0 && index < DpiResolution.values.length) {\n'
      '      return DpiResolution.values[index];\n'
      '    } else {\n'
      '      throw ErrorOf<DpiResolution>(\n'
      '          message: \'Function fromJson could not find \'\n'
      '              \'an instance of type DpiResolution.\',\n'
      '          invalidState: \'DpiResolution.values[\$index] out of bounds.\');\n'
      '    }\n'
      '  }\n'
      '\n'
      '  /// Converts `this` to a map `Map<String, dynamic>`.\n'
      '  Map<String, dynamic> toJson() =>\n'
      '      {\'index\': DpiResolution.values.indexOf(this)};\n'
      '\n'
      '  /// Converts `this` to a json encoded `String`.\n'
      '  String get jsonEncoded => \'{"index":\${DpiResolution.values.indexOf(this)}}\';\n'
      '}\n'
      '';

  String expectedValueVector =
      '/// Extension on `DpiResolution` providing value-getters.\n'
      'extension DpiResolutionValue on DpiResolution {\n'
      '  /// Returns value of type <double> mapped to\n'
      '  /// an instance of `DpiResolution`.\n'
      '  double get value => const <DpiResolution, double>{\n'
      '        DpiResolution.low: 90.0,\n'
      '        DpiResolution.medium: 300.0,\n'
      '        DpiResolution.high: 600.0,\n'
      '      }[this]!;\n'
      '\n'
      '  /// Returns the String identifier of an instance of `DpiResolution`.\n'
      '  String get stringValue => const <DpiResolution, String>{\n'
      '        DpiResolution.low: \'low\',\n'
      '        DpiResolution.medium: \'medium\',\n'
      '        DpiResolution.high: \'high\',\n'
      '      }[this]!;\n'
      '\n'
      '  /// Returns a mapping of instance name to enum instance.\n'
      '  Map<String, DpiResolution> get valueMap => const <String, DpiResolution>{\n'
      '        \'low\': DpiResolution.low,\n'
      '        \'medium\': DpiResolution.medium,\n'
      '        \'high\': DpiResolution.high,\n'
      '      };\n'
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
