/// Library providing the classes:
/// * [GenerateJsonExtension]
/// * [GenerateValueExtension]
/// * The classes are used to annotate Dart enumerations.
/// * Annotated enums are processed by `extensionBuilder` provided by
///   the package `generic_enum_builder`.
library generic_enum;

export 'src/annotations/generate_json_extension.dart';
export 'src/annotations/generate_value_extension.dart';
