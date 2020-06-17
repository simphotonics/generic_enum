import 'package:generic_enum/generic_enum.dart';

/// Complex number. Tests if json-serialization works for non-native types.
class Complex {
  const Complex(this.real, this.imag);
  final num real;
  final num imag;

  @override
  String toString() {
    return '$real + ${imag}i';
  }

  Map<String, dynamic> toJson() {
    return {'real': real, 'imag': imag};
  }

  factory Complex.fromJson(Map<String, dynamic> json) =>
      Complex(json['real'], json['imag']);
}

@GenerateFromJson()
class ComplexConstant extends GenericEnum<Complex> {
  const ComplexConstant._(Complex value) : super(value);

  static const i = ComplexConstant._(Complex(0, 1));

  /// 5. Provide access to the map _$DirectionValueMap.
  static Map<Complex, ComplexConstant> get valueMap =>
      _$ComplexConstantValueMap;

  /// 6. Define the factory constructor `.fromJson`.
  factory ComplexConstant.fromJson(Map<String, dynamic> json) =>
      _$ComplexConstantFromJson(json);

  /// 7. Define the method [toJson].
  Map<String, dynamic> toJson() => _$ComplexConstantToJson(this);
}

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
