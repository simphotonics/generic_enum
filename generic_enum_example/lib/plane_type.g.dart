// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plane_type.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

Map<String, dynamic> _toJson(PlaneType instance) => instance.toJson();

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
