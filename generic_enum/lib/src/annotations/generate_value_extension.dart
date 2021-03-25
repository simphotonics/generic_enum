/// Returns the type `T`.
///
/// Enables passing parameterized types where a variable of type `Type`
/// is expected.
Type getType<T>() => T;

/// Annotation requesting the generation of the extension `<EnumName>Value`.
class GenerateValueExtension {
  /// Annotation requesting the generation of the extension `<EnumName>Value`.
  /// * `valueType`: The type of the mapped enum values.
  ///   Use the function `getType<T>()` to pass a parameterized type
  ///   e.g. `valueType: getType<List<int>>()`.
  /// * `values`: The enum values of type `valueType` encoded as a `String`.
  ///
  /// ---
  /// Note: Value entries are copied *verbatim* to the getter.
  /// The values must represent a *literal* or a *constant value*.
  /// The number of entries must match the number of enum instances.
  ///
  /// Values of type `String` must be enclosed with escaped quotation marks!
  /// Examples:
  /// - Integer: {'0', '1', '2',}
  /// - String: {'\\'zero\\'', '\\'one\\'', '\\'two\\'',}
  /// - class A: {'const A(3.0)', 'const A(4.0)',}
  const GenerateValueExtension({
    required this.valueType,
    required this.values,
  });

  /// The enum values of type `T` encoded as a `String`.
  /// * Entries are copied verbatim to the getter.
  /// * The number of entries must match the number of enum instances.
  /// * Values of type `String` must be enclosed with escaped quotation marks!
  /// * Examples:
  ///   - Integer: {'0', '1', '2',}
  ///   - String: {'\\'zero\\'', '\\'one\\'', '\\'two\\'',}
  ///   - class A: {'const A(3.0)', 'const A(4.0)',}
  final Set<String> values;

  /// The type of the mapped enum values.
  /// Use the function `getType<T>()` to pass a parameterized type.
  ///
  /// Example: To specify the type `List<int>` use
  /// `valueType: getType<List<int>>()`.
  final Type valueType;
}
