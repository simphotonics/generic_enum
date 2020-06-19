// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Converts an instance of [Direction] to a map [Map<String, dynamic>].
/// Add the following method to your class definition:
/// ```
///  @override
///  Map<String, dynamic> toJson() => _$DirectionToJson(this);
/// ```
Map<String, dynamic> _$DirectionToJson(Direction instance) =>
    {'key': _$DirectionValueMap.values.toList().indexOf(instance)};

/// Converts a map [Map<String, dynamic>] to an instance of [Direction].
/// Add the following factory constructor to your class definition:
/// ```
/// factory Direction.fromJson(Map<String, dynamic> json) =>
///   _$DirectionFromJson(json);
/// ```
Direction _$DirectionFromJson(Map<String, dynamic> json) {
  final key = (json['key']) as int;
  Direction instance = _$DirectionValueMap.values.toList()[key];
  if (instance == null) {
    throw GenericEnumException(
        '.fromJson constructor: Could not find a matching instance of type Direction.');
  }
  return instance;
}

// **************************************************************************
// MapGenerator
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
  Direction.WEST.value: Direction.WEST,
});
