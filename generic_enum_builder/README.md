# Generic Enum Builder
[![Build Status](https://travis-ci.com/simphotonics/generic_enum.svg?branch=master)](https://travis-ci.com/simphotonics/generic_enum)


## Introduction

The package [`generic_enum_builder`][generic_enum_builder] contains builders and
source code generating classes based on [`source_gen`][source_gen]
and [`analyzer`][analyzer].

The provided builder can be used to build an custom extensions supporting json-serialization.


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
[analyzer]: https://pub.dev/packages/analyzer
[build_runner]: https://pub.dev/packages/build_runner
[generic_enum]: https://pub.dev/packages/generic_enum
[generic_enum_builder]: https://pub.dev/packages/generic_enum_builder
[source_gen]: https://pub.dev/packages/source_gen
[generic_enum_example]: ../generic_enum_example

[here]: https://github.com/simphotonics/generic_enum/tree/master/generic_enum#building-a-generic-enum
