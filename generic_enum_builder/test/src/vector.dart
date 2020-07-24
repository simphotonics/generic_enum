import 'package:generic_enum/generic_enum.dart';
import 'package:exception_templates/exception_templates.dart';

part 'vector.g.dart';

@GenerateJsonExtension()
@GenerateValueExtension(
  mappedValueType: ValueType<double>(),
  mappedValues: const <String>{'3.14', '6.98'},
)
enum Vector { alpha, beta }
