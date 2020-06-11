// Json-serialization adapted from:
//    https://github.com/dart-lang/json_serializable/blob/master/example/lib/json_converter_example.dart
// License file:
//    https://github.com/dart-lang/json_serializable/blob/master/LICENSE

import 'package:json_annotation/json_annotation.dart';

part 'generic_enum.g.dart';

/// Enum-like class with generic value type.
/// Usage:
/// ```
/// import 'package:generic_enum/generic_enum.dart';
/// import 'package:generic_enum_annotation/generic_enum_annotation.dart';
///
/// //   0. Add a part instruction pointing to the generated file.
/// part 'dpi_resolution.g.dart';
///
/// // 1. Extend GenericEnum<T>
/// // 2. Annotate class
/// @GenerateFromJson() //
/// class DpiResolution extends GenericEnum<int> {
///   // 3. Define a private const constructor that calls the super constructor
///   //    and passes on the value.
///   const DpiResolution._(int value) : super(value);
///
///   // 4. Define static constant instances of type DpiResolution
///   static const DpiResolution LOW = DpiResolution._(90);
///   static const DpiResolution MEDIUM = DpiResolution._(300);
///   static const DpiResolution HIGH = DpiResolution._(600);
///
///   // 5. Give access to _$DpiResolutionValueMap and
///   //    $DpiResolutionFromJson.
///   static Map<int, DpiResolution> get valueMap => _$DpiResolutionValueMap;
///
///   // 6. Define a factory constructor named .fromJson.
///   factory DpiResolution.fromJson(Map<String, dynamic> json) =>
///     _$DpiResolutionFromJson(json);
/// }
/// ```
/// In your pubspec.yaml file add (updated versions of) the
/// following dependencies:
/// ```
/// dependencies:
///   generic_enum_annotation: ^0.1.6
///   generic_enum: ^0.2.0
///
/// dev_dependencies:
///   build_runner: ^1.10.0
///   source_gen: ^0.9.5
///   generic_enum_builder: ^0.1.8
///
/// ```
/// In your local build.yaml file add and enable the following targets:
/// ```
/// targets:
///  $default:
///    builders:
///      generic_enum_builder|map_builder:
///        # Only run this builder on the specified input.
///        enabled: true
///        generate_for:
///          - lib/*.dart
///      generic_enum_builder|json_builder:
///        # Only run this builder on the specified input.
///        enabled: true
///        generate_for:
///          - lib/*.dart
/// ```
/// Build the project by running:
/// ```
/// $ pub run build_runner build --delete-conflicting-outputs
/// ```
@JsonSerializable()
class GenericEnum<T> {
  /// Generic value of enumeration class
  @_Converter()
  final T value;

  /// Call this constructor when extending GenericEnum<T>:
  /// ```
  /// const MyGenericEnum(T value): super(value);
  /// ```
  const GenericEnum(this.value);

  /// Converts the generic enum value to [String].
  @override
  String toString() {
    return value.toString();
  }

  /// Converts a json map object to [GenericEnum].
  factory GenericEnum.fromJson(Map<String, dynamic> json) =>
      _$GenericEnumFromJson<T>(json);

  /// Converts a [GenericEnum] instance to a json map object.
  Map<String, dynamic> toJson() => _$GenericEnumToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    // This will only work if `json` is a native JSON type:
    //   num, String, bool, null, etc
    // *and* is assignable to `T`.
    return json as T;
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object;
  }
}

class GenericEnumException implements Exception {
  /// Exception message
  final String message;

  /// Constructs a `GenericEnumException`.
  /// Add a message that is useful when debugging.
  const GenericEnumException([this.message]);

  /// Converts [GenericEnumException] instance to [String].
  @override
  String toString() => message ?? 'GenericEnumException';
}