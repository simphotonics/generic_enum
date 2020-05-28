// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_part.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Converts a map [Map<String, dynamic>] to an instance of [NamePart].
/// Add the following factory constructor to your class definition:
/// ```
/// factory NamePart.fromJson(Map<String, dynamic> json) =>
///   _$NamePartFromJson(json);
/// ```
NamePart _$NamePartFromJson(Map<String, dynamic> json) {
  String value = GenericEnum.fromJson(json).value;
  NamePart instance = _$NamePartValueMap[value];
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

/// Maps a value of type [String] to an instance of [NamePart].
/// Add the following getter to your class definition:
/// ```
/// static Map<String,NamePart> get valueMap => _$NamePartValueMap;
/// ```
final _$NamePartValueMap = Map<String, NamePart>.unmodifiable({
  NamePart.FIRST_NAME.value: NamePart.FIRST_NAME,
  NamePart.LAST_NAME.value: NamePart.LAST_NAME,
});
