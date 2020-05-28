import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_builder/src/collectors/collector.dart';
import 'package:generic_enum_builder/src/errors/generic_enum_builder_error.dart';

/// Collects elements of type [FieldElement] with static type
/// extending [GenericEnum].
///
/// Usage: [classElement.visitChildren(genericEnumCollector)];
///
/// Only instances defined with modifiers [static] and [const] are collected.
class GenericEnumCollector extends Collector<GenericEnum, FieldElement> {
  GenericEnumCollector(ClassElement element)
      : type = element.thisType,
        superType = element.supertype,
        superTypeArg = element.supertype.typeArguments?.first {
    element.visitChildren(this);
  }

  /// Static type of [ClassElement] element.
  final DartType type;

  /// Static super type of [ClassElement] element.
  /// Note: Must be [GenericEnum].
  final DartType superType;

  /// Type argument of [GenericEnum] super-class of [ClassElement] element.
  final DartType superTypeArg;

  /// Returns [true] if [element] represents a static const instance
  /// of a class extending [GenericEnum].
  bool isGenericEnumInstance(FieldElement element) {
    return checker.isExactlyType(superType) &&
        element.isConst &&
        element.isStatic &&
        (element.type == type);
  }

  /// Visits elements of type [FieldElement].
  @override
  visitFieldElement(FieldElement element) {
    if (isGenericEnumInstance(element)) {
      this.add(element);
    }
  }

  /// Validates the constructors of a class extending
  /// [GenericEnum].
  @override
  visitConstructorElement(ConstructorElement element) {
    // Skip checks if class is not a generic enum.
    if (!checker.isAssignableFromType(element.returnType)) return;

    // Skip checks for factory constructor.
    if (element.isFactory && element.name == 'fromJson') return;

    // Throw if class does not extends [GenericEnum].
    if (!checker.isSuperTypeOf(element.returnType)) {
      throw GenericEnumBuilderError(
          message: 'Class ${element.name} does '
              'not extend GenericEnum.',
          expectedState: 'Try extending GenericEnum.');
    }

    // Throw if constructor is not const.
    if (!element.isConst) {
      throw GenericEnumBuilderError(
          message: 'Non-const constructor found.',
          invalidState: 'Constructor ${element.name} is not const.',
          expectedState:
              'Try using the "const" modifier for this constructor.');
    }
    // Throw if constructor is not private.
    if (!element.isPrivate) {
      throw GenericEnumBuilderError(
        message:
            'Classes extending GenericEnum must have only private constructors.',
        expectedState:
            'All constructors are named and start with an underscore.',
      );
    }
  }
}
