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
          this.real == other.real &&
          this.imag == other.imag;

  @override
  int get hashCode => real.hashCode ^ imag.hashCode;
}

@GenerateJsonExtension()
enum ComplexConstant {
  zero,
  i,
}

extension ComplexConstantValue on ComplexConstant {
  Complex get value {
    return const {
      ComplexConstant.zero: Complex(0, 0),
      ComplexConstant.i: Complex(0, 1),
    }[this];
  }
}
