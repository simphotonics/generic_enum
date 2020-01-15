import 'package:generic_enum/generic_enum.dart';

/// Usage of GenericEnum:
///   1) Extend class:
class NamePart extends GenericEnum<String> {
  /// 2) Add a private const constructor:
  const NamePart._(String value) : super(value);

  /// 3) Add static const instances:
  static const NamePart FIRST_NAME = NamePart._('FIRST_NAME');
  static const NamePart LAST_NAME = NamePart._('LAST_NAME');

  /// 4) Add a private static const value map:
  static const Map<String, NamePart> _valueMap = {
    'FIRST_NAME': FIRST_NAME,
    'LAST_NAME': LAST_NAME,
  };

  /// 5) Add a getter to access the value map.
  static get valueMap => _valueMap;
}
