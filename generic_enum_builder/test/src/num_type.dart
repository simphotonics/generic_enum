import 'package:generic_enum/generic_enum.dart';

/// Sample class used as test input in map_generator_test.dart.
@GenerateValueMap()
class NumType extends GenericEnum<Type> {
  const NumType._(Type value) : super(value);

  // Non const constructor should throw [GenericEnumBuilderError]
  // during build.
  NumType(Type value) : super(value);

  static const INTEGER = NumType._(int);
  static const DOUBEL = NumType._(double);

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
