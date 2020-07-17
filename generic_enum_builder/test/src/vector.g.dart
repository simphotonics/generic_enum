// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

/// Extension providing the functions `fromJson` and `toJson`.
extension VectorJson on Vector {
  /// Converts [json] to an instance of `Vector`.
  Vector fromJson(Map<String, dynamic> json) {
    final index = (json['index']) as int;
    if (index >= 0 && index < Vector.values.length) {
      return Vector.values[index];
    } else {
      throw ErrorOf<Vector>(
          message:
              'Function fromJson could not find ' 'an instance of type Vector.',
          invalidState: 'Vector.values[$index] out of bounds.');
    }
  }

  /// Converts an instance of `Vector` to a map `Map<String, dynamic>]`.
  Map<String, dynamic> toJson(Vector instance) =>
      {'key': Vector.values.indexOf(instance)};
}
