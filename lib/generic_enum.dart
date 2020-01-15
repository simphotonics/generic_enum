library generic_enum;

/// Enum-like class with generic value type.
/// Usage (see comments below):
///
/// ```
/// import 'generic_enum.dart';
///
/// /// Extend class:
/// class NamePart extends GenericEnum<String> {
///
///  /// Add a private const constructor:
///  const NamePart._(String value) : super(value);
///
///  /// Add static const instances:
///  static const NamePart FIRST_NAME = NamePart._('FIRST_NAME');
///  static const NamePart LAST_NAME = NamePart._('LAST_NAME');
///
///  /// Add a static const value map:
///  static const Map<String, NamePart> _valueMap = {
///    'FIRST_NAME' : FIRST_NAME,
///    'LAST_NAME': LAST_NAME,
///  };
///
///  /// Add a getter to access the value map.
///  static get valueMap => _valueMap;
///}
/// ```
class GenericEnum<T> {
  final T value;

  const GenericEnum(this.value);

  @override
  String toString() {
    return value.toString();
  }

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     runtimeType == other.runtimeType &&
  //         this.value == (other as GenericEnum).value;
}

class GenericEnumException implements Exception {
  final String message;
  const GenericEnumException([this.message]);

  @override
  String toString() => message ?? 'GenericEnumException';
}
