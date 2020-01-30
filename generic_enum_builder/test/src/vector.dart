import 'package:built_collection/built_collection.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart';

part 'vector.test_sample.dart';

class Vector<T extends num> {
  const Vector(this.a1, this.a2);

  final T a1;
  final T a2;
}

/// Sample class used as test input in map_generator_test.dart.
@GenerateValueMap()
class VectorEnum extends GenericEnum<Vector<double>> {
  const VectorEnum._(Vector value) : super(value);

  static const V1 = VectorEnum._(Vector<double>(1.0, 0.0));
  static const V2 = VectorEnum._(Vector<double>(0.0, 1.0));

  static Map<Vector<double>, VectorEnum> get valueMap => _$VectorValueMap;
}
