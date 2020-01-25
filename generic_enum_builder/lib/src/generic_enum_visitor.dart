import 'package:meta/meta.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:source_gen/source_gen.dart' show TypeChecker;
import 'package:generic_enum_builder/src/generator_exception.dart';
import 'package:generic_enum/generic_enum.dart';

class GenericEnumVisitor extends SimpleElementVisitor {
  GenericEnumVisitor({@required this.classType});

  // The final variable [classType] is used in the method visitFieldElement
  // to collect all
  // static const instances of [classType] defined by the user.
  //
  // We could infer [classType] from the ConstructorElement, but it is
  // not guaranteed that visitConstructorElement will be called
  // before visitFieldElement.
  //
  /// Static type of GenericEnum extending class.
  /// The variable [classType] is used in the method visitFieldElement
  // to collect all
  // static const instances of [classType] defined by the user.
  final DartType classType;

  List<FieldElement> _fields = [];
  List<FieldElement> _instances = [];
  List<MethodElement> _methods = [];

  /// [TypeChecker.fromRuntime(GenericEnum)]
  static var genericEnumChecker = TypeChecker.fromRuntime(GenericEnum);

  /// Returns true if [element] represents a class
  /// that extends [GenericEnum].
  static bool extendsGenericEnum(Element element) {
    return genericEnumChecker.isSuperOf(element);
  }

  /// Returns true if the static type of [element] represents a class
  /// that extends [GenericEnum].
  static bool extendsGenericEnumType(DartType dartType) {
    return genericEnumChecker.isSuperTypeOf(dartType);
  }

  /// Returns true if [element] represents a class that
  /// is assignable from [GenericEnum].
  static bool isGenericEnum(Element element) {
    return genericEnumChecker.isAssignableFrom(element);
  }

  /// Retruns true if [dartType] is assignable from [GenericEnum].
  static bool isGenericEnumType(DartType dartType) {
    return genericEnumChecker.isAssignableFromType(dartType);
  }

  /// List containing all elements of type [FieldElement] defined by this class.
  List<FieldElement> get fields => _fields;

  /// List containing all elements of type [FieldElement] represent
  /// static const instances of [classType].
  List<FieldElement> get instances => _instances;

  /// List containing all elements of type [MethodElement] defined by this class.
  List<MethodElement> get methods => _methods;

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
    _fields.add(element);

    /// Adding const static class instances defined for this class.
    if (element.isConst && element.isStatic && element.type == classType) {
      _instances.add(element);
    }
  }

  @override
  visitMethodElement(MethodElement element) {
    _methods.add(element);
  }
}
