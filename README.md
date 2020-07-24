# Generic Enumerations For Dart
[![Build Status](https://travis-ci.com/simphotonics/generic_enum.svg?branch=master)](https://travis-ci.com/simphotonics/generic_enum)


## Update

As of [`generic_enum 0.3.0`][generic_enum] it is not longer required to extend `GenericEnum`.
In fact, this class has been removed.
The package now uses [`extension-methods`][extension-methods]. The change was inspired by this [issue comment]
and greatly simplifies the complexity of [`generic_enum_builder`][generic_enum_builder].
It also reduces the required boiler-plate (generated methods are automatically available
without the need to reference them).

The added benefit is that standard **Dart enums** can be made "generic" by mapping
each enumeration instance to a constant value of arbitrary data-type.


## Introduction

Enumerations are ideal when we want to model *choosing* from a limited set of constant values.
In Dart, the value of an `enum` instance resolves to a `String`.

The package [`generic_enum`][generic_enum] can be used together with
[`generic_enum_builder`][generic_enum_builder] to build extensions
supporting mapping of enum instances
to a value of arbitrary data-type as well as json-serialization.


## Usage

To use this library include [`generic_enum`][generic_enum] as
dependencies in your `pubspec.yaml` file.
Include [`generic_enum_builder`][generic_enum_builder],
and [`build_runner`][build_runner] as dev_dependencies.

The example below shows how to define the enumeration `ComplexConstants`
where the value of each enum instance is mapped to a value of type `Complex`.
<details> <summary> Click to show source code. </summary>

  ```Dart
   // 0. Add import directives.
   import 'package:generic_enum/generic_enum.dart';
   import 'package:exception_templates/exception_templates.dart';

   // 1. Add part statement.
   part 'complex.g.dart';

   class Complex {
     const Complex(this.real, this.imag);
     final num real;
     final num imag;

     @override
     String toString() {
       return '$real + ${imag}i';
     }

     @override
     bool operator ==(Object other) =>
         identical(this, other) ||
         other is Complex &&
             runtimeType == other.runtimeType &&
             this.real == other.real &&
             this.imag == other.imag;

     @override
     int get hashCode => real.hashCode ^ imag.hashCode;
   }

   // Define an enum and annotate it.
   @GenerateValueExtension(
     mappedValueType: ValueType<Complex>(),
     mappedValues: const {
       'Complex(0, 0)',
       'Complex(0, 1)',
     },
   )
   @GenerateJsonExtension()
   enum ComplexConstant {
     zero,
     i,
   }
  ```
</details>

The required steps are detailed below.
0. Add the import directives shown above.
1. Add a part statement referencing the generated file `complex.g.dart`.
2. Define an enumeration and annotate it with:
   * @GenerateValueExtension(),
   * @GenerateJsonExtension().
3. Configure the build targets (and amend the generate_for entry).
   In your local `build.yaml` file add configurations for the builder
   `json_builder` provided by the package [generic_enum_builder].

   <details>  <summary> Click to show file content. </summary>

    ```sh
      targets:
        $default:
          builders:
            # Configure the builder `pkg_name|builder_name`
            generic_enum_builder|extension_builder:
              # Only run this builder on the specified input.
              enabled: true
              generate_for:
                - lib/*.dart

    ```
   </details>

   Note: The file `complex.dart` should be an asset that can be resolved by the builder.
   To limit the number of files scanned for annotationed classes during
   the build process one can use a `generate_for` statement in the builder configuration.

4. Build the project by running the command:
   ```Console
   $ pub run build_runner build --delete-conflicting-outputs
   ```
5. For the example presented here, the build process will generate the file `complex.g.dart`.
    <details>  <summary> Click to show file content. </summary>

      ```Dart
       // GENERATED CODE - DO NOT MODIFY BY HAND

       part of 'complex.dart';

       // **************************************************************************
       // ValueGenerator
       // **************************************************************************

       /// Extension providing the getter `stringValue`.
       extension ComplexConstantStringValue on ComplexConstant {
         /// Returns the mapped Complex value of
         /// an instance of `ComplexConstant`.
         Complex get value => const <ComplexConstant, Complex>{
               ComplexConstant.zero: Complex(0, 0),
               ComplexConstant.i: Complex(0, 1),
             }[this];

         /// Returns the String identifier of an instance of `ComplexConstant`.
         String get stringValue => const <ComplexConstant, String>{
               ComplexConstant.zero: 'zero',
               ComplexConstant.i: 'i',
             }[this];
       }

       // **************************************************************************
       // JsonGenerator
       // **************************************************************************

       /// Extension providing the functions `fromJson` and `toJson`.
       extension ToComplexConstant on ComplexConstant {
         /// Converts [json] to an instance of `ComplexConstant`.
         static ComplexConstant fromJson(Map<String, dynamic> json) {
           final index = (json['index']) as int;
           if (index == null) {
             throw ErrorOf<ComplexConstant>(
                 message: 'Error deserializing json to ComplexConstant.',
                 invalidState: 'json[index] returned null.',
                 expectedState: 'A map entry: {index: int value}.');
           }
           if (index >= 0 && index < ComplexConstant.values.length) {
             return ComplexConstant.values[index];
           } else {
             throw ErrorOf<ComplexConstant>(
                 message: 'Function fromJson could not find '
                     'an instance of type ComplexConstant.',
                 invalidState: 'ComplexConstant.values[$index] out of bounds.');
           }
         }

         /// Converts `this` to a map `Map<String, dynamic>`.
         Map<String, dynamic> toJson() =>
             {'index': ComplexConstant.values.indexOf(this)};

         /// Converts `this` to a json encoded `String`.
         String get jsonEncoded => '{"index":${ComplexConstant.values.indexOf(this)}}';
       }
      ```
     </details>

## Enum - Value Mapping

The annotation [`@GenerateValueExtension`][] takes the following optional parameters:

* `mappedValueType`, an instance of `ValueType<T>`. The type parameter `T` is used to specify
the data-type of the mapped enum values.
* `mappedValues`, a `Set` with entries of type `String`. The entries are copied verbatim
by the value extension generator and must represent valid instances of data-type `T`.
* `getterName`, a `String` with default value `stringValue`. It must be a valid Dart
identifier and can be used to configure the name of the getter returning the enum `String` value.
* `mappedGetterName`, a `String` which defaults to `value`. It must be a valid Dart
identifier and can be used to configure the name of the getter returning the mapped enum value.

## Limitations

Because of this [issue] it is not possible to pass an instance of `enum`
to the function `jsonEncode(Object object)` (provided by `dart:convert`)
even if the function `toJson()` is defined in an extension on the `enum`.

Alternative ways to serialize an instance of enum are:
* Use the generated getter `toJsonEncoded` to retrieve a json encoded `String`.
* Pass the result of `toJson()` to `jsonEncode`.
* Use a full blown serialization approach like [`json_serializable`][json_serializable].
This is recommended if your project already uses [`json_serializable`][json_serializable].

When it comes to deserialization, the usual approach is to define a factory constructor named `fromJson`.
This is not possible since extensions do not support constructors. Moreover, static extension-methods
are accessed by specifying the extension name,

To keep the notation similar to the "usual approach", the extension containing the static method `fromJson`
is named **To** + **Enum Name**, see example below.
```Dart
import 'dart:convert';
import 'package:test/test.dart';

import 'complex.dart';

final i = ComplexConstant.i;

// Encoding to Map<String, dynamic>.
Map<String, dynamic> json = i.toJson();

// Encoding to String.
String jsonEncoded0 = jsonEncode(i);   // Throws error! Extensions not available for dynamic types.
String jsonEncoded1 = jsonEncode(json) // Using dart:convert.
String jsonEncoded2 = i.jsonEncoded;   // Using the generated getter.
expect(jsonEncode1, jsonEncode2);

// Decoding (notice the prefix "To").
expect(ToComplexConstant.fromJson(json), i);
expect(ToComplexConstant.fromJson(jsonDecode(jsonEncoded1)), i);
```


## Examples

Further examples on how to define and build generic enumeration classes can be found in the package [generic_enum_example].


## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues

[analyzer]: https://pub.dev/packages/analyzer
[build_runner]: https://pub.dev/packages/build_runner
[extension-methods]: https://dart.dev/guides/language/extension-methods
[generic_enum]: https://pub.dev/packages/generic_enum
[generic_enum_annotation]: https://pub.dev/packages/generic_enum_annotation
[generic_enum_example]: https://github.com/simphotonics/generic_enum/tree/master/generic_enum_example
[generic_enum_builder]: https://pub.dev/packages/generic_enum_builder
[json_serializable]: https://pub.dev/packages/json_serializable
[source_gen]: https://pub.dev/packages/source_gen
[issue]: https://github.com/dart-lang/sdk/issues/42742
[issue comment]: https://github.com/dart-lang/language/issues/158#issuecomment-603967738