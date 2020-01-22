import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:source_gen/source_gen.dart' show TypeChecker;
import 'package:generic_enum_generator/src/generator_exception.dart';
import 'package:generic_enum/generic_enum.dart';

class GenericEnumVisitor extends SimpleElementVisitor {
  GenericEnumVisitor({this.classType});

  // [classType] is used in visitFieldElement to collect all
  // static const instances of [classType] defined by the user.
  //
  // We could infer [classType] from the ConstructorElement, but it is
  // not guaranteed that visitConstructorElement will be called
  // before visitFieldElement.
  //
  /// Name of GenericEnum extending class.
  final DartType classType;
  List<FieldElement> fields = [];
  List<FieldElement> instances = [];
  List<MethodElement> methods = [];

  static var genericEnumChecker = TypeChecker.fromRuntime(GenericEnum);

  static bool extendsGenericEnum(Element element) {
    return genericEnumChecker.isSuperOf(element);
  }

  static bool extendsGenericEnumType(DartType dartType) {
    return genericEnumChecker.isSuperTypeOf(dartType);
  }

  static bool isGenericEnum(Element element) {
    return genericEnumChecker.isAssignableFrom(element);
  }

  static bool isGenericEnumType(DartType dartType) {
    return genericEnumChecker.isAssignableFromType(dartType);
  }

  @override
  visitConstructorElement(ConstructorElement element) {
    // Check if class extends GenericEnum
    var _classType = element.type.returnType;
    if (!extendsGenericEnumType(_classType)) {
      throw GeneratorException(''' Annotation used with a class
      that is not extending GenericEnum. Try extending GenericEnum.
      ''');
    }

    // Check if constructor is const
    if (!element.isConst) {
      throw GeneratorException(''' Classes extending GenericEnum should have
      only const constructors. Try using the keyword \'const\' in your
      constructor declaration.
      ''');
    }
    // Check if constructor is private
    if (!element.isPrivate) {
      throw GeneratorException(''' Classes extending GenericEnum should have
      only private constructors. Try using a named constructor and choose a name
      starting with an underscore.''');
    }
  }

  @override
  visitFieldElement(FieldElement element) {
    fields.add(element);

    /// Adding const static class instances defined for this class.
    if (element.isConst && element.isStatic && element.type == classType) {
      instances.add(element);
    }
  }

  @override
  visitMethodElement(MethodElement element) {
    methods.add(element);
  }
}
