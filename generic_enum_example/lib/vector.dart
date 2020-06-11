import 'package:generic_enum/generic_enum.dart';

part 'vector.g.dart';

class Vector<T extends num> {
  const Vector(this.a1, this.a2);

  final T a1;
  final T a2;
}

/// Sample generic enum class providing access to the identifier
/// of each const instance that is defined.
@GenerateValueMap()
@GenerateIdentifier()
class VectorEnum extends GenericEnum<Vector<double>> {
  const VectorEnum._(Vector value) : super(value);

  static const V1 = VectorEnum._(Vector<double>(1.0, 0.0));
  static const V2 = VectorEnum._(Vector<double>(0.0, 1.0));

  static Map<Vector<double>, VectorEnum> get valueMap => _$VectorEnumValueMap;

  static String identifier(VectorEnum vectorEnum) =>
      _$VectorEnumIdentifier(vectorEnum);
}
