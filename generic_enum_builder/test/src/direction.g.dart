// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

Map<String, dynamic> _toJson(Direction instance) => instance.toJson();

Direction fromJson(Map<String, dynamic> json) {
  String value = GenericEnum.fromJson(json).value;
  return Direction.valueMap[value];
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
