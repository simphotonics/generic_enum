## 0.3.3

Amended docs.

## 0.3.2

Added extension `@GenerateValueExtension`. It is used to request the
generation of an extension providing getters for accessing the
enum instance `String` value and (optionally) a mapped value of arbitrary data-type.

## 0.3.1

Amended `README.md`, added section limitations.

## 0.3.0

Breaking change. Removed class `GenericEnum`. Using [extension-methods]
it is now possible to add json-methods to a standard Dart enum.
See README.md for update usage instructions.

## 0.2.9

Updated Dart docs.

## 0.2.8

Renamed annotation `GenerateFromJson`. It is now called `GenerateFromToJson` indicating that in fact the
builder generates two functions:`fromJson` and `toJson`.

## 0.2.7

Reversed changelog order.

## 0.2.6

Made `GenericEnum` abstract. Added method `toJson` and factory constructor `fromJson`.

## 0.2.5

Amended docs.

## 0.2.4

Removed dep on `json_annotation`.

## 0.2.3

Amended Dart docs.

## 0.2.2

Removed dependency on `generic_enum_annotation`. The new location of the annotations is `lib\src\annotations`.

## 0.2.1

Amended README.md.

## 0.2.0

Updated dependencies and docs.

## 0.1.9

Amended project homepage to:
[generic_enum](https://github.com/simphotonics/generic_enum/tree/master/generic_enum)

## 0.1.8

Amended project homepage.

## 0.1.7

Amended README.md.

## 0.1.6

Upgraded dependencies.

## 0.1.5

Amended documentation.

## 0.1.4

Amended section usage (prefix for gen. functions)

## 0.1.3

Added serialization tests.

## 0.1.2

Amended Dart docs.

## 0.1.1

Added Dart docs.

## 0.1.0

Added json-serialization.

## 0.0.6

Shortened library description.

## 0.0.5

Amended sample code in README.md.

## 0.0.4

Amended library description.

## 0.0.3

Changed GeneralizedEnum to GenericEnum.

## 0.0.2

Library now depends on built_collection.

## 0.0.1

Initial Version of the library.

[extension-methods]: https://dart.dev/guides/language/extension-methods