/// Annotation requesting the generation of
///
/// - toJson and
///
/// - fromJson
///
/// functions.
class GenerateFromJson {
  /// Annotation processed by GenericEnumGenerator.
  /// Important: @GenerateFromJson() requires @GenerateBuiltMap().
  /// Usage:
  /// ```
  /// import 'package:generic_enum/generic_enum.dart';
  ///
  /// part valid_type.g.dart;
  ///
  /// @GenerateBuiltMap() @GenerateFromJson // <--- Add annotations above class definition.
  /// ValidType extends GenericEnum<Type>{
  ///  const ValidType._(Type value) : super(value);
  ///
  ///  static const INTEGER = ValidType._(int);
  ///  static const BOOL = ValidType._(bool);
  ///
  ///  BuiltMap<Type,ValidType> get valueMap => _$ValidTypeValueMap; // <--- Define getter.
  ///
  ///  // Define a factory constructor calling _$ValidTypeFromJson().
  ///  factory ValidType.fromJson(Map<String, dynamic> json) => _$ValidTypeFromJson(json);
  /// }
  /// ```
  /// The builder will generate the file valid_type.g.dart with content:
  ///
  /// ```
  /// // **************************************************************************
  /// // JsonGenerator
  /// // **************************************************************************
  ///
  /// ValidType _$ValidTypeFromJson(Map<String, dynamic> json) {
  ///   String value = GenericEnum.fromJson(json).value;
  ///   ValidType instance = ValidType.valueMap[value];
  ///   if (instance == null) {
  ///     throw GenericEnumException('
  ///       Could not find ValidType instance with value: $value.',
  ///     );
  ///   }
  ///   return instance;
  /// }
  ///
  /// // **************************************************************************
  /// // MapGenerator
  /// // **************************************************************************
  ///
  /// final _$ValidTypeValueMap = BuiltMap<Type, ValidType>({
  ///   ValidType.INTEGER.value: ValidType.INTEGER,
  ///   ValidType.BOOL.value: ValidType.BOOL
  /// });
  ///
  /// ```
  ///
  const GenerateFromJson();
}
