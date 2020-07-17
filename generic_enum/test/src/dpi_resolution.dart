import 'package:generic_enum/generic_enum.dart';
// 0. Import package exception_templates.
import 'package:exception_templates/exception_templates.dart';

// 1. Add a part statement pointing to the generated file.
part 'dpi_resolution.g.dart';

// 2. Define an enumeration
//    and annotate it with @GenerateJsonExtension().
@GenerateJsonExtension()
enum DpiResolution { LOW, MEDIUM, HIGH }

// 3. Define an extension on the enumeration
extension DpiResolutionValue on DpiResolution {
// 4. Define a getter mapping each instance of the enum to its base value.
  double get value => const {
        DpiResolution.LOW: 90.0,
        DpiResolution.MEDIUM: 300.0,
        DpiResolution.HIGH: 600.0,
      }[this];
}
