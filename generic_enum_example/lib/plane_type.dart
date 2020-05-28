import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart';

part 'plane_type.g.dart';

/// Sample generic enum class supporting json-serialization.
@GenerateValueMap()
@GenerateFromJson()
class PlaneType extends GenericEnum<int> {
  const PlaneType._(int value) : super(value);

  static const PlaneType AB707 = PlaneType._(707);
  static const PlaneType AB747 = PlaneType._(747);

  static Map<int, PlaneType> get valueMap => _$PlaneTypeValueMap;

  factory PlaneType.fromJson(Map<String, dynamic> json) =>
      _$PlaneTypeFromJson(json);
}
