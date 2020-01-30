/// Annotation requesting the generation of an immutable map. The map object
/// maps each generic enum value to the generic enum instance with that value.
class GenerateValueMap {
  /// Annotation processed by GenericEnumGenerator.
  /// Usage:
  /// ```
  /// import 'package:generic_enum/generic_enum.dart';
  ///
  /// part valid_type.g.dart;
  ///
  /// @GenerateValueMap()  //              <--- Include annotation above class definition.
  /// ValidType extends GenericEnum<Type>{
  ///  const ValidType._(Type value) : super(value);
  ///
  ///  static const INTEGER = ValidType._(int);
  ///  static const BOOL = ValidType._(bool);
  ///
  ///  Map<Type,ValidType> get valueMap => _$ValidTypeValueMap; // <--- Add getter.
  /// }
  /// ```
  /// Running the build process will generate an unmodifiable map:
  /// ```
  /// // **************************************************************************
  /// // MapGenerator
  /// // **************************************************************************
  ///
  /// final _$ValidTypeValueMap = Map<Type, ValidType>.unmodifiable({
  ///   ValidType.INTEGER.value: ValidType.INTEGER,
  ///   ValidType.BOOL.value: ValidType.BOOL
  /// });
  /// ```
  ///
  const GenerateValueMap();
}
