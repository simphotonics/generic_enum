# Generic Enum Annotation


## Introduction

This library defines annotation classes (with const constructor). These are used to **annotate** classes that extend `GenericEnum`.

`GenericEnum` is a base class for creating generic classes with a fixed set of static constant instances. These classes appear to the user like a Dart `enum` would. For example, generic enums can be used in `switch` statements, to initialize variables, or as default parameters in functions and constructors.

The annotations defined in this library are:
 - `@GenerateMap()`: Requests the generation of a `BuiltMap` containing the enum values and      instances.
 - `@GenerateJson()`: Requests the generation of the methods `_toJson` and `fromJson`

Important: `@GenerateJson()` requires `@GenerateMap()` since the `fromJson` function uses the
BuiltMap to retrieve generic enum instances based on their value.


## Examples

For examples on how to use `generic_enum_annotation` to annotate and build generic enums see:
[example.dart](https://github.com/simphotonics/generic_enum/tree/master/generic_enum_example)


## Features and bugs
Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
