import 'package:generic_enum/src/annotations/generate_value_map.dart';

/// Annotation requesting the generation of the functions
/// `toJson` and `fromJson`.
class GenerateFromToJson extends GenerateValueMap {
  /// Annotation processed by `JsonGenerator` in package `generic_enum_builder`.
  /// Usage:
  /// ```
  /// import 'package:generic_enum/generic_enum.dart';
  ///
  /// //   1. Add a part statement pointing to the generated file.
  /// part 'dpi_resolution.g.dart';
  ///
  /// //   2. Annotate with @GenerateFromJson()
  /// //   3. Extend GenericEnum<T>
  /// @GenerateFromJson()
  /// class DpiResolution extends GenericEnum<int> {
  ///   // 4. Define a private const constructor that calls the super constructor
  ///   //    and passes on the value of type int.
  ///   const DpiResolution._(int value) : super(value);
  ///   // 5. Define static constant instances of type DpiResolution
  ///   static const DpiResolution LOW = DpiResolution._(90);
  ///   static const DpiResolution MEDIUM = DpiResolution._(300);
  ///   static const DpiResolution HIGH = DpiResolution._(600);
  ///   // 6. Give access to _valueMap and
  ///   static Map<int, DpiResolution> get valueMap => _$DpiResolutionValueMap;
  ///   // 7. Define the named factory constructor .fromJson:
  ///   factory DpiResolution.fromJson(Map<String, dynamic> json) =>
  ///       _$DpiResolutionFromJson(json);
  ///   // 8. Define the method [toJson].
  ///   @override
  ///   Map<String, dynamic> toJson() => _$DpiResolutionToJson(this);
  /// }
  /// ```
  ///
  /// The builder will generate the file `dpi_resolution.g.dart` with content:
  ///
  /// ```
  /// // GENERATED CODE - DO NOT MODIFY BY HAND
  ///
  /// part of 'dpi_resolution.dart';
  ///
  /// // **************************************************************************
  /// // JsonGenerator
  /// // **************************************************************************
  ///
  /// /// Converts an instance of [DpiResolution] to a map [Map<String, dynamic>].
  /// /// Add the following method to your class definition:
  /// ///
  /// ///  @override
  /// ///  Map<String, dynamic> toJson() => _$DpiResolutionToJson(this);
  /// ///
  /// Map<String, dynamic> _$DpiResolutionToJson(DpiResolution instance) =>
  ///     {'key': _$DpiResolutionValueMap.values.toList().indexOf(instance)};
  ///
  /// /// Converts a map [Map<String, dynamic>] to an instance of [DpiResolution].
  /// /// Add the following factory constructor to your class definition:
  /// ///
  /// /// factory DpiResolution.fromJson(Map<String, dynamic> json) =>
  /// ///   _$DpiResolutionFromJson(json);
  /// ///
  /// DpiResolution _$DpiResolutionFromJson(Map<String, dynamic> json) {
  ///   final key = (json['key']) as int;
  ///   DpiResolution instance = _$DpiResolutionValueMap.values.toList()[key];
  ///   if (instance == null) {
  ///     throw GenericEnumException(
  ///         '.fromJson constructor: Could not find a matching instance of type DpiResolution.');
  ///   }
  ///   return instance;
  /// }
  ///
  /// // **************************************************************************
  /// // MapGenerator
  /// // **************************************************************************
  ///
  /// /// Maps a value of type [int] to an instance of [DpiResolution].
  /// /// Add the following getter to your class definition:
  /// ///
  /// /// static Map<int,DpiResolution> get valueMap => _$DpiResolutionValueMap;
  /// /// 
  /// final _$DpiResolutionValueMap = Map<int, DpiResolution>.unmodifiable({
  ///   DpiResolution.LOW.value: DpiResolution.LOW,
  ///   DpiResolution.MEDIUM.value: DpiResolution.MEDIUM,
  ///   DpiResolution.HIGH.value: DpiResolution.HIGH,
  /// });
  /// ```
  ///
  const GenerateFromToJson();
}
