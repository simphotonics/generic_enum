// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dpi_resolution.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Converts a map [Map<String, dynamic>] to an instance of [DpiResolution].
/// Add the following factory constructor to your class definition:
/// ```
/// factory DpiResolution.fromJson(Map<String, dynamic> json) =>
///   _$DpiResolutionFromJson(json);
/// ```
DpiResolution _$DpiResolutionFromJson(Map<String, dynamic> json) {
  int value = GenericEnum.fromJson(json).value;
  DpiResolution instance = _$DpiResolutionValueMap[value];
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

/// Maps a value of type [int] to an instance of [DpiResolution].
/// Add the following getter to your class definition:
/// ```
/// static Map<int,DpiResolution> get valueMap => _$DpiResolutionValueMap;
/// ```
final _$DpiResolutionValueMap = Map<int, DpiResolution>.unmodifiable({
  DpiResolution.LOW.value: DpiResolution.LOW,
  DpiResolution.MEDIUM.value: DpiResolution.MEDIUM,
  DpiResolution.HIGH.value: DpiResolution.HIGH,
});
