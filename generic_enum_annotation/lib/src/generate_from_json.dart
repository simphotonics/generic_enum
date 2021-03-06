import 'package:generic_enum_annotation/src/generate_value_map.dart';

/// Annotation processed by [generic_enum_builder] requesting
/// the generation of a function that converts a json array to an instance of class that extends
/// [generic_enum].
class GenerateFromJson extends GenerateValueMap {
  /// Annotation processed by GenericEnumGenerator.
  /// Usage:
  /// ```
  /// import 'package:generic_enum/generic_enum.dart';
  ///
  /// part valid_type.g.dart;
  ///
  /// @GenerateFromJson // <--- Add annotations above class definition.
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
  /// // MapGenerator
  /// // **************************************************************************
  ///
  /// final _$ValidTypeValueMap = Map<Type, ValidType>.unmodifiable({
  ///   ValidType.INTEGER.value: ValidType.INTEGER,
  ///   ValidType.BOOL.value: ValidType.BOOL
  /// });
  ///
  /// // **************************************************************************
  /// // JsonGenerator
  /// // **************************************************************************
  ///
  /// ValidType _$ValidTypeFromJson(Map<String, dynamic> json) {
  ///   String value = GenericEnum.fromJson(json).value;
  ///   ValidType instance = _$ValidTypeValueMap[value];
  ///   if (instance == null) {
  ///     throw GenericEnumException('
  ///       Could not find ValidType instance with value: $value.',
  ///     );
  ///   }
  ///   return instance;
  /// }
  /// ```
  ///
  const GenerateFromJson();
}
