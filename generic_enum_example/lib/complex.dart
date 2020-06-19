import 'package:generic_enum/generic_enum.dart';

part 'complex.g.dart';

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

  /// 6. Define the factory constructor .fromJson
  factory ComplexConstant.fromJson(Map<String, dynamic> json) =>
      _$ComplexConstantFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ComplexConstantToJson(this);
}
