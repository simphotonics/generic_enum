/// Enum-like class with generic value type.
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
///   Map<String, dynamic> toJson() => _$DpiResolutionToJson(this);
/// }
/// ```
/// In your pubspec.yaml file add (updated versions of) the
/// following dependencies:
/// ```
/// dependencies:
///   generic_enum: ^0.2.5
///
/// dev_dependencies:
///   build_runner: ^1.10.0
///   generic_enum_builder: ^0.2.4
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

class GenericEnum<T> {
  /// Generic value of enumeration class
  final T value;

  /// Call this constructor when extending GenericEnum<T>:
  /// ```
  /// const MyGenericEnum._(T value): super(value);
  /// ```
  const GenericEnum(this.value);

  /// Converts the generic enum value to [String].
  @override
  String toString() {
    return value.toString();
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
