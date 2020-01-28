# Generic Enum Example
[![Build Status](https://travis-ci.com/simphotonics/generic_enum.svg?branch=master)](https://travis-ci.com/simphotonics/generic_enum)


## Introduction

[GenericEnum] is a base class for creating generic classes with a fixed set of static constant instances.
These classes appear to the user like a [Dart enum] would.
For example, generic enums can be used in switch statements,
to initialize variables, or as default parameters in functions and constructors.

This library demonstrates how to define and built generic enumeration classes.

## Starting Point

This package provides a complete example on how to define and build
generic enumeration classes. As a starting point users could clone this repository, add
their own generic enum classes to the folder `lib` and build the library. Build instructions
are provided below.

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
maintained by manually. When defining several generic enumeration classes it might be more convenient to
use a builder.

4. Annotate the class with `@GenerateBuiltMap` and `@GenerateFromJson`.
5. Define an accessor for the private variable `_valueMap`.
6. Define a name factory constructor named `.fromJson` pointing to the function `fromJson`.

   ```Dart
   import 'package:built_collection/built_collection.dart';
   import 'package:generic_enum/generic_enum.dart';
   import 'package:generic_enum_annotation/generic_enum_annotation.dart';

   //   0. Add a part statement pointing to the generated file.
   part 'dpi_resolution.g.dart';

   //   1. Extend GenericEnum<T>
   @GenerateBuiltMap()   //         <----------- 4. Annotate class
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
     static BuiltMap<int, DpiResolution> get valueMap => _valueMap;

     // 6. Define the named factory constructor .fromJson:
     factory DpiResolution.fromJson(Map<String,dynamic> json) => _fromJson(json);

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

   The generated file `dpi_resolution.g.dart` should have the following content:
   ```Dart
      // GENERATED CODE - DO NOT MODIFY BY HAND

      part of 'dpi_resolution.dart';

      // **************************************************************************
      // JsonGenerator
      // **************************************************************************

      Map<String, dynamic> _toJson(DpiResolution instance) => instance.toJson();

      DpiResolution fromJson(Map<String, dynamic> json) {
        int value = GenericEnum.fromJson(json).value;
        return DpiResolution.valueMap[value];
      }

      // **************************************************************************
      // MapGenerator
      // **************************************************************************

      final _valueMap = BuiltMap<int, DpiResolution>({
        DpiResolution.LOW.value: DpiResolution.LOW,
        DpiResolution.MEDIUM.value: DpiResolution.MEDIUM,
        DpiResolution.HIGH.value: DpiResolution.HIGH
      });
   ```

## Features and bugs
Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[analyzer]: https://pub.dev/packages/analyzer
[source_gen]: https://pub.dev/packages/source_gen
[GenericEnum]: ../generic_enum
[Dart enum]: https://dart.dev/guides/language/language-tour#enumerated-types
[generic_enum_annotation]: https://pub.dev/packages/generic_enum_annotation
[generic_enum_builder]: https://pub.dev/packages/generic_enum_builder
[build_runner]: https://pub.dev/packages/build_runner
