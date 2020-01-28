import 'package:built_collection/built_collection.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************
PlaneType fromJson(Map<String, dynamic> json) {
  int value = GenericEnum.fromJson(json).value;
  return PlaneType.valueMap[value];
}

// **************************************************************************
// MapGenerator
// **************************************************************************

final _valueMap = BuiltMap<int, PlaneType>({
  PlaneType.AB707.value: PlaneType.AB707,
  PlaneType.AB747.value: PlaneType.AB747
});

/// Sample Generic Enum Class used for testing
/// Note: The functions and variables above can be built automatically
/// For details see the file: ../../README.md.
@GenerateBuiltMap()
@GenerateToFromJson()
class PlaneType extends GenericEnum<int> {
  const PlaneType._(int value) : super(value);

  static const PlaneType AB707 = PlaneType._(707);
  static const PlaneType AB747 = PlaneType._(747);

  static BuiltMap<int, PlaneType> get valueMap => _valueMap;

  factory PlaneType.fromJson(Map<String, dynamic> json) => fromJson(json);
}
