// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_part.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

NamePart _$NamePartFromJson(Map<String, dynamic> json) {
  String value = GenericEnum.fromJson(json).value;
  NamePart instance = NamePart.valueMap[value];
  if (instance == null) {
    throw GenericEnumException(
      'Could not find NamePart instance with value: $value.',
    );
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
