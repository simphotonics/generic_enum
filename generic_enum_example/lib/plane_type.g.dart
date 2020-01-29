// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plane_type.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

PlaneType _fromJson(Map<String, dynamic> json) {
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

final _valueMap = BuiltMap<int, PlaneType>({
  PlaneType.AB707.value: PlaneType.AB707,
  PlaneType.AB747.value: PlaneType.AB747
});
