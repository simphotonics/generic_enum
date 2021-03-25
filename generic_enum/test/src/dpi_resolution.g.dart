// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dpi_resolution.dart';

// **************************************************************************
// ValueGenerator
// **************************************************************************

/// Extension on `DpiResolution` providing value-getters.
extension DpiResolutionValue on DpiResolution {
  /// Returns value of type <double> mapped to
  /// an instance of `DpiResolution`.
  double get value => const <DpiResolution, double>{
        DpiResolution.low: 90.0,
        DpiResolution.medium: 300.0,
        DpiResolution.high: 600.0,
      }[this]!;

  /// Returns the String identifier of an instance of `DpiResolution`.
  String get stringValue => const <DpiResolution, String>{
        DpiResolution.low: 'low',
        DpiResolution.medium: 'medium',
        DpiResolution.high: 'high',
      }[this]!;

  /// Returns a mapping of instance name to enum instance.
  Map<String, DpiResolution> get valueMap => const <String, DpiResolution>{
        'low': DpiResolution.low,
        'medium': DpiResolution.medium,
        'high': DpiResolution.high,
      };
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
