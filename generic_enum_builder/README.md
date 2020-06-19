# Generic Enum Builder
[![Build Status](https://travis-ci.com/simphotonics/generic_enum.svg?branch=master)](https://travis-ci.com/simphotonics/generic_enum)


## Introduction

The package [`generic_enum_builder`][generic_enum_builder] contains builders and
source code generating classes based on [`source_gen`][source_gen]
and [`analyzer`][analyzer].

The provided builders can be configured to build [`GenericEnum`][GenericEnum] classes
supporting json-serialization.

*Generic enumeration* classes appear to the user like a Dart `enum` would.
For example, generic enums can be used in `switch` statements, as annotations,
to initialize variables, or as default parameters in functions and constructors.

## Usage

To use this library include [`generic_enum`][generic_enum] as *dependency* in your `pubspec.yaml` file.
Include [`generic_enum_builder`][generic_enum_builder] and [`build_runner`][build_runner] as *dev_dependencies*.

A step-by-step guide on how to build a generic enumeration is provided [here].


## Examples

The package [`generic_enum_example`][generic_enum_example] provides a complete example on how to define and build
generic enumeration classes. As a starting point users could clone this repository, add
their own generic enum classes to the folder `lib` and build the library.


## Features and bugs
Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[generic_enum]: https://pub.dev/packages/generic_enum
[GenericEnum]: https://pub.dev/packages/generic_enum
[GenericEnumBuilder]: https://pub.dev/packages/generic_enum_builder
[generic_enum_annotation]: https://pub.dev/packages/generic_enum_annotation
[generic_enum_builder]: https://pub.dev/packages/generic_enum_builder
[analyzer]: https://pub.dev/packages/analyzer
[source_gen]: https://pub.dev/packages/source_gen
[generic_enum_example]: ../generic_enum_example
[generic_enum#boilerplate]: ../generic_enum#boilerplate
[build_runner]: https://pub.dev/packages/build_runner
[here]: https://github.com/simphotonics/generic_enum/tree/master/generic_enum#building-a-generic-enum
