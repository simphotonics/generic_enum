// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dpi_resolution.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Converts an instance of [DpiResolution] to a map [Map<String, dynamic>].
/// Add the following method to your class definition:
/// ```
///  Map<String, dynamic> toJson() => _$DpiResolutionToJson(this);
/// ```
Map<String, dynamic> _$DpiResolutionToJson(DpiResolution instance) =>
    {'key': _$DpiResolutionValueMap.values.toList().indexOf(instance)};

/// Converts a map [Map<String, dynamic>] to an instance of [DpiResolution].
/// Add the following factory constructor to your class definition:
/// ```
/// factory DpiResolution.fromJson(Map<String, dynamic> json) =>
///   _$DpiResolutionFromJson(json);
/// ```
DpiResolution _$DpiResolutionFromJson(Map<String, dynamic> json) {
  final key = (json['key']) as int;
  DpiResolution instance = _$DpiResolutionValueMap.values.toList()[key];
  if (instance == null) {
    throw GenericEnumException(
        '.fromJson constructor: Could not find a matching instance of type DpiResolution.');
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
