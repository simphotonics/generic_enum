# Generic Enum Builder - Test

## Introduction

[GenericEnumBuilder] provides source code generating classes
based on [source_gen] and [analyzer].

This part of the library contains tests designed to verify
that the source code generators [MapGenerator] and [JsonGenerator]
produce correct output.

The folder [src](src) contains sample classes extending [GenericEnum].
The content of these files is accessed via a [LibraryReader].


## Running the tests

The tests may be run in a terminal by navigating to the base folder of a local copy of the library and using the command:
```Shell
$ pub run test
```

## Examples

The package [generic_enum_example] provides a complete example on how to define and build
generic enumeration classes.


## Features and bugs
Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[analyzer]: https://pub.dev/packages/analyzer
[source_gen]: https://pub.dev/packages/source_gen
[generic_enum_example]: ../../generic_enum_example
[LibraryReader]: https://pub.dev/documentation/source_gen/latest/source_gen/LibraryReader-class.html
[GenericEnum]: https://pub.dev/documentation/generic_enum/latest/generic_enum/GenericEnum-class.html
[GenericEnumBuilder]: ../
[MapGenerator]: ../lib/src/map_generator.dart
[JsonGenerator]: ../lib/src/json_generator.dart