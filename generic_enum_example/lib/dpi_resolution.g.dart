// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dpi_resolution.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

DpiResolution _fromJson(Map<String, dynamic> json) {
  int value = GenericEnum.fromJson(json).value;
  DpiResolution instance = DpiResolution.valueMap[value];
  if (instance == null) {
    String msg = 'Could not find DpiResolution instance with value: $value.';
    throw GenericEnumException(msg);
  }
  return instance;
}

// **************************************************************************
// MapGenerator
// **************************************************************************

final _valueMap = BuiltMap<int, DpiResolution>({
  DpiResolution.LOW.value: DpiResolution.LOW,
  DpiResolution.MEDIUM.value: DpiResolution.MEDIUM,
  DpiResolution.HIGH.value: DpiResolution.HIGH
});
