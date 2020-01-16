import 'package:built_collection/built_collection.dart';
import 'package:generic_enum/generic_enum.dart';

/// Creating a GenericEnum class
///
///   1) Extend class:
class NamePart extends GenericEnum<String> {
  /// 2) Add a private const constructor:
  const NamePart._(String value) : super(value);

  /// 3) Add static const instances:
  static const NamePart FIRST_NAME = NamePart._('FIRST_NAME');
  static const NamePart LAST_NAME = NamePart._('LAST_NAME');

  /// 4) Add a private static const value map:
  static final valueMap = BuiltMap<String, NamePart>({
    'FIRST_NAME': FIRST_NAME,
    'LAST_NAME': LAST_NAME,
  });
}

/// Sample Data Class
class User {
  const User({this.firstName, this.lastName});

  final String firstName;
  final String lastName;

  @override
  String toString() {
    return '$firstName $lastName';
  }
}

/// Sample Class using a GenericEnum as a final variable
class SortableUserList {
  SortableUserList({
    List<User> users,
    // Using a GenericEnum as default parameter.
    this.sortBy = NamePart.FIRST_NAME,
  }) : this.users = List<User>.from(users) {
    /// Using a GenericEnum in a switch statement.
    switch (sortBy) {
      case NamePart.FIRST_NAME:
        this.users.sort((
              user1,
              user2,
            ) =>
                user1.firstName.compareTo(
                  user2.firstName,
                ));
        break;
      case NamePart.LAST_NAME:
        this.users.sort((
              user1,
              user2,
            ) =>
                user1.lastName.compareTo(
                  user2.lastName,
                ));
        break;
      default:
    }
  }

  List<User> users;
  final NamePart sortBy;

  @override
  String toString() {
    var buffer = StringBuffer();
    buffer.writeAll(users, ', ');
    return buffer.toString();
  }
}

/// To run this short program enter the following command followed by enter:
///
/// # dart example.dart
///
main(List<String> args) {
  final tom = User(firstName: 'Thomas', lastName: 'Fisher');
  final silvy = User(firstName: 'Silvia', lastName: 'Williams');
  final amy = User(firstName: 'Amelia', lastName: 'King');
  final john = User(firstName: 'John', lastName: 'Rowlands');

  final userList = [silvy, amy, john, tom];

  /// Using a generic enum as a constructor parameter.
  final firstUserList =
      SortableUserList(users: userList, sortBy: NamePart.FIRST_NAME);

  /// Using a generic enum as a constructor parameter.
  final secondUserList =
      SortableUserList(users: userList, sortBy: NamePart.LAST_NAME);

  /// Retrieving the GenericEnum instance from its value:
  NamePart namePart = NamePart.valueMap['FIRST_NAME'];
  assert(namePart == NamePart.FIRST_NAME);

  /// Printing the value of a generic enum.
  print('User list sorted by: ${firstUserList.sortBy}');
  print(firstUserList.toString());
  print('');

  print('User list sorted by: ${secondUserList.sortBy}');
  print(secondUserList.toString());
}
