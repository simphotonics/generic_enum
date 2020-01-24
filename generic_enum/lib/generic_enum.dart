library generic_enum;

import 'package:json_annotation/json_annotation.dart';

/// Enum-like class with generic value type.
/// Usage:
/// ```
/// import 'package:generic_enum/generic_enum.dart';
/// import 'package:generic_enum_annotation/generic_enum_annotation.dart';
///
/// part 'direction.g.dart';
///
/// ///  1) Extend and optionally annotate class:
/// @GenerateMap
/// @GenerateJson
/// class NamePart extends GenericEnum<String> {
///
///  /// 2) Add a private const constructor:
///  const NamePart._(String value) : super(value);
///
///  /// 3) Add static const instances:
///  static const NamePart FIRST_NAME = NamePart._('FIRST_NAME');
///  static const NamePart LAST_NAME = NamePart._('LAST_NAME');
///
///  /// 4) Add a static getter valueMap:
///  static BuiltMap<String, NamePart> valueMap => valueMap;
///
///}
/// ```
/// In your pubspec.yaml file add (updated versions of) the
/// following dependencies:
/// ```
/// dev_dependencies:
///   build_runner: ^1.0.0
///   source_gen: ^0.9.4+7
///   generic_enum_builder: ^0.0.1
///
/// ```
/// In you local build.yaml file add and enable the following targets:
/// ```
/// targets:
///  $default:
///    builders:
///      # Configure the builder `pkg_name|builder_name`
///      generic_enum_builder|map_builder:
///        # Only run this builder on the specified input.
///        enabled: true
///        generate_for:
///          - lib/*.dart
///      # Configure the builder `pkg_name|builder_name`
///      generic_enum_builder|json_builder:
///        # Only run this builder on the specified input.
///        enabled: true
///        generate_for:
///          - lib/*.dart
/// ```
/// Build the project by running:
/// ```
/// $ flutter packages pub run build_runner build --delete-conflicting-outputs
/// ```
part 'generic_enum.g.dart';

@JsonSerializable()
class GenericEnum<T> {
  @_Converter()
  final T value;

  const GenericEnum(this.value);

  @override
  String toString() {
    return value.toString();
  }

  factory GenericEnum.fromJson(Map<String, dynamic> json) =>
      _$GenericEnumFromJson<T>(json);

  Map<String, dynamic> toJson() => _$GenericEnumToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    // if (json is Map<String, dynamic> &&
    //     json.containsKey('name') &&
    //     json.containsKey('size')) {
    //   return CustomResult.fromJson(json) as T;
    // }
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
  final String message;
  const GenericEnumException([this.message]);

  @override
  String toString() => message ?? 'GenericEnumException';
}
