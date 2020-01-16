# Generic Enumeration Classes for Dart
[![Build Status](https://travis-ci.org/google/built_value.dart.svg?branch=master)](https://travis-ci.org/google/built_value.dart)

## Introduction

Enumerations are ideal when we want to model *choosing* from a limited set of constant values.
In Dart, the value of an `enum` resolves to a `String`.

Generic Enum is a base class for creating generic classes with a fixed set of static constant
instances. These classes appear to the user of the software much like a Dart `enum` would.

## Boilerplate
To create a generic enum class, say `DpiResolution`, follow these steps:

1. Extend `GenericEnum<T>` where `T` is a Dart built-in type or a class with a const constructor.
2. Define a private `const` constructor that calls the super constructor and passes on the value of type `T`.
3. Define the static const instances of `DpiResolution`. You may capitalize instance names to mark them as constants.
4. Optionally: Create a private field of type `Map<T,EnumClass>` and a corresponding getter
  in order to provide easy access to all values and instances.

```Dart
import 'package:generic_enum/generic_enum.dart';

//   1. Extend GenericEnum<T>
class DpiResolution extends GeneralizedEnum<int> {

  // 2. Define a private const constructor that calls the super constructor
  //    and passes on the value of type int.
  const DpiResolution._(int) : super(value);

  // 3. Define static constant instances of type DpiResolution
  static const DpiResolution LOW = DpiResolution._(90);
  static const DpiResolution MEDIUM = DpiResolution._(300);
  static const DpiResolution HIGH = DpiResolution._(600);

  // 4. Define a private field mapping each value to its instance.
  static const Map<int, DpiResolution> _valueMap = {
    90: LOW,
    300: MEDIUM,
    600: HIGH,
  };

  // Provide access to _valueMap
  static get valueMap => _valueMap;
}
```
In principle, the creation of the `_valueMap`, the getter `valueMap`, and additional methods for serialization
could be done with a source code generator (see package built_value).
At least for simple value types it is straightforward
to serialize the value and retrieve the instance via the `valueMap`.

## Usage
Generic Enum instances are compile-time constants and can be
used as default parameters in constructors and functions.

To class `ScannerSettings` (defined below) illustrates the use of a generic enum.

The `value` of generic enums can be accessed directly using dot notation (like in the
initializer statement below).

```Dart
class ScannerSettings{

  const ScannerSettings({
    this.scanMode,
    this.size,
    this.dpiResolution = DpiResolution.Medium,
    },
  ):_dipRes = dpiResolution.value;

  final DpiResolution dpiResolution;
  final int _dpiRes;
  final ScanMode;
  final ScanSize;
}
```

## Generic Enum as Annotations

Generic enums have a constant constructor and as such can be used as annotations.
Annotations are commonly found in source code generating libraries.

Since generic enums are normal classes they can contain
methods and `final` fields in addition to the `value` field.

As an example, we could generate an annotation class, say `Constraint`, that helps users
select a supported Sqlite constraint.

```Dart
import 'package:generic_enum/generic_enum.dart';

class Constraint extends GenericEnum<String> {
  const Constraint._(String value) : super(value);

  static const Constraint NOT_NULL = Constraint._('NOT NULL');
  static const Constraint PRIMARY_KEY = Constraint._('PRIMARY KEY');
  static const Constraint UNIQUE = Constraint._('UNIQUE');

  static const Map<String, Constraint> _valueMap = {
    'NOT NULL': NOT_NULL,
    'PRIMARY KEY': PRIMARY_KEY,
    'UNIQUE': UNIQUE,
  };

  static get valueMap => _valueMap;

  bool get isPrimary => (this == PRIMARY_KEY);
  bool get isUnique => (this == UNIQUE);
  bool get isNotNull => (this == NOT_NULL);
}
```

The `Constraint` class could be used to annotate a field in the data class `User`.
```Dart
import 'constraint.dart';
import 'table.dart';

@Table
class User{
  const User({@required this.id, @required this.userName});

  // Use generic enum as annotation
  @Constraint.PRIMARY_KEY
  final int id;

  final String userName;
}
```

### Retrieving Annotations of Type Generic Enum

Using the package [analyzer], the data model can be traversed with the help of a
[SimpleElementVisitor](https://pub.dev/documentation/analyzer/latest/dart_element_visitor/SimpleElementVisitor-class.html).

When processing annotations (for example during source code generation: see method `_addConstraint` below),
the recommended way of retrieving an annotation of type generic enum
is via [source_gen]'s
[ConstantReader](https://pub.dev/documentation/source_gen/latest/source_gen/ConstantReader-class.html).

This is because the generic enum `value` field is located in the parent class and ConstantReader
searches parent classes if a field is not found in the current class.

```Dart
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:sqlite_entity/sqlite_entity.dart';
import 'package:source_gen/source_gen.dart' show TypeChecker, ConstantReader, ;
import 'package:sqlite_generator/src/type_utils.dart';

/// Used to traverse classed annotated with @Table
class TableVisitor extends SimpleElementVisitor {

  static var constraintChecker = TypeChecker.fromRuntime(Constraint);

  List<FieldElement> fields = [];

  /// Mapping field name to constraint.
  Map<String,List<Constraint>> constraints = {};

  @override
  visitFieldElement(FieldElement element) {
    fields.add(element);
    _addConstraint(element);
  }

  _addConstraint(FieldElement element){
    var annotation = element.metadata;

    if (annotation == null) return;

    // Check if annotation is of type Constraint.
    if (!_constraintChecker.isAssignableFromType(annotation)) return;

    // Read value of generic enum.
    // Note: ConstantReader searches for the field name 'value' in a
    // super class if it is not found in the annotation class.
    String annotationValue = ConstantReader(annotation.computeConstantValue).read('value').stringValue;

    // Retrieve the Constraint instance.
    var constraintInstance = Constraint.valueMap[annotationValue];
    this.constraints.add({element.name: constraintInstance});
  }
}
```
For more information about the topic of source code generation see the packages
[analyzer] and [source_gen].

## Examples

For a simple example on how to create a generic enum see:
[name_part.dart](https://github.com/simphotonics/generic_enum/example/name_part.dart).


## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[analyzer]: https://pub.dev/package/analyzer
[source_gen]: https://pub.dev/packages/source_gen
