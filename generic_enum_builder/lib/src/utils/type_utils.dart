import 'package:analyzer/dart/element/type.dart'
    show DartType, ParameterizedType;

/// Returns a [List] of type arguments (of a parametrized type).
List<DartType> typeArgumentsOf(DartType type) {
  return type is ParameterizedType ? type.typeArguments : const [];
}
