import 'package:test/test.dart';
import 'package:generic_enum/generic_enum.dart';

class NamePart extends GenericEnum<String> {
  const NamePart._(String value) : super(value);

  static const NamePart FIRST_NAME = NamePart._('FIRST_NAME');

  static const NamePart LAST_NAME = NamePart._('LAST_NAME');

  static const Map<String, NamePart> _valueMap = {
    'FIRST_NAME': FIRST_NAME,
    'LAST_NAME': LAST_NAME,
  };
  static get valueMap => _valueMap;
}

void main() {
  group('Class that extends GenericEnum<String>:', () {
    test('Literal string value', () {
      expect(NamePart.FIRST_NAME.value, 'FIRST_NAME');
    });
  });

  group('Testing valueMap getter:', () {
    test('Retrieve instance', () {
      expect(NamePart.FIRST_NAME, NamePart.valueMap[NamePart.FIRST_NAME.value]);
    });
  });
}
