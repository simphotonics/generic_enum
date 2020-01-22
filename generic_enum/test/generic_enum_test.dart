import 'package:built_collection/built_collection.dart';
import 'package:test/test.dart';
import 'package:generic_enum/generic_enum.dart';

class NamePart extends GenericEnum<String> {
  const NamePart._(String value) : super(value);

  static const NamePart FIRST_NAME = NamePart._('FIRST_NAME');

  static const NamePart LAST_NAME = NamePart._('LAST_NAME');

  static final valueMap = BuiltMap<String,NamePart>({
    'FIRST_NAME': FIRST_NAME,
    'LAST_NAME': LAST_NAME,
  });
}

class PlaneType extends GenericEnum<int> {
  const PlaneType._(int value) : super(value);

  static const PlaneType AB707 = PlaneType._(707);
  static const PlaneType AB747 = PlaneType._(747);

  static final valueMap = BuiltMap<int, PlaneType>({
    707: AB707,
    747: AB747,
  });
}

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
    test('Retrieve instance', () {
      expect(NamePart.FIRST_NAME, NamePart.valueMap[NamePart.FIRST_NAME.value]);
    });
  });

  group('Serialization:', () {
    test('String value', () {
      expect(NamePart.FIRST_NAME.toJson(), {'value': NamePart.FIRST_NAME.value});
    });
    test('Int value', () {
      expect(PlaneType.AB747.toJson(), {'value': PlaneType.AB747.value});
    });
  });

  group('Deserialization:', () {
    test('String value', () {
      expect(GenericEnum<String>('lorem'), GenericEnum<String>.fromJson({'value': 'lorem'}));
    });
    test('Int value', () {
      expect(PlaneType.AB747.toJson(), {'value': PlaneType.AB747.value});
    });
  });



}
