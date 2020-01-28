import 'package:built_collection/built_collection.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart';

part 'plane_type.g.dart';

@GenerateBuiltMap()
@GenerateToFromJson()
class PlaneType extends GenericEnum<int> {
  const PlaneType._(int value) : super(value);

  static const PlaneType AB707 = PlaneType._(707);
  static const PlaneType AB747 = PlaneType._(747);

  static BuiltMap<int, PlaneType> get valueMap => _valueMap;

  Map<String, dynamic> toJson() => _toJson(this);
}
