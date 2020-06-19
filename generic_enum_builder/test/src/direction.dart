import 'package:generic_enum/generic_enum.dart';

part 'direction.test_sample.dart';

@GenerateFromJson()
class Direction extends GenericEnum<String> {
  const Direction._(String value) : super(value);

  static const NORTH = Direction._('NORTH');
  static const EAST = Direction._('EAST');
  static const SOUTH = Direction._('SOUTH');
  static const WEST = Direction._('WEST');
  static Map<String, Direction> get valueMap => _$DirectionValueMap;

  factory Direction.fromJson(Map<String, dynamic> json) =>
      _$DirectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DirectionToJson(this);
}
