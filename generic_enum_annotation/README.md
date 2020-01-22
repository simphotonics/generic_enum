# Generic Enum Annotation


## Introduction

This library defines annotation classes (with const constructor). These are used to **annotate** classes that extend `GenericEnum`.

`GenericEnum` is a base class for creating generic classes with a fixed set of static constant instances. These classes appear to the user like a Dart `enum` would. For example, generic enums can be used in `switch` statements, to initialize variables, or as default parameters in functions and constructors.

The annotations defined in this library are:
 - `@GenerateJson()`: Requests the generation of the methods `_toJson` and `fromJson`
 - `@GenerateMap()`: Requests the generation of a `BuiltMap` containing the enum values and instances.

## Usage

To use this library include `generic_enum_annotation` as dependency in your pubspec.yaml file.
Include `generic_enum_generator, source_gen, build_runner` as dev_dependencies.

To create a generic enum class, say `DpiResolution`, the following steps are required:
1. Extend `GenericEnum<T>` where `T` is a Dart built-in type or a class with a const constructor. (To use the serialization methods `T` should have `fromJson` and `toJson` methods.)
2. Annotate the class with `@GenerateMap` and `@GenerateJson`.
3. Define a private `const` constructor that calls the super constructor and passes on the value of type `T`.
4. Define the static const instances of `DpiResolution`. You may capitalize instance names to mark them as constants.
5. Define accessors for the private variable `_valueMap` and `_toJson`.
   ```Dart
   import 'package:built_collection/generic_enum.dart';
   import 'package:generic_enum/generic_enum.dart';
   import 'package:generic_enum_annotation/generic_enum_annotation.dart';

   //   1. Extend GenericEnum<T>
   @GenerateMap()  // 2. Annotate class
   @GenerateJson() //
   class DpiResolution extends GenericEnum<int> {

     // 3. Define a private const constructor that calls the super constructor
     //    and passes on the value of type int.
     const DpiResolution._(int) : super(value);

     // 4. Define static constant instances of type DpiResolution
     static const DpiResolution LOW = DpiResolution._(90);
     static const DpiResolution MEDIUM = DpiResolution._(300);
     static const DpiResolution HIGH = DpiResolution._(600);

     // 5. Give access to _valueMap and _toJson.
     static BuiltMap<int,DpiResolution> get => _valueMap;
     Map<String,dynamic> toJson => _toJson(this);
   }

6. Configure the build targets.
   In your local `build.yaml` file add the following targets:
   ```Shell
   targets:
     $default:
       builders:
         # Configure the builder `pkg_name|builder_name`
         generic_enum_generator|map_builder:
           # Only run this builder on the specified input.
           enabled: true
           generate_for:
             - lib/*.dart
         # Configure the builder `pkg_name|builder_name`
         generic_enum_generator|json_builder:
           # Only run this builder on the specified input.
           enabled: true
           generate_for:
             - lib/*.dart
    ```

7. Build the project by running the command
   ```Shell
   $ flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

## Examples

For a simple example on how to use `generic_enum_annotation` to annotate and build generic enums see:
[example.dart](https://github.com/simphotonics/generic_enum/tree/master/generic_enum_example)


## Features and bugs
Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[analyzer]: https://pub.dev/packages/analyzer
[source_gen]: https://pub.dev/packages/source_gen
