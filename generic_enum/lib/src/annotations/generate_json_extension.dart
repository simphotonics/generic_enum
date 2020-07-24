/// Annotation requesting the generation of an extension
/// containing the functions `toJson`, `toJsonEncoded` and `fromJson`.
class GenerateJsonExtension {
  /// Annotation processed by `JsonGenerator` in package `generic_enum_builder`.
  ///
  /// Usage:
  /// ```
  /// // 0. Import packages.
  /// import 'package:generic_enum/generic_enum.dart';
  /// import 'package:exception_templates/exception_templates.dart';
  ///
  /// // 1. Add a part statement pointing to the generated file.
  /// part 'dpi_resolution.g.dart';
  ///
  /// // 2. Define an enumeration.
  /// //    and annotate it with
  /// @GenerateJsonExtension().
  /// enum DpiResolution { LOW, MEDIUM, HIGH }
  /// ```
  /// The builder will generate the file `dpi_resolution.g.dart` with content:
  ///
  /// ```
  /// // GENERATED CODE - DO NOT MODIFY BY HAND
  ///
  /// part of 'dpi_resolution.dart';
  ///
  /// // **********************************************************************
  /// // JsonGenerator
  /// // **********************************************************************
  ///
  /// /// Extension providing the functions `fromJson` and `toJson`.
  /// extension ToDpiResolution on DpiResolution {
  ///   /// Converts [json] to an instance of `DpiResolution`.
  ///   static DpiResolution fromJson(Map<String, dynamic> json) {
  ///     final index = (json['index']) as int;
  ///     if (index == null) {
  ///       throw ErrorOf<DpiResolution>(
  ///           message: 'Error deserializing json to DpiResolution.',
  ///           invalidState: 'json[index] returned null.',
  ///           expectedState: 'A map entry: {index: int value}.');
  ///     }
  ///     if (index >= 0 && index < DpiResolution.values.length) {
  ///       return DpiResolution.values[index];
  ///     } else {
  ///       throw ErrorOf<DpiResolution>(
  ///           message: 'Function fromJson could not find '
  ///               'an instance of type DpiResolution.',
  ///           invalidState: 'DpiResolution.values[$index] out of bounds.');
  ///     }
  ///   }
  ///
  ///   /// Converts `this` to a map `Map<String, dynamic>`.
  ///   Map<String, dynamic> toJson() =>
  ///       {'index': DpiResolution.values.indexOf(this)};
  ///
  ///   /// Converts `this` to a json encoded `String`.
  ///   String get jsonEncoded => '{"index":${DpiResolution.values.indexOf(this)}}';
  /// }
  /// ```
  const GenerateJsonExtension();
}
