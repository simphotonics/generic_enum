/// Annotation requesting the generation of a BuiltMap containing
/// the const static instances and values defined for a class that
/// extends GenericEnum.
class GenerateBuiltMap {
  /// Annotation processed by GenericEnumGenerator.
  /// Usage:
  /// ```
  /// import 'package:generic_enum/generic_enum.dart';
  ///
  /// part valid_type.g.dart;
  ///
  /// @GenerateBuiltMap() // <--- Include annotation above class definition.
  /// ValidType extends GenericEnum<Type>{
  ///  const ValidType._(Type value) : super(value);
  ///
  ///  static const INTEGER = ValidType._(int);
  ///  static const BOOL = ValidType._(bool);
  ///
  ///  BuiltMap<Type,ValidType> get valueMap => _valueMap; // <--- Add getter.
  /// }
  /// ```
  /// Running the build process will generate a
  /// BuiltMap object:
  /// ```
  /// final _valueMap = BuiltMap<Type,ValidType>({
  ///   int: INTEGER,
  ///   bool: BOOL,
  /// });
  /// ```
  ///
  const GenerateBuiltMap();
}
