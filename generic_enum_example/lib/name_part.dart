import 'package:generic_enum/generic_enum.dart';

part 'name_part.g.dart';

/// Sample generic enum class supporting json-serialization.
@GenerateValueMap()
@GenerateFromToJson()
class NamePart extends GenericEnum<String> {
  const NamePart._(String value) : super(value);

  static const NamePart FIRST_NAME = NamePart._('FIRST_NAME');

  static const NamePart LAST_NAME = NamePart._('LAST_NAME');

  static Map<String, NamePart> get valueMap => _$NamePartValueMap;

  factory NamePart.fromJson(Map<String, dynamic> json) =>
      _$NamePartFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NamePartToJson(this);
}
