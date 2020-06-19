# Generic Enumeration Classes for Dart
[![Build Status](https://travis-ci.com/simphotonics/generic_enum.svg?branch=master)](https://travis-ci.com/simphotonics/generic_enum)


## Update

As of [`generic_enum 0.2.2`][generic_enum],  the package [`generic_enum_annotation`][generic_enum_annotation]
is no longer required as a dependency when defining or building a generic enum.

## Introduction

Enumerations are ideal when we want to model *choosing* from a limited set of constant values.
In Dart, the value of an `enum` resolves to a `String`.

[GenericEnum] is a base class for creating enumeration classes with generic value type.
These classes appear to the user of the library much like a Dart `enum` would.
For example, generic enums can be used in `switch` statements, to initialize variables, or as default parameters in functions and constructors.

## Building a Generic Enum

To use this library include [generic_enum] as dependencies in your `pubspec.yaml` file.
Include [generic_enum_builder], and [build_runner] as dev_dependencies.

The example below shows how to define the generic enum class `DpiResolution`, extending `GenericEnum<int>`.
Note the use of `int` literals to specify the const value of the `DpiResolution` instances. For user defined types,
constant values are specified by calling a const constructor.
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
     // 8. Override the method [toJson].
     @override
     Map<String, dynamic> toJson() => _$DpiResolutionToJson(this);
   }
  ```
</details>

1. Add a part statement referencing the generated file `dpi_resolution.g.dart`.
2. Annotate the class with `@GenerateFromJson`.
3. Extend `GenericEnum<T>`.
4. Define a private `const` constructor that calls the super constructor and passes on the value of type `T`.
5. Define the static const instances of `DpiResolution`. You may capitalize instance names to mark them as constants.
6. Define a getter to provide access the private variable `_$DpiResolutionValueMap`. Alternatively,
   copy-paste the getter definition from the docs generated in `dpi_resolution.g.dart`.
7. Define a factory constructor named `.fromJson` redirecting to the function `_$DpiResolutionFromJson`.
Alternatively, copy-paste the constructor definition from the generated documentation located above the function `_$DpiResolutionFromJson`.
8. Define (or copy-paste) the method `toJson`. The documentation of the generated function `_$DpiResolutionToJson` contains the souce code
of the method `toJson`.
9. Configure the build targets (and amend the generate_for entry).
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

   Note: The file `dpi_resolution.dart` should be an asset that can be resolved by the builder.
   To limit the number of files scanned for annotationed classes during
   the build process one can use a `generate_for` statement in the builder configuration.

10. Build the project by running the command:
   ```Console
   $ pub run build_runner build --delete-conflicting-outputs
   ```
11. For the example presented here, the build process will generate the file `dpi_resolution.g.dart`.
    <details>  <summary> Click to show file content. </summary>

      ```Dart
      // GENERATED CODE - DO NOT MODIFY BY HAND

      part of 'dpi_resolution.dart';

      // **************************************************************************
      // JsonGenerator
      // **************************************************************************

      /// Converts an instance of [DpiResolution] to a map [Map<String, dynamic>].
      /// Add the following method to your class definition:
      /// ```
      ///  @override
      ///  Map<String, dynamic> toJson() => _$DpiResolutionToJson(this);
      /// ```
      Map<String, dynamic> _$DpiResolutionToJson(DpiResolution instance) =>
          {'key': _$DpiResolutionValueMap.values.toList().indexOf(instance)};

      /// Converts a map [Map<String, dynamic>] to an instance of [DpiResolution].
      /// Add the following factory constructor to your class definition:
      /// ```
      /// factory DpiResolution.fromJson(Map<String, dynamic> json) =>
      ///   _$DpiResolutionFromJson(json);
      /// ```
      DpiResolution _$DpiResolutionFromJson(Map<String, dynamic> json) {
        final key = (json['key']) as int;
        DpiResolution instance = _$DpiResolutionValueMap.values.toList()[key];
        if (instance == null) {
          throw GenericEnumException(
              '.fromJson constructor: Could not find a matching instance of type DpiResolution.');
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