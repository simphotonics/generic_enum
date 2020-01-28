import 'package:test/test.dart';
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

  group('Serialization:', () {
    test('String value', () {
      expect(
          NamePart.FIRST_NAME.toJson(), {'value': NamePart.FIRST_NAME.value});
    });
    test('Int value', () {
      expect(PlaneType.AB747.toJson(), {'value': PlaneType.AB747.value});
    });
  });

  group('DeSerialization:', () {
    test('String value', () {
      expect(
        NamePart.LAST_NAME,
        NamePart.fromJson({'value': NamePart.LAST_NAME.value}),
      );
    });
    test('Int value', () {
      expect(
        PlaneType.AB707,
        PlaneType.fromJson({'value': PlaneType.AB707.value}),
      );
    });
  });
}
