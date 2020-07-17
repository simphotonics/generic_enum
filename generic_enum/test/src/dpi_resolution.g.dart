// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dpi_resolution.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Extension providing the functions `fromJson` and `toJson`.
extension ToDpiResolution on DpiResolution {
  /// Converts [json] to an instance of `DpiResolution`.
  static DpiResolution fromJson(Map<String, dynamic> json) {
    final index = (json['index']) as int;
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
