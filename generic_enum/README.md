# Generic Enumerations For Dart
[![Build Status](https://travis-ci.com/simphotonics/generic_enum.svg?branch=master)](https://travis-ci.com/simphotonics/generic_enum)


## Update

As of [`generic_enum 0.3.0`][generic_enum] it is not longer required to extend `GenericEnum`.
In fact, this class has been removed.
The package now uses [`extension-methods`][extension-methods]. This change greatly
simplifies the complexity of [`generic_enum_builder`][generic_enum_builder]
and reduces the required boiler-plate (generated methods are automatically available).

The added benefit is that standard **Dart enums** can be made "generic" by mapping
each enumeration instance to a constant value of arbitrary data-type.


## Introduction

Enumerations are ideal when we want to model *choosing* from a limited set of constant values.
In Dart, the value of an `enum` instance resolves to a `String`.

The package [`generic_enum`][generic_enum] can be used together with
[`generic_enum_builder`][generic_enum_builder] to build an extension
supporting json-serialization. Additionally, the values of the enum instances
can be mapped to an arbitrary data-type.


## Usage

To use this library include [`generic_enum`][generic_enum] as dependencies in your `pubspec.yaml` file.
Include [`generic_enum_builder`][generic_enum_builder], and [`build_runner`][build_runner] as dev_dependencies.

The example below shows how to define the enumeration `DpiResolution`
where the value of each enum instance is mapped to a value of type `double`.
<details> <summary> Click to show source code. </summary>

  ```Dart
   // 0. Import required packages.
   import 'package:generic_enum/generic_enum.dart';
   import 'package:exception_templates/exception_templates.dart';

   // 1. Add a part statement pointing to the generated file.
   part 'dpi_resolution.g.dart';

   // 2. Define an enumeration.
   //    and annotate it with @GenerateJsonExtension().
   @GenerateJsonExtension()
   enum DpiResolution { LOW, MEDIUM, HIGH }

   // 3. Define an extension on the enumeration.
   extension DpiResolutionValue on DpiResolution {
   // 4. Define a getter mapping each instance of the enum to its base value.
     double get value => const {
           DpiResolution.LOW: 90.0,
           DpiResolution.MEDIUM: 300.0,
           DpiResolution.HIGH: 600.0,
         }[this];
   }
  ```
</details>

0. Add the import directives shown above.
1. Add a part statement referencing the generated file `dpi_resolution.g.dart`.
2. Define an enumeration and annotate it with @GenerateJsonExtension().
3. Define a public extension on the enumeration.
4. Define a getter mapping each instance of the enum to a unique const value with arbitrary data-type.
 (Inspired by this [issue comment]).

5. Configure the build targets (and amend the generate_for entry).
   In your local `build.yaml` file add configurations for the builder
   `json_builder` provided by the package [generic_enum_builder].

   <details>  <summary> Click to show file content. </summary>

    ```sh
      targets:
        $default:
          builders:
            # Configure the builder `pkg_name|buil, provided by `dart:convert`.der_name`
            generic_enum_builder|json_builder:
              # Only run this builder on the specified input.
              enabled: true
              generate_for:
                - lib/*.dart

    ```
   </details>

   Note: The file `dpi_resolution.dart` should be an asset that can be resolved by the builder.
   To limit the number of files scanned for annotationed classes during
   the build process one can use a `generate_for` statement in the builder configuration.

6. Build the project by running the command:
   ```Console
   $ pub run build_runner build --delete-conflicting-outputs
   ```
7. For the example presented here, the build process will generate the file `dpi_resolution.g.dart`.
    <details>  <summary> Click to show file content. </summary>

      ```Dart
      // GENERATED CODE - DO NOT MODIFY BY HAND

      part of 'dpi_resolution.dart';

      // **************************************************************************
      // JsonGenerator
      // **************************************************************************

      /// Extension providing the functions `fromJson` and `toJson`.
      extension ToDpiResolution on DpiResolution {
        /// Converts [json] to an instance of `DpiResolution`.
        static DpiResolution fromJson(Map<String, dynamic> json) {
          final index = (json['index']) as int;
          if (index == null) {
            throw ErrorOf<DpiResolution>(
                message: 'Error deserializing json to DpiResolution.',
                invalidState: 'json[index] returned null.',
                expectedState: 'A map entry: {index: int value}.');
          }
          if (index >= 0 && index < DpiResolution.values.length) {
            return DpiResolution.values[index];
          } else {
            throw ErrorOf<DpiResolution>(
                message: 'Function fromJson could not find '
                    'an instance of type DpiResolution.',
                invalidState: 'DpiResolution.values[$index] out of bounds.');
          }
        }

        /// Converts `this` to a map `Map<String, dynamic>`.
        Map<String, dynamic> toJson() =>
            {'index': DpiResolution.values.indexOf(this)};

        /// Converts `this` to a json encoded `String`.
        String get jsonEncoded => '{"index":${DpiResolution.values.indexOf(this)}}';
      }
      ```
     </details>

## Limitations

Because of this [issue] it is not possible to pass an instance of `enum`
to the function `jsonEncode(Object object)` (provided by `dart:convert`)
even if the function `toJson()` is defined in an extension on the `enum`.

Alternative ways to serialize an instance of enum are:
* Use the getter `toJsonEncoded` to retrieve a json encoded `String`.
* Pass the result of `toJson()` to `jsonEncode`.
* Use a full blown serialization approach like [`json_serializable`][json_serializable].
This is recommended if your project already uses [`json_serializable`][json_serializable].


When it comes to deserialization, the usual approach is to define a factory constructor named `fromJson`.
This is not possible since extensions do not support constructors. Moreover, static extension-methods
are accessed by specifying the extension name,

To keep the notation similar to the "usual approach", the extension containing the static method `fromJson`
is named **To** + **Enum Name**, see example below.
```Dart
import 'dpi_resolution.dart';
import 'package:test/test.dart';

final low = DpiResolution.LOW;

// Encoding:
Map<String, dynamic> json = low.toJson();

// String jsonEncoded0 = jsonEncode(low); Throws! Extensions not available for dynamic types.
String jsonEncoded1 = jsonEncode(json)
String jsonEncoded2 = low.jsonEncoded;
expect(jsonEncode1, jsonEncode2);

// Decoding (notice the prefix "To").
expect(ToDpiResolution.fromJson(json), low);
expect(ToDpiResolution.fromJson(jsonDecode(jsonEncoded)), low);
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