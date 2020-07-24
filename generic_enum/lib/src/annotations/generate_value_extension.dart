/// Annotation requesting the generation of the extension <EnumName>Value.
class GenerateValueExtension {
  /// Annotation requesting the generation of the extension <EnumName>Value.
  /// * [getterName] must be a valid Dart identifier.
  const GenerateValueExtension({
    this.getterName = 'stringValue',
    this.mappedGetterName = 'value',
    this.mappedValueType,
    this.mappedValues,
  });

  /// Name of getter returning the `String` enum value.
  /// * Default name: "stringValue".
  /// * Name must be a valid Dart identifier.
  final String getterName;

  /// Name of returning a mapped enum value.
  /// * Default name: "value".
  /// * Name must be a valid Dart identifier.
  final String mappedGetterName;

  /// An instance of `ValueType`. The type parameters
  /// specifies the return-type of the mapped value getter.
  /// Example:
  /// ```
  /// @GenerateValueExtension(
  /// mappedValueType: ValueType<List<int>>().
  /// ```
  final ValueType mappedValueType;

  /// Const values of type `T` encoded as a `String`, where `mappedValueType: ValueType<T>`.
  /// * Entries are copied verbatim to the getter:
  /// ```
  /// T get value =>
  ///   const <enumType, T>{
  ///      enum.values[0]: mappedValues[0],
  ///      enum.values[1]: mappedValues[1],
  ///   }[this];
  /// ```
  ///
  /// Examples:
  /// * Integer: {'0', '1', '2',}
  /// * String: {'\\'zero\\'', '\\'one\\'', '\\'two\\'',}
  /// * class A: {'const A(3.0)', 'const A(4.0)',}
  final Set<String> mappedValues;
}

/// Parameterized class used to specify the mapped value type `T`.
/// * Has a const constructor and can be used a parameter
/// in annotations.
/// * Is used instead of `Type` to be able to specify
/// complex parameterized types e.g. `Map<String, dynamic>`.
class ValueType<T> {
  /// Const constructor creating an instance of `ValueType<T>`.
  /// The parameterized class is used to specify the mapped enum value type `T`.
  const ValueType();

  // Returns the type parameter.
  Type get type => T;
}
