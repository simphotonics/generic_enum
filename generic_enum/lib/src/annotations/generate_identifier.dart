/// Annotation requesting the generation of a function that returns
/// a [String] identifier for each static const generic enum instance.
class GenerateIdentifier {
  /// Annotation processed by GenericEnumGenerator.
  /// Usage:
  /// ```
  /// import 'package:generic_enum/generic_enum.dart';
  ///
  /// part valid_type.g.dart;
  ///
  /// @GenerateIdentifier()  //              <--- Include annotation above class definition.
  /// ValidType extends GenericEnum<Type>{
  ///  const ValidType._(Type value) : super(value);
  ///
  ///  static const INTEGER = ValidType._(int);
  ///  static const BOOL = ValidType._(bool);
  ///
  ///  static String identifier(ValidType validType){  // <--- Add accessor.
  ///    return _$ValidTypeIdentifier(validType);
  /// }
  /// ```
  /// Running the build process will generate the function:
  /// ```
  /// // **************************************************************************
  /// // IdentifierGenerator
  /// // **************************************************************************
  ///
  /// String _$ValidTypeIdentifier(ValidType validType) {
  ///   switch (validType){
  ///   case ValidType.INTEGER:
  ///     return 'ValidType.INTEGER';
  ///     break;
  ///   case ValidType.BOOL:
  ///     return 'ValidType.BOOL';
  ///     break;
  ///   default:
  ///     return '';
  ///   }
  /// }
  /// ```
  ///
  const GenerateIdentifier();
}
