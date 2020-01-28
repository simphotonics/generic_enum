// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_part.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

Map<String, dynamic> _toJson(NamePart instance) => instance.toJson();

NamePart fromJson(Map<String, dynamic> json) {
  String value = GenericEnum.fromJson(json).value;
  return NamePart.valueMap[value];
}

// **************************************************************************
// MapGenerator
// **************************************************************************

final _valueMap = BuiltMap<String, NamePart>({
  NamePart.FIRST_NAME.value: NamePart.FIRST_NAME,
  NamePart.LAST_NAME.value: NamePart.LAST_NAME
});
