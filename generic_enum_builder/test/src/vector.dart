import 'package:generic_enum/generic_enum.dart';
import 'package:exception_templates/exception_templates.dart';

part 'vector.g.dart';

@GenerateJsonExtension()
enum Vector { alpha, beta }

extension VectorValue on Vector {
  double get value => {
        Vector.alpha: 3.14,
        Vector.beta: 6.98,
      }[this];
}
