// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plane_type.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Maps a value of type [int] to an instance of [PlaneType].
/// Add the following getter to your class definition:
/// ```
/// static Map<int,PlaneType> get valueMap => _$PlaneTypeValueMap;
/// ```
final _$PlaneTypeValueMap = Map<int, PlaneType>.unmodifiable({
  PlaneType.AB707.value: PlaneType.AB707,
  PlaneType.AB747.value: PlaneType.AB747
});

/// Converts a map [Map<String, dynamic>] to an instance of [PlaneType].
/// Add the following factory constructor to your class definition:
/// ```
/// factory PlaneType.fromJson(Map<String, dynamic> json) =>
///   _$PlaneTypeFromJson(json);
/// ```
PlaneType _$PlaneTypeFromJson(Map<String, dynamic> json) {
  int value = GenericEnum.fromJson(json).value;
  PlaneType instance = _$PlaneTypeValueMap[value];
  if (instance == null) {
    throw GenericEnumException(
      'Could not find PlaneType instance with value: $value.',
    );
  }
  return instance;
}
