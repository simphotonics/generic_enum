# Generic Enum Annotation


## Introduction

This library defines annotation classes (with const constructor). These are used to **annotate** classes that extend `GenericEnum`.

`GenericEnum` is a base class for creating generic classes with a fixed set of static constant instances.
These classes appear to the user like a Dart `enum` would. For example, generic enums can be used in
`switch` statements, to initialize variables, or as default parameters in functions and constructors.

The annotations defined in this library are:
 - `@GenerateMap()`: Requests the generation of a `BuiltMap` containing the enum values and
    static const instances.
 - `@GenerateJson()`: Requests the generation of the methods `_toJson` and `fromJson`

Important: `@GenerateJson()` requires `@GenerateMap()` since the `fromJson` function uses the
BuiltMap to retrieve generic enum instances based on their value.


## Examples

The package [generic_enum_example] provides a complete example on how to define and build
generic enumeration classes. As a starting point users could clone this repository, add
their own generic enum classes to the folder `lib` and build the library.


## Features and

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[analyzer]: https://pub.dev/packages/analyzer
[source_gen]: https://pub.dev/packages/
[generic_enum_example] ../../generic_enum_example
