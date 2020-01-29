// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_part.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

NamePart _fromJson(Map<String, dynamic> json) {
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

final _valueMap = BuiltMap<String, NamePart>({
  NamePart.FIRST_NAME.value: NamePart.FIRST_NAME,
  NamePart.LAST_NAME.value: NamePart.LAST_NAME
});
