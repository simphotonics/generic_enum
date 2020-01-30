/// Annotation processed by [generic_enum_builder] requesting
/// the generation of a function that converts a json array to an instance of class that extends
/// [generic_enum].
class GenerateFromJson {
  /// Annotation processed by GenericEnumGenerator.
  /// Important: @GenerateFromJson() requires @GenerateValueMap().
  /// Usage:
  /// ```
  /// import 'package:generic_enum/generic_enum.dart';
  ///
  /// part valid_type.g.dart;
  ///
  /// @GenerateValueMap() @GenerateFromJson // <--- Add annotations above class definition.
  /// ValidType extends GenericEnum<Type>{
  ///  const ValidType._(Type value) : super(value);
  ///
  ///  static const INTEGER = ValidType._(int);
  ///  static const BOOL = ValidType._(bool);
  ///
  ///  Map<Type,ValidType> get valueMap => _$ValidTypeValueMap; // <--- Define getter.
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
  /// final _$ValidTypeValueMap = Map<Type, ValidType>.unmodifiable({
  ///   ValidType.INTEGER.value: ValidType.INTEGER,
  ///   ValidType.BOOL.value: ValidType.BOOL
  /// });
  ///
  /// ```
  ///
  const GenerateFromJson();
}
