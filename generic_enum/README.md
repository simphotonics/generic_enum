# Generic Enumerations For Dart
[![Build Status](https://travis-ci.com/simphotonics/generic_enum.svg?branch=main)](https://travis-ci.com/simphotonics/generic_enum)


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

The example below shows how to define the enumeration `DpiResolution`
and map each enum instance to a value of type `double`.
<details> <summary> Click to show source code. </summary>

```Dart
 import 'package:generic_enum/generic_enum.dart';
 // 0. Import package exception_templates.
 import 'package:exception_templates/exception_templates.dart';

 // 1. Add a part statement pointing to the generated file.
 part 'dpi_resolution.g.dart';

 // 2. Define an enumeration
 //    and annotate it with @GenerateJsonExtension().
 @GenerateValueExtension(
   valueType: double,
   values: const {'90.0', '300.0', '600.0'},
 )
 @GenerateJsonExtension()
 enum DpiResolution { low , medium, high }

```
</details>

The required steps are detailed below:

0. Add the import directives shown above.
1. Add a part statement referencing the generated file `complex.g.dart`.
2. Define an enumeration and annotate it with:
   * @GenerateValueExtension() to generated the enum getters `value`, `valueMap` and `stringValue`
   * @GenerateJsonExtension()  to generate the enum method `toJson()` and `To<EnumName>.fromJson(json)`.
3. Configure the build targets (and amend the generate_for entry).
   In your local `build.yaml` file add configurations for the builders
   provided by the package [generic_enum_builder].

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

   Note: The file `dpi_resolution.dart` should be an asset that can be resolved by the builder.
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

     part of 'dpi_resolution.dart';

     // **************************************************************************
     // ValueGenerator
     // **************************************************************************

     /// Extension on `DpiResolution` providing value-getters.
     extension DpiResolutionValue on DpiResolution {
       /// Returns value of type <double> mapped to
       /// an instance of `DpiResolution`.
       double get value => const <DpiResolution, double>{
             DpiResolution.low : 90.0,
             DpiResolution.medium: 300.0,
             DpiResolution.high: 600.0,
           }[this]!;

       /// Returns the String identifier of an instance of `DpiResolution`.
       String get stringValue => const <DpiResolution, String>{
             DpiResolution.low : 'low ',
             DpiResolution.medium: 'medium',
             DpiResolution.high: 'high',
           }[this]!;

       /// Returns a mapping of instance name to enum instance.
       Map<String, DpiResolution> get valueMap => const <String, DpiResolution>{
             'low ': DpiResolution.low ,
             'medium': DpiResolution.medium,
             'high': DpiResolution.high,
           };
     }

     // **************************************************************************
     // JsonGenerator
     // **************************************************************************

     /// Extension providing the functions `fromJson()`, `toJson()`,
     /// and the getter `jsonEncoded`.
     extension ToDpiResolution on DpiResolution {
       /// Converts [json] to an instance of `DpiResolution`.
       static DpiResolution fromJson(Map<String, dynamic> json) {
         final index = (json['index']) as int?;
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

## Enum - Value Mapping

The annotation [`@GenerateValueExtension`][GenerateValueExtension] requires the following parameters:
* `Type valueType`: The type of the constants mapped to the enum instances.
* `Set<String> values`. The entries are copied verbatim
by the generator and must represent valid const instances of the data-type `valueType`. The number of
entries must match the number of enum instances.


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

import 'dpi_resolution.dart';

final low = DpiResolution.low;

// Encoding to Map<String, dynamic>.
Map<String, dynamic> json = low.toJson();

// Encoding to String.
String jsonEncoded0 = jsonEncode(low);   // Throws error! Extensions not available for dynamic types.
String jsonEncoded1 = jsonEncode(json)   // Using dart:convert.
String jsonEncoded2 = low.jsonEncoded;   // Using the generated getter.
expect(jsonEncode1, jsonEncode2);

// Decoding (notice the prefix "To").
expect(ToDpiResolution.fromJson(json), low);
expect(ToDpiResolution.fromJson(jsonDecode(jsonEncoded1)), low);
```


## Examples

Further examples on how to define and build generic enumeration classes can be found in the package [generic_enum_example].


## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues

[analyzer]: https://pub.dev/packages/analyzer

[build_runner]: https://pub.dev/packages/build_runner

[extension-methods]: https://dart.dev/guides/language/extension-methods

[GenerateValueExtension]: https://pub.dev/documentation/generic_enum/latest/generic_enum/GenerateValueExtension-class.html

[generic_enum]: https://pub.dev/packages/generic_enum

[generic_enum_annotation]: https://pub.dev/packages/generic_enum_annotation

[generic_enum_example]: https://github.com/simphotonics/generic_enum/tree/main/generic_enum_example

[generic_enum_builder]: https://pub.dev/packages/generic_enum_builder

[json_serializable]: https://pub.dev/packages/json_serializable

[source_gen]: https://pub.dev/packages/source_gen

[issue]: https://github.com/dart-lang/sdk/issues/42742

[issue comment]: https://github.com/dart-lang/language/issues/158#issuecomment-603967738