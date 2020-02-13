import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart';

///   0. Add a part instruction pointing to generated file.
part 'direction.g.dart';

/// Sample generic enum class supporting json-serialization.
/// 1. Annotate class
@GenerateFromJson()
@GenerateValueMap()

/// 2. Extend GenericEnum<T>
class Direction extends GenericEnum<String> {
  /// 3. Define a private const constructor that calls the
  ///    super constructor and passes on the value of type String.
  const Direction._(String value) : super(value);

  /// 4. Define static constant instances of type Direction.
  static const NORTH = Direction._('NORTH');
  static const EAST = Direction._('EAST');
  static const SOUTH = Direction._('SOUTH');
  static const WEST = Direction._('WEST');

  /// 5. Provide access to the map _$DirectionValueMap.
  static Map<String, Direction> get valueMap => _$DirectionValueMap;

  /// 6. Define the factory constructor .fromJson
  factory Direction.fromJson(Map<String, dynamic> json) =>
      _$DirectionFromJson(json);
}
