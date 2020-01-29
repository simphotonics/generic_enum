import 'package:built_collection/built_collection.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart';

part 'direction.test_sample.dart';

@GenerateFromJson()
@GenerateBuiltMap()
class Direction extends GenericEnum<String> {
  const Direction._(String value) : super(value);

  static const NORTH = Direction._('NORTH');
  static const EAST = Direction._('EAST');
  static const SOUTH = Direction._('SOUTH');
  static const WEST = Direction._('WEST');
  static BuiltMap<String, Direction> get valueMap => _valueMap;

  factory Direction.fromJson(Map<String, dynamic> json) => _fromJson(json);
}
