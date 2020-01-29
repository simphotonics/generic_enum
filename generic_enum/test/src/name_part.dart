import 'package:built_collection/built_collection.dart';
import 'package:generic_enum/generic_enum.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

NamePart _$NamePartFromJson(Map<String, dynamic> json) {
  String value = GenericEnum.fromJson(json).value;
  NamePart instance = NamePart.valueMap[value];
  if (instance == null) {
    String msg = 'Could not find NamePart instance with value: $value.';
    throw GenericEnumException(msg);
  }
  return instance;
}

// **************************************************************************
// MapGenerator
// **************************************************************************

final _$NamePartValueMap = BuiltMap<String, NamePart>({
  NamePart.FIRST_NAME.value: NamePart.FIRST_NAME,
  NamePart.LAST_NAME.value: NamePart.LAST_NAME
});

/// Sample GenericEnum Class used for testing.
/// Note: The functions and variables above can be built automatically
/// For details see the file: ../../README.md.
class NamePart extends GenericEnum<String> {
  const NamePart._(String value) : super(value);

  static const NamePart FIRST_NAME = NamePart._('FIRST_NAME');

  static const NamePart LAST_NAME = NamePart._('LAST_NAME');

  static BuiltMap<String, NamePart> get valueMap => _$NamePartValueMap;

  factory NamePart.fromJson(Map<String, dynamic> json) =>
      _$NamePartFromJson(json);
}
