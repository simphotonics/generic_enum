# Generic Enumeration Classes for Dart
[![Build Status](https://travis-ci.com/simphotonics/generic_enum.svg?branch=master)](https://travis-ci.com/simphotonics/generic_enum)


## Update

As of [`generic_enum`][generic_enum] version **0.2.2**, the package [`generic_enum_annotation`][generic_enum_annotation]
is no longer required as a dependency when building a generic enum.

## Introduction

Enumerations are ideal when we want to model *choosing* from a limited set of constant values.
In Dart, the value of an `enum` resolves to a `String`.import 'package:generic_enum_annotation/generic_enum_annotation.dart';

[GenericEnum] is a base class for creating enumeration classes with generic value type.
These classes appear to the user of the library much like a Dart `enum` would.
For example, generic enums can be used in `switch` statements, to initialize variables, or as default parameters in functions and constructors.

## Building a Generic Enum

To use this library include [generic_enum] as dependencies in your `pubspec.yaml` file.
Include [generic_enum_builder], and [build_runner] as dev_dependencies.

To build the generic enum class, `DpiResolution` (shown below), the following steps are required:
<details> <summary> Click to show source code. </summary>

  ```Dart
   import 'package:generic_enum/generic_enum.dart';
   //   1. Add a part statement pointing to the generated file.
   part 'dpi_resolution.g.dart';
   //   2. Annotate with @GenerateFromJson()
   //   3. Extend GenericEnum<T>
   @GenerateFromJson()
   class DpiResolution extends GenericEnum<int> {
     // 4. Define a private const constructor that calls the super constructor
     //    and passes on the value of type int.
     const DpiResolution._(int value) : super(value);
     // 5. Define static constant instances of type DpiResolution
     static const DpiResolution LOW = DpiResolution._(90);
     static const DpiResolution MEDIUM = DpiResolution._(300);
     static const DpiResolution HIGH = DpiResolution._(600);
     // 6. Give access to _valueMap and
     static Map<int, DpiResolution> get valueMap => _$DpiResolutionValueMap;
     // 7. Define the named factory constructor .fromJson:
     factory DpiResolution.fromJson(Map<String,dynamic> json)
         => _$DpiResolutionFromJson(json);
   }
  ```
</details>

1. Add a part statement referencing the generated file `dpi_resolution.g.dart`.
2. Annotate the class with `@GenerateFromJson`.
3. Extend `GenericEnum<T>`. To use the serialization methods, the type parameter `T` should have `fromJson` and `toJson` methods.
4. Define a private `const` constructor that calls the super constructor and passes on the value of type `T`.
5. Define the static const instances of `DpiResolution`. You may capitalize instance names to mark them as constants.
6. Define an accessor for the private variable `_$<ClassName>ValueMap`.
7. Define a factory constructor named `.fromJson` pointing to the function `_$<ClassName>FromJson`.
8. Configure the build targets (and amend the generate_for entry).
   In your local `build.yaml` file add configurations for the builders
   `map_builder` and `json_builder` provided by the package [generic_enum_builder].

   <details>  <summary> Click to show file content. </summary>

    ```sh
      targets:
        $default:
          builders:
            # Configure the builder `pkg_name|builder_name`
            generic_enum_builder|map_builder:
              # Only run this builder on the specified input.
              enabled: true
              generate_for:
                - lib/*.dart
            # Configure the builder `pkg_name|builder_name`
            generic_enum_builder|json_builder:
              # Only run this builder on the specified input.
              enabled: true
              generate_for:
                - lib/*.dart
    ```
   </details>

   Note: The file `dpi_resolution.dart` should be an asset that can be resolved by the builder. To limit the number of files scanned for annotationed classes during the build process one can use a `generate_for` statement in the builder configuration.

9. Build the project by running the command:
   ```Console
   $ pub run build_runner build --delete-conflicting-outputs
   ```
10. For the example presented here, the build process will generate the file `dpi_resolution.g.dart`.
    <details>  <summary> Click to show file content. </summary>

      ```Dart
      // GENERATED CODE - DO NOT MODIFY BY HAND

      part of 'dpi_resolution.dart';

      // **************************************************************************
      // JsonGenerator
      // **************************************************************************

      /// Converts a map [Map<String, dynamic>] to an instance of [DpiResolution].
      /// Add the following factory constructor to your class definition:
      /// ```
      /// factory DpiResolution.fromJson(Map<String, dynamic> json) =>
      ///   _$DpiResolutionFromJson(json);
      /// ```
      DpiResolution _$DpiResolutionFromJson(Map<String, dynamic> json) {
        int value = GenericEnum.fromJson(json).value;
        DpiResolution instance = _$DpiResolutionValueMap[value];
        if (instance == null) {
          throw GenericEnumException(
            'Could not find DpiResolution instance with value: $value.',
          );
        }
        return instance;
      }

      // **************************************************************************
      // MapGenerator
      // **************************************************************************

      /// Maps a value of type [int] to an instance of [DpiResolution].
      /// Add the following getter to your class definition:
      /// ```
      /// static Map<int,DpiResolution> get valueMap => _$DpiResolutionValueMap;
      /// ```
      final _$DpiResolutionValueMap = Map<int, DpiResolution>.unmodifiable({
        DpiResolution.LOW.value: DpiResolution.LOW,
        DpiResolution.MEDIUM.value: DpiResolution.MEDIUM,
        DpiResolution.HIGH.value: DpiResolution.HIGH,
      });
      ```
     </details>



## Usage
[GenericEnum] instances and their value are **compile-time constants** and can be
used in *switch statements* to initalize other *constants*, *final variables*, or
as *parameters* or *default parameters* in constructors and functions.

The sample class `ScannerSettings` (defined below) illustrates the use of a generic enum.

The `value` of generic enums can be accessed directly using dot notation (like in the
initializer statement below).

```Dart
class ScannerSettings{

  const ScannerSettings({
    this.scanMode,
    this.size,
    this.dpiResolution = DpiResolution.Medium,
    },
  ):_dipRes = dpiResolution.value; // Access value using dot-notation.

  final DpiResolution dpiResolution;
  final int _dpiRes;
  final ScanMode;
  final ScanSize;
}
```

## Examples

Further examples on how to define and build generic enumeration classes can be found in the package [generic_enum_example].

For details of how to use generic enums as annotations and how to retrieve their value
using Dart's static [analyzer] package see [example].

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[analyzer]: https://pub.dev/packages/analyzer
[source_gen]: https://pub.dev/packages/source_gen
[generic_enum]: https://pub.dev/packages/generic_enum
[GenericEnum]: https://pub.dev/packages/generic_enum
[generic_enum_example]: ../generic_enum_example
[example]: example
[generic_enum_annotation]: https://pub.dev/packages/generic_enum_annotation
[generic_enum_builder]: https://pub.dev/packages/generic_enum_builder
[build_runner]: https://pub.dev/packages/build_runner