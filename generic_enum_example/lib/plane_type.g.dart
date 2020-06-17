// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plane_type.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Converts an instance of [PlaneType] to a map [Map<String, dynamic>].
/// Add the following method to your class definition:
/// ```
///  Map<String, dynamic> toJson() => _$PlaneTypeToJson(this);
/// ```
Map<String, dynamic> _$PlaneTypeToJson(PlaneType instance) =>
    {'key': _$PlaneTypeValueMap.values.toList().indexOf(instance)};

/// Converts a map [Map<String, dynamic>] to an instance of [PlaneType].
/// Add the following factory constructor to your class definition:
/// ```
/// factory PlaneType.fromJson(Map<String, dynamic> json) =>
///   _$PlaneTypeFromJson(json);
/// ```
PlaneType _$PlaneTypeFromJson(Map<String, dynamic> json) {
  final key = (json['key']) as int;
  PlaneType instance = _$PlaneTypeValueMap.values.toList()[key];
  if (instance == null) {
    throw GenericEnumException(
        '.fromJson constructor: Could not find a matching instance of type PlaneType.');
  }
  return instance;
}

// **************************************************************************
// MapGenerator
// **************************************************************************

/// Maps a value of type [int] to an instance of [PlaneType].
/// Add the following getter to your class definition:
/// ```
/// static Map<int,PlaneType> get valueMap => _$PlaneTypeValueMap;
/// ```
final _$PlaneTypeValueMap = Map<int, PlaneType>.unmodifiable({
  PlaneType.AB707.value: PlaneType.AB707,
  PlaneType.AB747.value: PlaneType.AB747,
});
