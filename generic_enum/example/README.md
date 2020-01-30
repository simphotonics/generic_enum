# Generic Enumeration Example

## Introduction

`GenericEnum` is a base class for creating enumeration classes with generic value type.
These classes appear to the user of the library much like a Dart `enum` would.
For example, generic enums can be used in `switch` statements, to initialize variables, or as
default parameters in functions and constructors.

## Build Process

The [main section](https://github.com/simphotonics/generic_enum) contains a step-by-step guide on how to define and build generic enumeration classes.

## Generic Enums as Annotations

`GenericEnum` classes have a constant constructor and as such can be used as *annotations*. Annotations are commonly found in source code generating libraries.

Since generic enums are normal classes they can contain
methods and `final` fields in addition to the `value` field. The example below
includes the getters `isPrimary,isUnique,isNotNull`.

As an example, we could generate an annotation class, say `Constraint`, that helps users
select a supported Sqlite constraint.
```Dart
import 'package:generic_enum/generic_enum.dart';

class Constraint extends GenericEnum<String> {
  const Constraint._(String value) : super(value);

  static const Constraint NOT_NULL = Constraint._('NOT NULL');
  static const Constraint PRIMARY_KEY = Constraint._('PRIMARY KEY');
  static const Constraint UNIQUE = Constraint._('UNIQUE');

  static Map<String, Constraint> get valueMap => _valueMap;
  Map<String, dynamic> toJson() => _toJson(this);

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

  @Constraint.NOT_NULL
  final String userName;
}
```

### Retrieving Annotations of Type Generic Enum

Using the package [analyzer], the data model `User` can be traversed with the help of a
[SimpleElementVisitor](https://pub.dev/documentation/analyzer/latest/dart_element_visitor/SimpleElementVisitor-class.html).

When processing annotations (for example during source code generation: see method `_addConstraint` below),
the recommended way of retrieving an annotation of type `GenericEnum`
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

/// Sample visitor class used to traverse classed annotated with @Table
class TableVisitor extends SimpleElementVisitor {

  static var constraintChecker = TypeChecker.fromRuntime(Constraint);

  List<FieldElement> fields = [];
  Map<String,Constraint> constraints = {};

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
    if (!_constraintChecker.isAssignableFromType(annotation.type)) return;

    // Read value of generic enum.
    // Note: ConstantReader searches for the field name 'value' in a
    // super class if it is not found in the annotation class.
    String annotationValue = ConstantReader(
      annotation.computeConstantValue(),
    ).read('value').stringValue;

    // Retrieve the Constraint instance.
    var constraintInstance = Constraint.valueMap[annotationValue];
    this.constraints.add({element.name: constraintInstance});
  }
}
```
For more information about source code generation see:
[analyzer] and [source_gen].

## Examples

For examples on how to create generic enums see:
[generic_enum_example].


## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/generic_enum/issues
[analyzer]: https://pub.dev/packages/analyzer
[source_gen]: https://pub.dev/packages/source_gen
[generic_enum_example]: https://github.com/simphotonics/generic_enum/tree/master/generic_enum_example
