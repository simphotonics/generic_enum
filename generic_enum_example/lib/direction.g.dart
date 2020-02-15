// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Maps a value of type [String] to an instance of [Direction].
/// Add the following getter to your class definition:
/// ```
/// static Map<String,Direction> get valueMap => _$DirectionValueMap;
/// ```
final _$DirectionValueMap = Map<String, Direction>.unmodifiable({
  Direction.NORTH.value: Direction.NORTH,
  Direction.EAST.value: Direction.EAST,
  Direction.SOUTH.value: Direction.SOUTH,
  Direction.WEST.value: Direction.WEST
});

/// Converts a map [Map<String, dynamic>] to an instance of [Direction].
/// Add the following factory constructor to your class definition:
/// ```
/// factory Direction.fromJson(Map<String, dynamic> json) =>
///   _$DirectionFromJson(json);
/// ```
Direction _$DirectionFromJson(Map<String, dynamic> json) {
  String value = GenericEnum.fromJson(json).value;
  Direction instance = _$DirectionValueMap[value];
  if (instance == null) {
    throw GenericEnumException(
      'Could not find Direction instance with value: $value.',
    );
  }
  return instance;
}
