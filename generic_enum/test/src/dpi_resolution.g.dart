// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dpi_resolution.dart';

// **************************************************************************
// ValueGenerator
// **************************************************************************

/// Extension on `DpiResolution` providing value-getters.
extension DpiResolutionValue on DpiResolution {
  /// Returns the mapped double value of
  /// an instance of `DpiResolution`.
  double get value => const <DpiResolution, double>{
        DpiResolution.LOW: 90.0,
        DpiResolution.MEDIUM: 300.0,
        DpiResolution.HIGH: 600.0,
      }[this]!;

  /// Returns the String identifier of an instance of `DpiResolution`.
  String get stringValue => const <DpiResolution, String>{
        DpiResolution.LOW: 'LOW',
        DpiResolution.MEDIUM: 'MEDIUM',
        DpiResolution.HIGH: 'HIGH',
      }[this]!;
}

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Extension providing the functions `fromJson()`, `toJson()`,
/// and the getter `jsonEncoded`.
extension ToDpiResolution on DpiResolution {
  /// Converts [json] to an instance of `DpiResolution`.
  static DpiResolution fromJson(Map<String, dynamic> json) {
    final index = (json['index']) as int?;
    if (index == null) {
      throw ErrorOf<DpiResolution>(
          message: 'Error deserializing json to DpiResolution.',
          invalidState: 'json[index] returned null.',
          expectedState: 'A map entry: {index: int value}.');
    }
    if (index >= 0 && index < DpiResolution.values.length) {
      return DpiResolution.values[index];
    } else {
      throw ErrorOf<DpiResolution>(
          message: 'Function fromJson could not find '
              'an instance of type DpiResolution.',
          invalidState: 'DpiResolution.values[$index] out of bounds.');
    }
  }

  /// Converts `this` to a map `Map<String, dynamic>`.
  Map<String, dynamic> toJson() =>
      {'index': DpiResolution.values.indexOf(this)};

  /// Converts `this` to a json encoded `String`.
  String get jsonEncoded => '{"index":${DpiResolution.values.indexOf(this)}}';
}
