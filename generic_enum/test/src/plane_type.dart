import 'package:generic_enum/generic_enum.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

PlaneType _$PlaneTypeFromJson(Map<String, dynamic> json) {
  int value = GenericEnum.fromJson(json).value;
  PlaneType instance = PlaneType.valueMap[value];
  if (instance == null) {
    String msg = 'Could not find PlaneType instance with value: $value.';
    throw GenericEnumException(msg);
  }
  return instance;
}

// **************************************************************************
// MapGenerator
// **************************************************************************

final _$PlantTypeValueMap = Map<int, PlaneType>.unmodifiable({
  PlaneType.AB707.value: PlaneType.AB707,
  PlaneType.AB747.value: PlaneType.AB747
});

/// Sample Generic Enum Class used for testing
/// Note: The functions and variables above can be built automatically
/// For details see the file: ../../README.md.
class PlaneType extends GenericEnum<int> {
  const PlaneType._(int value) : super(value);

  static const PlaneType AB707 = PlaneType._(707);
  static const PlaneType AB747 = PlaneType._(747);

  static Map<int, PlaneType> get valueMap => _$PlantTypeValueMap;

  factory PlaneType.fromJson(Map<String, dynamic> json) =>
      _$PlaneTypeFromJson(json);
}
