// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dpi_resolution.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

Map<String, dynamic> _toJson(DpiResolution instance) => instance.toJson();

DpiResolution fromJson(Map<String, dynamic> json) {
  int value = GenericEnum.fromJson(json).value;
  return DpiResolution.valueMap[value];
}

// **************************************************************************
// MapGenerator
// **************************************************************************

final _valueMap = BuiltMap<int, DpiResolution>({
  DpiResolution.LOW.value: DpiResolution.LOW,
  DpiResolution.MEDIUM.value: DpiResolution.MEDIUM,
  DpiResolution.HIGH.value: DpiResolution.HIGH
});
