/// Annotation requesting the generation of
///
/// - toJson and
///
/// - fromJson
///
/// functions.
class GenerateToFromJson {
  /// Annotation processed by GenericEnumGenerator.
  /// Usage:
  /// ```
  /// import 'package:generic_enum/generic_enum.dart';
  ///
  /// part valid_type.g.dart;
  ///
  /// @GenerateBuiltMap() @GenerateToFromJson // <--- Include annotations above class definition.
  /// ValidType extends GenericEnum<Type>{
  ///  const ValidType._(Type value) : super(value);
  ///
  ///  static const INTEGER = ValidType._(int);
  ///  static const BOOL = ValidType._(bool);
  ///
  ///  BuiltMap<Type,ValidType> get => _valueMap;
  ///
  /// }
  /// ```
  /// Running the build process will generate
  /// the functions:
  /// ```
  /// static _toJson() ...
  /// ValidType static _fromJson ...
  /// ```
  ///
  const GenerateToFromJson();
}
