import 'package:generic_enum/generic_enum.dart';
import 'package:exception_templates/exception_templates.dart';

part 'complex.g.dart';

class Complex {
  const Complex(this.real, this.imag);
  final num real;
  final num imag;

  @override
  String toString() {
    return '$real + ${imag}i';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Complex &&
          runtimeType == other.runtimeType &&
          real == other.real &&
          imag == other.imag;

  @override
  int get hashCode => real.hashCode ^ imag.hashCode;
}

@GenerateValueExtension(
  valueType: Complex,
  values: {
    'Complex(0, 0)',
    'Complex(0, 1)',
  },
)
@GenerateJsonExtension()
enum ComplexConstant {
  zero,
  i,
}
