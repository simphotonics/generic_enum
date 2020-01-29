// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

Direction _fromJson(Map<String, dynamic> json) {
  String value = GenericEnum.fromJson(json).value;
  Direction instance = Direction.valueMap[value];
  if (instance == null) {
    String msg = 'Could not find Direction instance with value: $value.';
    throw GenericEnumException(msg);
  }
  return instance;
}

// **************************************************************************
// MapGenerator
// **************************************************************************

final _valueMap = BuiltMap<String, Direction>({
  Direction.NORTH.value: Direction.NORTH,
  Direction.EAST.value: Direction.EAST,
  Direction.SOUTH.value: Direction.SOUTH,
  Direction.WEST.value: Direction.WEST
});
