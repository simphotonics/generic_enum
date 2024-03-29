import 'dart:convert';
import 'package:exception_templates/exception_templates.dart';
import 'package:test/test.dart';

import 'src/complex.dart';
import 'src/dpi_resolution.dart';

void main() {
  group('Mapped value:', () {
    test('complex', () {
      expect(ComplexConstant.i.value, Complex(0, 1));
    });
    test('double', () {
      expect(DpiResolution.high.value, 600.0);
    });
  });
  group('String value:', () {
    test('Complex', () {
      expect(ComplexConstant.i.stringValue, 'i');
    });
    test('DpiResolution', () {
      expect(DpiResolution.high.stringValue, 'high');
    });
  });

  group('toJson():', () {
    test('complex', () {
      expect(ComplexConstant.i.toJson(), {'index': 1});
    });
    test('double', () {
      expect(DpiResolution.low.toJson(), {'index': 0});
    });
    test('jsonEncoded', () {
      expect(
        jsonEncode(DpiResolution.low.toJson()),
        DpiResolution.low.jsonEncoded,
      );
    });
  });

  group('fromJson():', () {
    test('complex', () {
      expect(
        ComplexConstant.i,
        ToComplexConstant.fromJson({'index': 1}),
      );
    });
    test('double', () {
      expect(
        DpiResolution.high,
        ToDpiResolution.fromJson({'index': 2}),
      );
    });
  });
  group('Serialization:', () {
    test('ComplexConstant', () {
      expect(ComplexConstant.i.jsonEncoded, '{"index":1}');
    });
    test('DpiResolution', () {
      expect(DpiResolution.medium.jsonEncoded, '{"index":1}');
    });
    test('jsonEncode()', () {
      expect(jsonEncode(DpiResolution.low.toJson()), '{"index":0}');
    });
  });
  group('De-Serialization:', () {
    test('ComplexConstant', () {
      expect(
        ComplexConstant.i,
        ToComplexConstant.fromJson(
          jsonDecode('{"index":1}'),
        ),
      );
    });
    test('DpiResolution', () {
      expect(
        DpiResolution.medium,
        ToDpiResolution.fromJson(
          jsonDecode('{"index":1}'),
        ),
      );
    });
  });
  group('Error:', () {
    test('invalid json: missing index', () {
      try {
        ToDpiResolution.fromJson({'index': null});
      } on ErrorOf<DpiResolution> catch (e) {
        expect(e, isA<ErrorOf<DpiResolution>>());
      } catch (e) {
        expect(e, null, reason: 'Error should have been caught above.');
      }
    });
    test('invalid json: index out of bounds', () {
      try {
        ToDpiResolution.fromJson({'index': 5});
      } on ErrorOf<DpiResolution> catch (e) {
        expect(e, isA<ErrorOf<DpiResolution>>());
      } catch (e) {
        expect(e, null, reason: 'Error should have been caught above.');
      }
    });
  });
}
