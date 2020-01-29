// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dpi_resolution.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

DpiResolution _$DpiResolutionFromJson(Map<String, dynamic> json) {
  int value = GenericEnum.fromJson(json).value;
  DpiResolution instance = DpiResolution.valueMap[value];
  if (instance == null) {
    throw GenericEnumException(
      'Could not find DpiResolution instance with value: $value.',
    );
  }
  return instance;
}

// **************************************************************************
// MapGenerator
// **************************************************************************

final _$DpiResolutionValueMap = BuiltMap<int, DpiResolution>({
  DpiResolution.LOW.value: DpiResolution.LOW,
  DpiResolution.MEDIUM.value: DpiResolution.MEDIUM,
  DpiResolution.HIGH.value: DpiResolution.HIGH
});
