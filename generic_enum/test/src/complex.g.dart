// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex.dart';

// **************************************************************************
// ValueGenerator
// **************************************************************************

/// Extension on `ComplexConstant` providing value-getters.
extension ComplexConstantValue on ComplexConstant {
  /// Returns a map of type `Map<Complex, ComplexConstant>` mapping
  /// each declared enum value to an instance of `ComplexConstant`.
  Complex get value => const <ComplexConstant, Complex>{
        ComplexConstant.zero: Complex(0, 0),
        ComplexConstant.i: Complex(0, 1),
      }[this]!;

  /// Returns the String identifier of an instance of `ComplexConstant`.
  String get stringValue => const <ComplexConstant, String>{
        ComplexConstant.zero: 'zero',
        ComplexConstant.i: 'i',
      }[this]!;

  /// Returns a mapping of instance name to enum instance.
  Map<String, ComplexConstant> get valueMap => const <String, ComplexConstant>{
        'zero': ComplexConstant.zero,
        'i': ComplexConstant.i,
      };
}

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Extension providing the functions `fromJson()`, `toJson()`,
/// and the getter `jsonEncoded`.
extension ToComplexConstant on ComplexConstant {
  /// Converts [json] to an instance of `ComplexConstant`.
  static ComplexConstant fromJson(Map<String, dynamic> json) {
    final index = (json['index']) as int?;
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
