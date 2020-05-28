# Generic Enum Example
[![Build Status](https://travis-ci.com/simphotonics/generic_enum.svg?branch=master)](https://travis-ci.com/simphotonics/generic_enum)


## Introduction

[GenericEnum] is a base class for creating generic classes with a fixed set of static constant instances.
These classes appear to the user like a [Dart enum] would.
For example, generic enums can be used in switch statements,
to initialize variables, or as default parameters in functions and constructors.

This library demonstrates how to define and build generic enumeration classes.

## Starting Point

This package provides complete examples on how to define and build
generic enumeration classes. As a starting point users could clone this repository, add
their own generic enum classes to the folder `lib` and build the library. Build instructions
are provided below.

## Usage

To use this library include [generic_enum] and [generic_enum_annotation] as dependency in your pubspec.yaml file.
Include [generic_enum_builder], [source_gen], [build_runner] as dev_dependencies.

A step-by-step guide on how to build a generic enumeration is provided [here].

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[analyzer]: https://pub.dev/packages/analyzer
[source_gen]: https://pub.dev/packages/source_gen
[GenericEnum]: ../generic_enum
[here]: https://github.com/simphotonics/generic_enum/tree/master/generic_enum#building-a-generic-enum
[Dart enum]: https://dart.dev/guides/language/language-tour#enumerated-types
[generic_enum]: https://pub.dev/packages/generic_enum
[generic_enum_annotation]: https://pub.dev/packages/generic_enum_annotation
[generic_enum_builder]: https://pub.dev/packages/generic_enum_builder
[build_runner]: https://pub.dev/packages/build_runner
