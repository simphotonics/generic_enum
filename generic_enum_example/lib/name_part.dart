import 'package:built_collection/built_collection.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart';

part 'name_part.g.dart';

@GenerateBuiltMap()
@GenerateToFromJson()
class NamePart extends GenericEnum<String> {
  const NamePart._(String value) : super(value);

  static const NamePart FIRST_NAME = NamePart._('FIRST_NAME');

  static const NamePart LAST_NAME = NamePart._('LAST_NAME');

  static BuiltMap<String, NamePart> get valueMap => _valueMap;

  Map<String, dynamic> toJson() => _toJson(this);
}