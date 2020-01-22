# Generic Enum Annotation


## Introduction

This library defines classes with const constructor used to annotate classes that extend `GenericEnum`.

`GenericEnum` is a base class for creating generic classes with a fixed set of static constant instances. These classes appear to the user of the library much like a Dart `enum` would. For example, generic enums can be used in `switch` statements, to initialize variables, or as default parameters in functions and constructors.

## Usage

In general, there is no need to explicitly include `generic_enum_annotation` in the list of dependencies. Instead,

To create a generic enum class, say `DpiResolution`, follow these steps:

1. Extend `GenericEnum<T>` where `T` is a Dart built-in type or a class with a const constructor.
2. Define a private `const` constructor that calls the super constructor and passes on the value of type `T`.
3. Define the static const instances of `DpiResolution`. You may capitalize instance names to mark them as constants.
4. Optionally: Create a *static final* field of type `BuiltMap<T,EnumClass>`to provide easy access to all values and instances.

```Dart
import 'package:built_collection/generic_enum.dart';
import 'package:generic_enum/generic_enum.dart';


//   1. Extend GenericEnum<T>
class DpiResolution extends GenericEnum<int> {

  // 2. Define a private const constructor that calls the super constructor
  //    and passes on the value of type int.
  const DpiResolution._(int) : super(value);

  // 3. Define static constant instances of type DpiResolution
  static const DpiResolution LOW = DpiResolution._(90);
  static const DpiResolution MEDIUM = DpiResolution._(300);
  static const DpiResolution HIGH = DpiResolution._(600);

  // 4. Define a private static field mapping each value to its instance.
  static BuiltMap<int,DpiResolution> get => _valueMap;

  // 5. Give access to serialization methods
  
}
```
The generation of the private variable `_valueMap`, as well as the functions
`_toJson()` and `_fromJson()` can be done with the source code generating libray `generic_enum_generator`.


## Examples

For a simple example on how to create and use a generic enum see:
[example.dart](https://github.com/simphotonics/generic_enum/blob/master/example/example.dart).


## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[analyzer]: https://pub.dev/packages/analyzer
[source_gen]: https://pub.dev/packages/source_gen
