# Generic Enumeration Classes for Dart
[![Build Status](https://travis-ci.com/simphotonics/generic_enum.svg?branch=master)](https://travis-ci.com/simphotonics/generic_enum)

## Introduction

Enumerations are ideal when we want to model *choosing* from a limited set of constant values.
In Dart, the value of an `enum` resolves to a `String`.

`GenericEnum` is a base class for creating enumeration classes with generic value type.
These classes appear to the user of the library much like a Dart `enum` would.
For example, generic enums can be used in `switch` statements, to initialize variables, or as
default parameters in functions and constructors.

## Boilerplate

To use this library include [generic_enum_annotation] as dependency in your pubspec.yaml file.
Include [generic_enum_builder], [source_gen], [build_runner] as dev_dependencies.


To create a generic enum class, say `DpiResolution`, the following steps are required:
1. Extend `GenericEnum<T>` where `T` is a Dart built-in type or a class with a const        constructor.
   (To use the serialization methods, `T` should have `fromJson` and `toJson` methods.)
2. Define a private `const` constructor that calls the super constructor and passes on the value of type `T`.
3. Define the static const instances of `DpiResolution`. You may capitalize instance names to mark them as constants.

The following steps are **optional**. They are only required if one needs access to a list of all defined values
and instances or if json-serialization is needed.
In principle, a map containing values and instances and serialization functions could be
maintained manually. When defining several generic enumeration classes it might be more convenient to
use a builder.

4. Annotate the class with `@GenerateValueMap` and `@GenerateFromJson`.
5. Define an accessor for the private variable `_valueMap`.
6. Define a name factory constructor named `.fromJson` pointing to the function `fromJson`.

   ```Dart
   import 'package:built_collection/built_collection.dart';
   import 'package:generic_enum/generic_enum.dart';
   import 'package:generic_enum_annotation/generic_enum_annotation.dart';

   //   0. Add a part statement pointing to the generated file.
   part 'dpi_resolution.g.dart';

   //   1. Extend GenericEnum<T>
   @GenerateValueMap()   //         <----------- 4. Annotate class
   @GenerateFromJson()   //
   class DpiResolution extends GenericEnum<int> {
     // 2. Define a private const constructor that calls the super constructor
     //    and passes on the value of type int.
     const DpiResolution._(int value) : super(value);

     // 3. Define static constant instances of type DpiResolution
     static const DpiResolution LOW = DpiResolution._(90);
     static const DpiResolution MEDIUM = DpiResolution._(300);
     static const DpiResolution HIGH = DpiResolution._(600);

     // 5. Give access to _valueMap and
     static Map<int, DpiResolution> get valueMap => _$DpiResolutionValueMap;

     // 6. Define the named factory constructor .fromJson:
     factory DpiResolution.fromJson(Map<String,dynamic> json) => _$DpiResolutionFromJson(json);

   }
   ```
7. Configure the build targets (and amend the generate_for entry).
   In your local `build.yaml` file add the following targets:
   ```Shell
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

8. Build the project by running the command
   ```Shell
   $ pub run build_runner build --delete-conflicting-outputs
   ```

## Usage
`GenericEnum` instances and their value are **compile-time constants** and can be
used in *switch statements* to initalize other *constants*, *final variables*, or as *parameters* or *default parameters*
in constructors and functions.

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

Further examples on how to define and build generic enumeration classes can be found in the library [generic_enum_example].

For details of how to use generic enums as annotations and how to retrieve their value
using Dart's static [analyzer] package see [example].

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[analyzer]: https://pub.dev/packages/analyzer
[source_gen]: https://pub.dev/packages/source_gen
[generic_enum_example]: ../generic_enum_example
[example]: example
[generic_enum_annotation]: https://pub.dev/packages/generic_enum_annotation
[generic_enum_builder]: https://pub.dev/packages/generic_enum_builder
[build_runner]: https://pub.dev/packages/build_runner