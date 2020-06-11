# Generic Enum Annotation
[![Build Status](https://travis-ci.com/simphotonics/generic_enum.svg?branch=master)](https://travis-ci.com/simphotonics/generic_enum)


## Update

As of [`generic_enum version 0.2.2`][generic_enum], the package [`generic_enum_annotation`][generic_enum_annotation]
is no longer required as a dependency when building a generic enum.


## Introduction

This library defines annotations used to annotate classes that extend [`GenericEnum`][GenericEnum].

[GenericEnum] is a base class for creating generic classes with a fixed set of static constant instances.
These classes appear to the user like a Dart enumeration.
For example, generic enums can be used in `switch` statements, to initialize variables, or as default parameters in functions and constructors.

The annotations defined in this library are:
 - `@GenerateValueMap()`: Requests the generation of an unmodifiable map `_$<ClassName>ValueMap` containing the enum values and const static instances.
 - `@GenerateFromJson()`: Requests the generation of the private function `_$<ClassName>FromJson` and the generation of `_$<ClassName>ValueMap`.
    Note: A `ToJson` function is already provided by the base class [generic_enum].
 - `@GenerateIdentifier()`: Requests the generation of the private function `_$<ClassName>Identifier`.
    The function can be use to retrieve the identifier of each defined const generic enum instance.

## Usage

To use this library include [generic_enum] and [generic_enum_annotation] as dependency in your pubspec.yaml file.
Include [`generic_enum_builder`][generic_enum_builder] and [`build_runner`][build_runner] as dev_dependencies.

A step-by-step guide on how to build a generic enumeration is provided [here].


## Examples

The package [`generic_enum_example`][generic_enum_example] provides a complete example on how to define and build
generic enumeration classes. As a starting point users could clone this repository, add
their own generic enum classes to the folder `lib` and build the library.

## Features and bugs
Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[analyzer]: https://pub.dev/packages/analyzer
[here]: https://github.com/simphotonics/generic_enum/tree/master/generic_enum#building-a-generic-enum
[source_gen]: https://pub.dev/packages/
[generic_enum]: https://pub.dev/packages/generic_enum
[GenericEnum]: https://pub.dev/packages/generic_enum
[generic_enum_example]: ../generic_enum_example
[source_gen]: https://pub.dev/packages/source_gen
[generic_enum_annotation]: https://pub.dev/packages/generic_enum_annotation
[generic_enum_builder]: https://pub.dev/packages/generic_enum_builder
[build_runner]: https://pub.dev/packages/build_runner
[enumerated types]: https://dart.dev/guides/language/language-tour#enumerated-types
