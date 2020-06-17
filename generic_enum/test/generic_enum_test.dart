import 'dart:convert';

import 'package:test/test.dart';
import 'src/complex.dart';
import 'src/name_part.dart';
import 'src/plane_type.dart';

void main() {
  group('Get value of enum:', () {
    test('Get String value', () {
      expect(NamePart.FIRST_NAME.value, 'FIRST_NAME');
    });
    test('Get int value', () {
      expect(PlaneType.AB707.value, 707);
    });
  });

  group('Testing valueMap getter:', () {
    test('Retrieve instance of NamePart', () {
      expect(NamePart.FIRST_NAME, NamePart.valueMap[NamePart.FIRST_NAME.value]);
    });
    test('Retrieve instance of PlaneType', () {
      expect(PlaneType.AB707, PlaneType.valueMap[PlaneType.AB707.value]);
    });
  });

  group('toJson():', () {
    test('String value', () {
      expect(NamePart.FIRST_NAME.toJson(), {'key': 0});
    });
    test('Int value', () {
      expect(PlaneType.AB747.toJson(), {'key': 1});
    });
    test('Complex value', () {
      expect(ComplexConstant.i.toJson(), {'key': 0});
    });
  });

  group('fromJson():', () {
    test('String value', () {
      expect(
        NamePart.LAST_NAME,
        NamePart.fromJson({'key': 1}),
      );
    });
    test('Int value', () {
      expect(
        PlaneType.AB707,
        PlaneType.fromJson({'key': 0}),
      );
    });
    test('Complex value', () {
      expect(ComplexConstant.i, ComplexConstant.fromJson({'key': 0}));
    });
  });
  group('Serialization:', () {
    test('GenericEnum<Int>', () {
      expect(jsonEncode(PlaneType.AB707), '{"key":0}');
    });
    test('GenericEnum<Complex>', () {
      expect(jsonEncode(ComplexConstant.i), '{"key":0}');
    });
  });
  group('De-Serialization:', () {
    test('GenericEnum<Int>', () {
      expect(
        PlaneType.AB707,
        PlaneType.fromJson(
          jsonDecode('{"key":0}'),
        ),
      );
    });
    test('GenericEnum<Complex>', () {
        expect(
        ComplexConstant.i,
        ComplexConstant.fromJson(
          jsonDecode('{"key":0}'),
        ),
      );
    });
  });
}
