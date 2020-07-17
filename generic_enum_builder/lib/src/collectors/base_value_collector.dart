import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../collectors/collector.dart';

/// Collects elements of type `FieldElement` representing the getter `baseValue`.
///
/// Usage:
/// ```Dart
/// classElement.visitChildren(baseValueCollector)];
/// ```
class BaseValueCollector extends Collector<FieldElement> {
  BaseValueCollector({
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
  bool isBaseValueGetter(FieldElement fieldElement) {
    // Check if keys have the expected type.
    if (fieldElement.name == fieldName) {
      // Set the base value type;
      _baseValueType = fieldElement.getter.type.returnType;
      return true;
    } else {
      return false;
    }
  }

  /// Visits elements of type [FieldElement].
  @override
  visitFieldElement(FieldElement fieldElement) {
    if (isBaseValueGetter(fieldElement)) {
      this.add(fieldElement);
    }
  }
}
