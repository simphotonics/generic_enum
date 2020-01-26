# Generic Enum Builder

## Introduction

`GenericEnumBuilder` contains source code generating classes
based on [source_gen] and [analyzer].
The provided builder can be configured to build *generic enumeration* classes
supporting json-serialization.

*Generic enumeration* classes appear to the user like a Dart `enum` would.
For example, generic enums can be used in `switch` statements, as annotations,
to initialize variables, or as default parameters in functions and constructors.


## Configuration

To use this library the following configuration steps are required:

1. Include `generic_enum, generic_enum_annotation` as dependency in your pubspec.yaml file.
   Include `generic_enum_builder, source_gen, build_runner` as dev_dependencies.
2. Create a class extending `GenericEnum`. See [generic_enum#boilerplate].
3. Annotate the class with `@GenerateBuiltMap` and `@GenerateJsonToFrom`.
4. Configure the build targets. Amend the generate_for entry to point to the
   folder containing your generic enum classes.
   In your local `build.yaml` file add the following builders:
   ```Shell
   targets:
     $default:
       builders:
         # Configure the builder `pkg_name|builder_name`
         generic_enum_builder|map_builder:
           # Only run this builder on the specified input.
           enabled: true
           generate_for:
             - lib/*.dart
         # Configure the builder `pkg_name|builder_name`
         generic_enum_builder|json_builder:
           # Only run this builder on the specified input.
           enabled: true
           generate_for:
             - lib/*.dart
    ```

## Building

If you are using Flutter, build the project by running the command:
```Shell
$ flutter packages pub run build_runner build --delete-conflicting-outputs
```
If you are using the Dart SDK use:
```Shell
$ pub run build_runner build --delete-conflicting-outputs
```

## Examples

The package [generic_enum_example] provides a complete example on how to define and build
generic enumeration classes. As a starting point users could clone this repository, add
their own generic enum classes to the folder `lib` and build the library.


## Features and bugs
Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[analyzer]: https://pub.dev/packages/analyzer
[source_gen]: https://pub.dev/packages/source_gen
[generic_enum_example]: ../generic_enum_example
[generic_enum#boilerplate]: ../generic_enum#boilerplate
