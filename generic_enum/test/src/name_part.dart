import 'package:generic_enum/generic_enum.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Converts an instance of [NamePart] to a map [Map<String, dynamic>].
/// Add the following method to your class definition:
/// ```
///  Map<String, dynamic> toJson() => _$NamePartToJson(this);
/// ```
Map<String, dynamic> _$NamePartToJson(NamePart instance) =>
    {'key': _$NamePartValueMap.values.toList().indexOf(instance)};

/// Converts a map [Map<String, dynamic>] to an instance of [NamePart].
/// Add the following factory constructor to your class definition:
/// ```
/// factory NamePart.fromJson(Map<String, dynamic> json) =>
///   _$NamePartFromJson(json);
/// ```
NamePart _$NamePartFromJson(Map<String, dynamic> json) {
  final key = (json['key']) as int;
  NamePart instance = _$NamePartValueMap.values.toList()[key];
  if (instance == null) {
    throw GenericEnumException(
        '.fromJson constructor: Could not find a matching instance of type NamePart.');
  }
  return instance;
}

// **************************************************************************
// MapGenerator
// **************************************************************************

/// Maps a value of type [String] to an instance of [NamePart].
/// Add the following getter to your class definition:
/// ```
/// static Map<String,NamePart> get valueMap => _$NamePartValueMap;
/// ```
final _$NamePartValueMap = Map<String, NamePart>.unmodifiable({
  NamePart.FIRST_NAME.value: NamePart.FIRST_NAME,
  NamePart.LAST_NAME.value: NamePart.LAST_NAME,
});


/// Sample GenericEnum Class used for testing.
/// Note: The functions and variables above can be built automatically
/// For details see the file: ../../README.md.
class NamePart extends GenericEnum<String> {
  const NamePart._(String value) : super(value);

  static const NamePart FIRST_NAME = NamePart._('FIRST_NAME');

  static const NamePart LAST_NAME = NamePart._('LAST_NAME');

  static Map<String, NamePart> get valueMap => _$NamePartValueMap;

  factory NamePart.fromJson(Map<String, dynamic> json) =>
      _$NamePartFromJson(json);

  Map<String, dynamic> toJson() => _$NamePartToJson(this);
}
