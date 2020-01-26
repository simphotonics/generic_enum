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

To create a generic enum class, say `DpiResolution`, the following steps are required:
1. Extend `GenericEnum<T>` where `T` is a Dart built-in type or a class with a const        constructor.
   (To use the serialization methods, `T` should have `fromJson` and `toJson` methods.)
2. Annotate the class with `@GenerateMap` and `@GenerateJson`.
3. Define a private `const` constructor that calls the super constructor and passes on      the value of type `T`.
4. Define the static const instances of `DpiResolution`. You may capitalize instance        names to mark them as constants.
5. Define accessors for the private variable `_valueMap` and `_toJson`.
   ```Dart
   import 'package:built_collection/built_collection.dart';
   import 'package:generic_enum/generic_enum.dart';
   import 'package:generic_enum_annotation/generic_enum_annotation.dart';

   //   0. Add a part statement pointing to the generated file.
   part 'dpi_resolution.g.dart';

   //   1. Extend GenericEnum<T>
   @GenerateBuiltMap()   //         <----------- 2. Annotate class
   @GenerateToFromJson() //
   class DpiResolution extends GenericEnum<int> {
     // 3. Define a private const constructor that calls the super constructor
     //    and passes on the value of type int.
     const DpiResolution._(int value) : super(value);

     // 4. Define static constant instances of type DpiResolution
     static const DpiResolution LOW = DpiResolution._(90);
     static const DpiResolution MEDIUM = DpiResolution._(300);
     static const DpiResolution HIGH = DpiResolution._(600);

     // 5. Give access to _valueMap and _toJson.
     static BuiltMap<int, DpiResolution> get valueMap => _valueMap;
     Map<String, dynamic> toJson() => _toJson(this);
   }
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