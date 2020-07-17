import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../collectors/collector.dart';
import '../utils/type_utils.dart';

/// Collects elements of type [FieldElement] with static type
/// extending [Map].
///
/// Usage: [classElement.visitChildren(mapCollector)];
///
/// Note: Only instances defined with modifiers [static] and [const] are collected.
class BaseValueMapCollector extends Collector<FieldElement> {
  BaseValueMapCollector({
    this.element,
    this.fieldName,
  }) {
    if (element is! ExtensionElement) return;
    _extendedType = (element as ExtensionElement).extendedType;
    element.visitChildren(this);
  }

  /// The name of the field element.
  final String fieldName;

  /// The element being visited.
  final Element element;

  /// The extended type.
  DartType _extendedType;

  /// The base value type of the generic enum.
  DartType _baseValueType;

  /// Returns the extended type if element is an [ExtensionElement].
  ///
  /// Note: Returns `null` is [element] is not an [ExtensionElement].
  DartType get extendedType => _extendedType;

  /// Returns the base value type of the generic enum.
  DartType get baseValueType => _baseValueType;

  /// Returns [true] if [fieldElement] represents a static const map
  /// with keys of type [extendeType].
  bool isBaseValueMap(FieldElement fieldElement) {
    if (!fieldElement.type.isDartCoreMap) return false;
    final typeArgs = typeArgumentsOf(fieldElement.type);

    // Check if keys have the expected type.
    if (typeArgs.first != extendedType) return false;

    // Set the base value type;
    _baseValueType = typeArgs[1];

    return fieldElement.name == fieldName &&
        fieldElement.isConst &&
        fieldElement.isStatic;
  }

  /// Visits elements of type [FieldElement].
  @override
  visitFieldElement(FieldElement fieldElement) {
    if (isBaseValueMap(fieldElement)) {
      this.add(fieldElement);
    }
  }
}
