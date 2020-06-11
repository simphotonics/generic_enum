# Generic Enumeration Example

## Introduction

[GenericEnum] is a base class for creating enumeration classes with generic value type.
These classes appear to the user of the library much like a Dart `enum` would.
For example, generic enums can be used in `switch` statements, to initialize variables, or as
default parameters in functions and constructors.

## Build Process

The [main section](https://github.com/simphotonics/generic_enum) contains a step-by-step guide on how to define and build generic enumeration classes.

## Generic Enums as Annotations

[GenericEnum] classes have a constant constructor and as such can be used as *annotations*.
Annotations are commonly found in source code generating libraries.

Since generic enums are normal classes they can contain
methods and `final` fields in addition to the `value` field. The example below
includes the getters `isPrimary`, `isUnique`, `isNotNull`.

As an example, we could generate an annotation class, say `Constraint`, that enables users to
select a supported Sqlite constraint.
```Dart
import 'package:generic_enum/generic_enum.dart';

part 'constraint.g.dart';

@GenerateFromJson()
class Constraint extends GenericEnum<String> {
  const Constraint._(String value) : super(value);

  static const Constraint NOT_NULL = Constraint._('NOT NULL');
  static const Constraint PRIMARY_KEY = Constraint._('PRIMARY KEY');
  static const Constraint UNIQUE = Constraint._('UNIQUE');

  static Map<String, Constraint> get valueMap => _$ConstraintValueMap;
  factory Constraint.fromJson(Map<String,dynamic> json) => _$ConstraintFromJson(json);

  bool get isPrimary => (this == PRIMARY_KEY);
  bool get isUnique => (this == UNIQUE);
  bool get isNotNull => (this == NOT_NULL);
}
```

The `Constraint` class can be used to annotate a field in the data class `User`.
```Dart
import 'constraint.dart';
import 'table.dart';

@Table
class User{
  const User({@required this.id, @required this.userName});

  // Use generic enum as annotation
  @Constraint.PRIMARY_KEY
  final int id;

  @Constraint.NOT_NULL
  final String userName;
}
```

### Retrieving Annotations of Type Generic Enum

The recommended way of retrieving the value of an annotation of type [GenericEnum]
by using the class [ConstantReader] provided by the package [source_gen].
[ConstantReader] is a representation of a compile-time constant expression.

The following program demonstrates how to retrieve a constant of type `Constraint`.
In the simple example below, the function [initializeLibraryReaderForDirectory]
provided by [source_gen_test] is used to load the source code and initialize an object of type [LibraryReader].
In a standard setting this task is delegated to a [builder] that reads a builder
configuration and loads the relevant assets.


```Dart
import 'package:example/src/sqlite_type.dart' show Constraint;
import 'package:generic_reader/generic_reader.dart';
import 'package:source_gen/source_gen.dart' show ConstantReader;
import 'package:source_gen_test/src/init_library_reader.dart';


/// Demonstrates how to use [GenericReader] to read constants
/// with parameterized type from a static representation
/// of a compile-time constant expression
/// represented by a [ConstantReader].
Future<void> main() async {
  /// Reading library.
  final userLib = await initializeLibraryReaderForDirectory(
    'lib/src',
    'user.dart',
  );

  /// Get constantReader representing the annotation:
  final idCR = ConstantReader(userLib.classes.first.fields[0].
    metadata[0].computeConstantValue(),
  );

  /// Reading the annotation value of type [String].
  final value = cr.peek('value').stringValue;

  /// Retrieving the [GenericEnum] instance.
  final constraint = Constraint.valueMap[value];

  print('Retrieving an annotation of type [Constraint].');
  print(constraint);
  // Prints:
  // Retrieving an annotation of type [Constraint].
  // PRIMARY_KEY
}

```
For more information about source code generation see:
[analyzer] and [source_gen].

## Examples

For examples on how to create generic enums see:
[generic_enum_example].


## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[analyzer]: https://pub.dev/packages/analyzer
[builder]: https://github.com/dart-lang/build

[ConstantReader]: https://pub.dev/documentation/source_gen/latest/source_gen/ConstantReader-class.html

[GenericEnum]: https://pub.dev/packages/generic_enum
[generic_enum_example]: https://github.com/simphotonics/generic_enum/tree/master/generic_enum_example
[issue tracker]: https://github.com/simphotonics/generic_enum/issues

[source_gen]: https://pub.dev/packages/source_gen

[initializeLibraryReaderForDirectory]: https://pub.dev/documentation/source_gen_test/latest/source_gen_test/initializeLibraryReaderForDirectory.html

[LibraryReader]: https://pub.dev/documentation/source_gen/latest/source_gen/LibraryReader-class.html

[source_gen_test]: https://pub.dev/packages/source_gen_test
