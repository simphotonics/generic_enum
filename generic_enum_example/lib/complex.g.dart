// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Extension providing the functions `fromJson` and `toJson`.
extension ToComplexConstant on ComplexConstant {
  /// Converts [json] to an instance of `ComplexConstant`.
  static ComplexConstant fromJson(Map<String, dynamic> json) {
    final index = (json['index']) as int;
    if (index == null) {
      throw ErrorOf<ComplexConstant>(
          message: 'Error deserializing json to ComplexConstant.',
          invalidState: 'json[index] returned null.',
          expectedState: 'A map entry: {index: int value}.');
    }
    if (index >= 0 && index < ComplexConstant.values.length) {
      return ComplexConstant.values[index];
    } else {
      throw ErrorOf<ComplexConstant>(
          message: 'Function fromJson could not find '
              'an instance of type ComplexConstant.',
          invalidState: 'ComplexConstant.values[$index] out of bounds.');
    }
  }

  /// Converts `this` to a map `Map<String, dynamic>`.
  Map<String, dynamic> toJson() =>
      {'index': ComplexConstant.values.indexOf(this)};

  /// Converts `this` to a json encoded `String`.
  String get jsonEncoded => '{"index":${ComplexConstant.values.indexOf(this)}}';
}
