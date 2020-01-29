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
  ///  BuiltMap<Type,ValidType> get valueMap => _$ValidTypeValueMap; // <--- Add getter.
  /// }
  /// ```
  /// Running the build process will generate a
  /// BuiltMap object:
  /// ```
  /// // **************************************************************************
  /// // MapGenerator
  /// // **************************************************************************
  ///
  /// final _$ValidTypeValueMap = BuiltMap<Type, ValidType>({
  ///   ValidType.INTEGER.value: ValidType.INTEGER,
  ///   ValidType.BOOL.value: ValidType.BOOL
  /// });
  /// ```
  ///
  const GenerateBuiltMap();
}
