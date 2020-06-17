// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Converts an instance of [ComplexConstant] to a map [Map<String, dynamic>].
/// Add the following method to your class definition:
/// ```
///  Map<String, dynamic> toJson() => _$ComplexConstantToJson(this);
/// ```
Map<String, dynamic> _$ComplexConstantToJson(ComplexConstant instance) =>
    {'key': _$ComplexConstantValueMap.values.toList().indexOf(instance)};

/// Converts a map [Map<String, dynamic>] to an instance of [ComplexConstant].
/// Add the following factory constructor to your class definition:
/// ```
/// factory ComplexConstant.fromJson(Map<String, dynamic> json) =>
///   _$ComplexConstantFromJson(json);
/// ```
ComplexConstant _$ComplexConstantFromJson(Map<String, dynamic> json) {
  final key = (json['key']) as int;
  ComplexConstant instance = _$ComplexConstantValueMap.values.toList()[key];
  if (instance == null) {
    throw GenericEnumException(
        '.fromJson constructor: Could not find matching instance of type ComplexConstant.');
  }
  return instance;
}

// **************************************************************************
// MapGenerator
// **************************************************************************

/// Maps a value of type [Complex] to an instance of [ComplexConstant].
/// Add the following getter to your class definition:
/// ```
/// static Map<Complex,ComplexConstant> get valueMap => _$ComplexConstantValueMap;
/// ```
final _$ComplexConstantValueMap = Map<Complex, ComplexConstant>.unmodifiable({
  ComplexConstant.i.value: ComplexConstant.i,
});
