# Generic Enum Builder
[![Dart](https://github.com/simphotonics/generic_enum/actions/workflows/dart.yml/badge.svg)](https://github.com/simphotonics/generic_enum/actions/workflows/dart.yml)



## Introduction

The package [`generic_enum_builder`][generic_enum_builder] contains a builder and
source code generating classes based on [`source_gen`][source_gen]
and [`analyzer`][analyzer].

The provided builder can be configured to generate custom extensions containing value-mapping
and json-serialization methods for Dart enums annotated with
[`GenerateValueExtension`][GenerateValueExtension] and [`GenerateJsonExtension`][GenerateJsonExtension] provided by [`generic_enum`][generic_enum].


## Usage

To use this library include [`generic_enum`][generic_enum] as *dependency* in your `pubspec.yaml` file.
Include [`generic_enum_builder`][generic_enum_builder] and [`build_runner`][build_runner] as *dev_dependencies*.

A step-by-step guide on how to configure the builder is provided at
[https://pub.dev/packages/generic_enum#usage](https://pub.dev/packages/generic_enum#usage).


## Examples

The package [`generic_enum_example`][generic_enum_example] provides a complete example on how to define and build
generic enumeration classes. As a starting point users could clone this repository, add
their own annotated enumerations to the folder `lib` and build the library.


## Features and bugs
Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues

[analyzer]: https://pub.dev/packages/analyzer

[build_runner]: https://pub.dev/packages/build_runner

[generic_enum]: https://pub.dev/packages/generic_enum

[generic_enum_builder]: https://pub.dev/packages/generic_enum_builder

[source_gen]: https://pub.dev/packages/source_gen

[generic_enum_example]: ../generic_enum_example

[GenerateJsonExtension]: https://pub.dev/documentation/generic_enum/latest/generic_enum/GenerateJsonExtension-class.html

[GenerateValueExtension]: https://pub.dev/documentation/generic_enum/latest/generic_enum/GenerateValueExtension-class.html
