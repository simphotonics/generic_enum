// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

Direction _$DirectionFromJson(Map<String, dynamic> json) {
  String value = GenericEnum.fromJson(json).value;
  Direction instance = Direction.valueMap[value];
  if (instance == null) {
    throw GenericEnumException(
      'Could not find Direction instance with value: $value.',
    );
  }
  return instance;
}

// **************************************************************************
// MapGenerator
// **************************************************************************

final _$DirectionValueMap = Map<String, Direction>.unmodifiable({
  Direction.NORTH.value: Direction.NORTH,
  Direction.EAST.value: Direction.EAST,
  Direction.SOUTH.value: Direction.SOUTH,
  Direction.WEST.value: Direction.WEST
});
