import 'package:generic_enum/generic_enum.dart';
// 0. Import package exception_templates.
import 'package:exception_templates/exception_templates.dart';

// 1. Add a part statement pointing to the generated file.
part 'dpi_resolution.g.dart';

// 2. Define an enumeration
//    and annotate it with @GenerateJsonExtension().
@GenerateValueExtension(
  mappedValueType: ValueType<double>(),
  mappedValues: const {'90.0', '300.0', '600.0'},
)
@GenerateJsonExtension()
enum DpiResolution { LOW, MEDIUM, HIGH }
