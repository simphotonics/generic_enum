# Generic Enum Builder - Test

## Introduction

The package [`generic_enum_builder`][generic_enum_builder] provides source code generating classes
based on [`source_gen`][source_gen] and [`analyzer`][analyzer].

This part of the library contains tests designed to verify
that the source code generators [`ValueGenerator`][ValueGenerator]
and [`JsonGenerator`][JsonGenerator] produce correct output.

## Running the tests

The tests may be run in a terminal by navigating to the base folder of a local
copy of the library and using the command:
```Console
$ dart test
```

## Examples

The package [generic_enum_example] provides a complete example on how to define and build
generic enumeration classes.


## Features and bugs
Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues

[analyzer]: https://pub.dev/packages/analyzer

[source_gen]: https://pub.dev/packages/source_gen

[generic_enum_example]: https://pub.dev/packages/generic_enum_example

[generic_enum_builder]: https://pub.dev/packages/generic_enum_builder

[LibraryReader]: https://pub.dev/documentation/source_gen/latest/source_gen/LibraryReader-class.html

[ValueGenerator]: https://pub.dev/documentation/generic_enum/latest/generic_enum/ValueGenerator-class.html

[JsonGenerator]: https://pub.dev/documentation/generic_enum/latest/generic_enum/JsonGenerator-class.html
